'Tim Garvin

Partial Class Tech_RequestFind
    Inherits System.Web.UI.Page

    'Returns any values if they match the search criteria
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Search/Browse Requests"
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        'Sets the selection command for the search
        sqlRequestSearch.SelectCommand = "SELECT * FROM ServiceRequests WHERE " & ddlSearchType.SelectedValue.ToString & " = " & "'" & txtSearch.Text & "'"

        'Shows the results of the search
        dvSearch.Visible = True
    End Sub

    Protected Sub dvSearch_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvSearch.Load
        'Sets the selection command for the search
        sqlRequestSearch.SelectCommand = "SELECT * FROM ServiceRequests WHERE " & ddlSearchType.SelectedValue.ToString & " = " & "'" & txtSearch.Text & "'"

        'Sets the text to display if no results are found
        dvSearch.EmptyDataText = "No resuls found when searching by " & ddlSearchType.SelectedItem.Text & " for " & txtSearch.Text
    End Sub
End Class
