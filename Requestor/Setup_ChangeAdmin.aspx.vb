'Tim Garvin

Partial Class Setup_ChangeAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Initial Setup: Change Default Administrator Account"

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
    End Sub

    Protected Sub btnChange_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChange.Click
        'Checks to see if the page is valid before continuing
        If Page.IsValid Then
            'Attempts to do the following and throws an error if it fails
            Try
                'Changes the default administrator login
                sqlChange.Update()

                'Tells the user their submission was successful
                lblResult.Text = "Default Administrator has been successfully changed! Be sure and remember your newly created Administrator login. To proceed in the Requestor setup please click the Continue button below."

                'Hides the change button to emphasize continuing onward and disallowing them to change the login again unneedingly
                btnContinue.Visible = True
                btnChange.Visible = False
            Catch ex As Exception
                'Displays an error if an error was produced
                lblResult.Text = "Apologies for any inconveniece. An error occurred in the loading of the page or in the attempt to process your request: " + ex.Message
            End Try
        End If
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        'Sends the user to the second Initial Setup page
        Response.Redirect("Setup_AddBuildings.aspx")
    End Sub
End Class
