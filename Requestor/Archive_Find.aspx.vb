'Tim Garvin

Partial Class Archive_Find
    Inherits System.Web.UI.Page

    'Returns any values if they match the search criteria
    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        'Sets the selection command for the search
        sqlArchiveSearch.SelectCommand = "SELECT * FROM Archive WHERE " & ddlSearchType.SelectedValue.ToString & " = " & "'" & txtSearch.Text & "'"

        'Shows the results of the search
        dvSearch.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Search/Browse Archive"
    End Sub

    Protected Sub dvSearch_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvSearch.Load
        'Sets the selection command for the search
        sqlArchiveSearch.SelectCommand = "SELECT * FROM ServiceRequests WHERE " & ddlSearchType.SelectedValue.ToString & " = " & "'" & txtSearch.Text & "'"

        'Sets the text to display if no results are found
        dvSearch.EmptyDataText = "No resuls found when searching by " & ddlSearchType.SelectedItem.Text & " for " & txtSearch.Text
    End Sub
End Class
