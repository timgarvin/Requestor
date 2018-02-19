'Tim Garvin

Partial Class Help_CancelRequest
    Inherits System.Web.UI.Page

    'Declares variables for Session State
    Private SessionInfo As SortedList
    Private objSecurityLevel As New SecurityLevel

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
                    plCancelRequest.Enabled = True
                    plCancelRequest.Visible = True
                End If
            Next
        End If
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        'Send the user back to the Technician Main Page
        Response.Redirect("Administrator_Main.aspx")
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function
End Class
