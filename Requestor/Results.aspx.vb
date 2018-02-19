'Tim Garvin

Partial Class Results
    Inherits System.Web.UI.Page

    'Declares variables for Session State
    Private SessionInfo As SortedList
    Private objSecurityLevel As New SecurityLevel

    'Declares and initializes variables to help decide where btnMain should take the user
    Private level As String
    Private checkAdmin As String = "A"
    Private checkTech As String = "T"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Checks to see if the page is not posting back to the server and if not sets btnPrevious to the previously visited page
        If Not IsPostBack() Then
            'Checks to see if there was a previous page visited
            If Request.UrlReferrer.AbsoluteUri IsNot Nothing Then
                btnPrevious.PostBackUrl = Request.UrlReferrer.AbsoluteUri
            End If
        End If

        'Grabs the ID for the current session
        SessionInfo = GetID()

        'Declares the DictionaryEntry variable for the session
        Dim objCount As DictionaryEntry


        'Goes through the session data and assigns values accordingly
        For Each objCount In SessionInfo
            objSecurityLevel = CType(objCount.Value, SecurityLevel)

            If objSecurityLevel.GetAccess() IsNot Nothing Then
                level = objSecurityLevel.GetAccess()
            End If

            If objSecurityLevel.Results IsNot Nothing Then
                lblResult.Text = objSecurityLevel.Results
            End If

            If objSecurityLevel.ResultsStatus IsNot Nothing Then
                If objSecurityLevel.ResultsStatus = "Error" Then
                    btnMain.Visible = False
                    btnPrevious.Visible = True
                Else
                    btnMain.Visible = True
                    btnPrevious.Visible = True
                End If
            End If
        Next

        'Sets btnMain as Visible if both btnMain and btnPrevious are not Visible
        If btnPrevious.Visible = False And btnMain.Visible = False Then
            btnMain.Visible = True
        End If
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function

    'Sends the user to one of the main pages depending upon what the access level is set to in Session State
    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        If level = checkAdmin Then
            Response.Redirect("Administrator_Main.aspx")
        ElseIf level = checkTech Then
            Response.Redirect("Technician_Main.aspx")
        Else
            Response.Redirect("Default.aspx")
        End If
    End Sub
End Class
