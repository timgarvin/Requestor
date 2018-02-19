'Tim Garvin

Imports System.Data.SqlClient

Partial Class AddUpdate_Technician
    Inherits System.Web.UI.Page

    'Declares a data reader variable
    Private maxIDReader As SqlDataReader
    'Public building As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Initializes the data reader
        maxIDReader = CType(sqlMaxID.Select(DataSourceSelectArguments.Empty), SqlDataReader)

        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Register/Update Technicians"

        'Adds an empty item into the dropdown list for validation purposes
        ddlBuildings.Items.Add(" ")
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Checks to see if the page is valid before continuing
        If Page.IsValid Then
            'Attempts to do the following and throws an error if it fails
            Try
                'Declares and initializes a variable to hold the largest ID
                Dim maxID As Double = 1000

                'Grabs all rows from the tables to find and set the largest ID
                If maxIDReader.Read() Then
                    While maxIDReader.Read
                        If CType(maxIDReader.Item("TechnicianID").ToString, Double) > maxID Then
                            maxID = CType(maxIDReader.Item("TechnicianID").ToString, Double)
                        End If
                    End While

                    'Sets the parameter for an Insert depending if any IDs exist or not
                    sqlTechnicians.InsertParameters.Item("TechnicianID").DefaultValue = maxID + 1
                Else
                    sqlTechnicians.InsertParameters.Item("TechnicianID").DefaultValue = maxID
                End If

                'Inserts into the database
                sqlTechnicians.Insert()

                'Notifies the user of a successful submission
                lblResult.Text = "The information provided has been sucessfully submitted! Thank you."
            Catch ex As Exception
                'Displays an error if an error was produced
                lblResult.Text = "Apologies for any inconveniece. An error occurred in the loading of the page or in the attempt to process your request: " + ex.Message
            End Try
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub gvTechnicians_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvTechnicians.DataBinding

    End Sub

    Protected Sub gvTechnicians_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvTechnicians.DataBound
        'Dim row As DetailsViewRow

        'For Each row In dvSolution.Rows
        '    If row.Cells(0).Text = "Phone #" Then
        '        If row.Cells(1).Text.Length < 10 Or row.Cells(1).Text.Length > 13 Then
        '            'String.Format("{0:N}", row.Cells(1).Text)
        '            row.Cells(1).Text.Remove("(")
        '            row.Cells(1).Text.Remove(")")
        '            row.Cells(1).Text.Remove("-")
        '        End If
        '    End If
        'Next
    End Sub

    Protected Sub gvTechnicians_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvTechnicians.RowUpdated

    End Sub

    Protected Sub gvTechnicians_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvTechnicians.RowUpdating
        'Dim row As GridViewRow

        'For Each row In gvTechnicians.Rows
        '    If row.Cells(0).Text = "Building" Then
        '        building = row.Cells(3).Text
        '    End If
        'Next
    End Sub
End Class
