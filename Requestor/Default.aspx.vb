'Tim Garvin

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        'Navigates to a different page
        Response.Redirect("Service_Requests.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Requestor Main Page"
    End Sub
End Class
