'Tim Garvin

Imports System.Data.SqlClient

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    'Declares variables for Session State
    Private SessionInfo As SortedList
    Private objSecurityLevel As New SecurityLevel

    'Declares data readers
    Private buildingsExists As SqlDataReader
    Private departmentsExists As SqlDataReader
    Private techniciansExists As SqlDataReader
    Private initialAdminReader As SqlDataReader

    'Declares variables to aid in removing menuitems for the access restrictions
    Public adminMain As Boolean = True
    Public adminRequests As Boolean = True
    Public adminPrintable As Boolean = True
    Public adminHelp As Boolean = True
    Public adminAbout As Boolean = True

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Disables the browser cache to ensure a page cannot be accessed after being logged out
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)

        'Grabs the ID for the current session
        SessionInfo = GetID()

        'Ensures the page is not posting back to the server
        If Not IsPostBack() Then

            'Declares the DictionaryEntry variable for the session
            Dim objCount As DictionaryEntry

            'Initializes the data readers
            buildingsExists = CType(sqlBuildingsExists.Select(DataSourceSelectArguments.Empty), SqlDataReader)
            departmentsExists = CType(sqlDepartmentsExists.Select(DataSourceSelectArguments.Empty), SqlDataReader)
            techniciansExists = CType(sqlTechniciansExists.Select(DataSourceSelectArguments.Empty), SqlDataReader)
            initialAdminReader = CType(sqlInitialAdmin.Select(DataSourceSelectArguments.Empty), SqlDataReader)

            'Goes through the session data and assigns values accordingly
            For Each objCount In SessionInfo
                objSecurityLevel = CType(objCount.Value, SecurityLevel)

                If objSecurityLevel.GetAccess() = "A" Then
                    plRestricted.Visible = False
                    plAdministrator.Enabled = True
                    plAdministrator.Visible = True
                    lblTitle.Visible = True
                End If
            Next

            Dim pageName As String = System.IO.Path.GetFileName(System.Web.HttpContext.Current.Request.Url.AbsolutePath)

            'Checks to see if the account of the default administrator exists in the database and if the current page is a setup page and
            'if so shows otherwise hidden controls for initial setup
            If initialAdminReader.Read() Or pageName = "Setup_AddBuildings.aspx" _
                Or pageName = "Setup_AddDepartments.aspx" Or pageName = "Setup_AddTechnicians.aspx" Then
                plRestricted.Visible = False
                plAdministrator.Enabled = True
                plAdministrator.Visible = True
                lblTitle.Visible = True
                'Checks to see if all required tables hold values and if not denies access and redirects to the needed setup page
            ElseIf buildingsExists.Read() = False And departmentsExists.Read() = False And techniciansExists.Read() = False Then
                plRestricted.Visible = True
                plAdministrator.Enabled = False
                plAdministrator.Visible = False
                lblRestricted.Visible = False
                lblTempUnavailable.Visible = True
                lblTitle.Visible = True
                btnContinue.Visible = True
                btnContinue.Enabled = True
            End If
        End If

        'Dim mnuAdmin As MenuItem = mAdministrator.Items(0)
        'Dim helpSubMenuItem As MenuItem = mAdministrator.FindItem("Help")
        'mnuAdmin.ChildItems.Remove(helpSubMenuItem)
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function

    Protected Sub mAdministrator_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mAdministrator.MenuItemClick

    End Sub

    'Removes items from the menu for the current access level
    Protected Sub mAdministrator_MenuItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mAdministrator.MenuItemDataBound
        If e.Item.Text = "Main Page" Then
            If adminMain = False Then
                mAdministrator.Items.Remove(e.Item)
            End If

            adminMain = False
        End If


        If e.Item.Text = "Requests" Then
            If adminRequests = False Then
                mAdministrator.Items.Remove(e.Item)
            End If

            adminRequests = False
        End If

        If e.Item.Text = "Printable Reports" Then
            If adminPrintable = False Then
                mAdministrator.Items.Remove(e.Item)
            End If

            adminPrintable = False
        End If

        If e.Item.Text = "Help" Then
            If adminHelp = False Then
                mAdministrator.Items.Remove(e.Item)
            End If

            adminHelp = False
        End If

        If e.Item.Text = "About" Then
            If adminAbout = False Then
                mAdministrator.Items.Remove(e.Item)
            End If

            adminAbout = False
        End If
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        'Sends the user to one of the setup pages depending on what data is missing
        If buildingsExists.Read() = False Then
            Response.Redirect("Setup_AddBuildings.aspx")
        ElseIf departmentsExists.Read() = False Then
            Response.Redirect("Setup_AddDepartments.aspx")
        ElseIf techniciansExists.Read() = False Then
            Response.Redirect("Setup_AddTechnicians.aspx")
        End If
    End Sub
End Class

