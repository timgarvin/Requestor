'Tim Garvin

Imports System.Data.SqlClient

Partial Class Setup_AddTechnicians
    Inherits System.Web.UI.Page

    'Declares data readers
    Private maxIDReader As SqlDataReader
    Private techniciansActive As SqlDataReader

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'Checks to see if the page is valid before continuing
        If Page.IsValid Then
            'Attempts to do the following and throws an error if it fails
            Try
                'Declares and initializes a variable to hold the largest ID
                Dim maxID As Double = 1000

                'Grabs all rows from the table to find and set the largest ID
                If maxIDReader.Read() Then
                    While maxIDReader.Read
                        If CType(maxIDReader.Item("TechnicianID").ToString, Double) > maxID Then
                            maxID = CType(maxIDReader.Item("TechnicianID").ToString, Double)
                        End If
                    End While

                    'Sets the parameter for an Insert depending if any IDs exist or not
                    sqlTechnicians.InsertParameters.Item("TechnicianID").DefaultValue = maxID + 1
                Else
                    sqlTechnicians.InsertParameters.Item("TechnicianID").DefaultValue = "1000"
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

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        'Sends the user to the next setup page or displays an error depending on the status
        If techniciansActive.Read() = False Then
            lblResult.Text = "There are no technicians with a status of 'Active' or none exist. Please add a new technician or change an already existing technician's status to continue."
        ElseIf maxIDReader.Read() Then
            Response.Redirect("Administrator_Main.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Initial Setup: Register Technicians"

        'Adds an empty item to the dropdown list for validation purposes
        ddlBuildings.Items.Add(" ")

        'Disables the navigation controls and the restricted panel and enables the Administrator panel on the master page for setup
        Dim menuAdmin As Menu = CType(Master.FindControl("mAdministrator"), Menu)
        Dim smpAdmin As SiteMapPath = CType(Master.FindControl("smpAdministrator"), SiteMapPath)
        Dim plRestricted As Panel = CType(Master.FindControl("plRestricted"), Panel)
        Dim plAdministrator As Panel = CType(Master.FindControl("plAdministrator"), Panel)

        menuAdmin.Enabled = False
        menuAdmin.Visible = False
        smpAdmin.Enabled = False
        smpAdmin.Visible = False
        plRestricted.Visible = False
        plAdministrator.Enabled = True
        plAdministrator.Visible = True

        'Initializes the data readers
        maxIDReader = CType(sqlMaxID.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        techniciansActive = CType(sqlTechniciansActive.Select(DataSourceSelectArguments.Empty), SqlDataReader)
    End Sub
End Class
