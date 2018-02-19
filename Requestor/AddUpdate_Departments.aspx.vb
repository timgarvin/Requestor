'Tim Garvin

Imports System.Data.SqlClient

Partial Class AddUpdate_Department
    Inherits System.Web.UI.Page

    'Declares a data reader variable
    Private maxIDReader As SqlDataReader

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Checks to see if the page is valid before continuing
        If Page.IsValid Then
            'Attempts to do the following and throws an error if it fails
            Try
                'Declares and initializes a variable to hold the largest ID
                Dim maxID As Double = 1000

                'Grabs all rows from the tables to find and set the largest ID
                If maxIDReader.Read() Then
                    While maxIDReader.Read()
                        If CType(maxIDReader.Item("DepartmentID").ToString, Double) > maxID Then
                            maxID = CType(maxIDReader.Item("DepartmentID").ToString, Double)
                        End If
                    End While

                    'Sets the parameter for an Insert depending if any IDs exist or not
                    sqlDepartments.InsertParameters.Item("DepartmentID").DefaultValue = maxID + 1
                Else
                    sqlDepartments.InsertParameters.Item("DepartmentID").DefaultValue = maxID
                End If

                'Inserts into the database
                sqlDepartments.Insert()

                'Notifies the user of a successful submission
                lblResult.Text = "The information provided has been sucessfully submitted! Thank you."
            Catch ex As Exception
                'Displays an error if an error was produced
                lblResult.Text = "Apologies for any inconveniece. An error occurred in the loading of the page or in the attempt to process your request: " + ex.Message
            End Try
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Initializes the data reader
        maxIDReader = CType(sqlMaxID.Select(DataSourceSelectArguments.Empty), SqlDataReader)

        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Add/Update Departments"
    End Sub
End Class
