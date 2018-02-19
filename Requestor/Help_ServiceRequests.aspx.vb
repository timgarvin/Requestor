'Tim Garvin

Partial Class Help_ServiceRequests
    Inherits System.Web.UI.Page

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        'Returns the user to the main page
        Response.Redirect("Default.aspx")
    End Sub
End Class
