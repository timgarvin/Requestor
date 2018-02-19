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


                If objSecurityLevel.GetAccess() = "A" Then
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

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        'Send the user back to the Administrator Main Page
        Response.Redirect("Administrator_Main.aspx")
    End Sub

    'Displays the Crystal Report
    Protected Sub btnDisplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDisplay.Click
        If Page.IsValid Then
            crvUnsolved.Visible = True
        End If
    End Sub

    'Disables and turns grey the days after today on the calendar
    Protected Sub calUnsolvedFrom_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calStartDate.DayRender
        If e.Day.Date > DateTime.Now Then
            e.Cell.BackColor = System.Drawing.Color.LightGray
            e.Day.IsSelectable = False
        End If
    End Sub

    'Disables and turns grey the days after today on the calendar
    Protected Sub calUnsolvedTo_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calEndDate.DayRender
        If e.Day.Date > DateTime.Now Then
            e.Cell.BackColor = System.Drawing.Color.LightGray
            e.Day.IsSelectable = False
        End If
    End Sub

    Protected Sub calStartDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles calStartDate.SelectionChanged
        'Places the selected date and minimum time in the hidden textbox for validation and CrystalReportSource parameter usage
        txtStartDate.Text = calStartDate.SelectedDate()
    End Sub

    Protected Sub calEndDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles calEndDate.SelectionChanged
        'Places the selected date and maximum time in the hidden textbox for validation and CrystalReportSource parameter usage
        txtEndDate.Text = calEndDate.SelectedDate() & " 11:59:59 PM"
    End Sub
End Class
