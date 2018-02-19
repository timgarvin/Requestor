'Tim Garvin

Imports System.Data.SqlClient

Partial Class Technician_MasterPage
    Inherits System.Web.UI.MasterPage

    'Declares variables for Session State
    Private SessionInfo As SortedList
    Private objSecurityLevel As New SecurityLevel

    'Declares data readers
    Private buildingsExists As SqlDataReader
    Private departmentsExists As SqlDataReader
    Private techniciansExists As SqlDataReader

    'Declares variables to aid in removing menuitems for the access restrictions
    Public techMain As Boolean = False
    Public techSearch As Boolean = False
    Public techPrintable As Boolean = False
    Public techHelp As Boolean = False
    Public techAbout As Boolean = False

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

            'Goes through the session data and assigns values accordingly
            For Each objCount In SessionInfo
                objSecurityLevel = CType(objCount.Value, SecurityLevel)

                If objSecurityLevel.GetAccess() = "T" Then
                    plRestricted.Visible = False
                    plTechnician.Enabled = True
                    plTechnician.Visible = True
                    lblTitle.Visible = True
                End If
            Next

            'Checks to see if all required tables hold values and if not denies access and redirects to the needed setup page
            If buildingsExists.Read() = False And departmentsExists.Read() = False And techniciansExists.Read() = False Then
                plRestricted.Visible = True
                plTechnician.Enabled = False
                plTechnician.Visible = False
                lblRestricted.Visible = False
                lblTempUnavailable.Visible = True
                Session.Abandon()
            End If
        End If
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function

    'Removes items from the menu for the current access level
    Protected Sub mTechnician_MenuItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mTechnician.MenuItemDataBound
        If e.Item.Text = "Main Page" And techMain = False Then
            mTechnician.Items.Remove(e.Item)
            techMain = True
        End If

        If e.Item.Text = "Secure User Accounts" Then
            mTechnician.Items.Remove(e.Item)
        End If

        If e.Item.Text = "Locations" Then
            mTechnician.Items.Remove(e.Item)
        End If

        If e.Item.Text = "Requests" And techSearch = False Then
            mTechnician.Items.Remove(e.Item)
            techSearch = True
        End If

        If e.Item.Text = "Archive" Then
            mTechnician.Items.Remove(e.Item)
        End If

        If e.Item.Text = "Printable Reports" And techPrintable = False Then
            mTechnician.Items.Remove(e.Item)
            techPrintable = True
        End If

        If e.Item.Text = "Help" And techHelp = False Then
            mTechnician.Items.Remove(e.Item)
            techHelp = True
        End If

        If e.Item.Text = "About" And techAbout = False Then
            mTechnician.Items.Remove(e.Item)
            techAbout = True
        End If
    End Sub
End Class

