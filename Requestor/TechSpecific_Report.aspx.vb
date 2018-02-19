'Tim Garvin

Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine

Partial Class Unsolved_Requests_Report
    Inherits System.Web.UI.Page

    'Declares variables for Session State
    Private SessionInfo As SortedList
    Private objSecurityLevel As New SecurityLevel

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the connection string for the Crystal Report
        Dim ConnInfo As New ConnectionInfo

        With ConnInfo
            .ServerName = "gaming.tstc.edu"
            .DatabaseName = "ServiceRequest"
            .UserID = "tim"
            .Password = "garvin"
        End With

        For Each cnInfo As TableLogOnInfo In Me.crvUnsolved.LogOnInfo
            cnInfo.ConnectionInfo = ConnInfo
        Next

        'Disables the browser cache to ensure a page cannot be accessed after being logged out
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)

        'Grabs the ID for the current session
        SessionInfo = GetID()

        'Ensures the page is not posting back to the server
        If Not IsPostBack() Then
            'Declares the DictionaryEntry variable for the session
            Dim objCount As DictionaryEntry

            'Goes through the session data and assigns values accordingly
            For Each objCount In SessionInfo
                objSecurityLevel = CType(objCount.Value, SecurityLevel)

                If objSecurityLevel.GetAccess() = "T" Then
                    plRestricted.Visible = False
                    plReport.Enabled = True
                    plReport.Visible = True
                End If
            Next
        End If
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function

    Protected Sub crsUnsolved_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles crsUnsolved.DataBinding

    End Sub

    'Automatically loads the needed parameter for the Crystal Report from Session State
    Protected Sub crvUnsolved_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles crvUnsolved.Load
        SessionInfo = GetID()

        If Not IsPostBack() Then
            Dim objCount As DictionaryEntry

            For Each objCount In SessionInfo
                objSecurityLevel = CType(objCount.Value, SecurityLevel)

                If objSecurityLevel.GetBuildingID() IsNot Nothing Then
                    crsUnsolved.Report.Parameters.Item(0).DefaultValue = objSecurityLevel.GetBuildingID()
                End If
            Next
        End If
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        'Send the user back to the Technician Main Page
        Response.Redirect("Technician_Main.aspx")
    End Sub
End Class
