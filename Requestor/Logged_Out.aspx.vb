'Tim Garvin

Partial Class Logged_Out
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Destroys the current session to log out the user
        Session.Abandon()

        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Logged Out"
    End Sub

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        'Returns the user to the main page
        Response.Redirect("Default.aspx")
    End Sub
End Class
