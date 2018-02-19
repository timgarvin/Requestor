'Tim Garvin

Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page

    'Declares variables for Session State
    Private LoginSession As SortedList
    Private objSecurityLevel As New SecurityLevel
    Private level As String
    Private initial_user As String = "admin"
    Private initial_pass As String = "r3qu3stor"

    'Declares data readers
    Private adminReader As SqlDataReader
    Private techReader As SqlDataReader
    Private adminExistsReader As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Administrator/Technician Login"

        'Enables and makes visible the Login panel
        plLogin.Enabled = True
        plLogin.Visible = True

        'Initializes the data readers
        adminReader = CType(dsAdmin.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        techReader = CType(dsTechnician.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        adminExistsReader = CType(sqlAdminExists.Select(DataSourceSelectArguments.Empty), SqlDataReader)

        'Sets the focus of the cursor to the Username textbox
        txtUsername.Focus()

        'Ensures the page is not posting back to the server
        If Not IsPostBack() Then
            'Hides the hyperlink on the master page
            Dim myHyperlink As HyperLink
            myHyperlink = CType(Master.FindControl("hlAdminTechLogin"), HyperLink)
            myHyperlink.Visible = False

            'If no administrators exist Insert the default login
            If adminExistsReader.Read() = False Then
                sqlInitialAdmin.InsertParameters("AdministratorID").DefaultValue = "1000"
                sqlInitialAdmin.InsertParameters("Username").DefaultValue = "admin"
                sqlInitialAdmin.InsertParameters("Password").DefaultValue = "r3qu3stor"
                sqlInitialAdmin.InsertParameters("Name").DefaultValue = "Administrator"
                sqlInitialAdmin.InsertParameters("Email").DefaultValue = "admin@admin.com"
                sqlInitialAdmin.InsertParameters("Status").DefaultValue = "Active"
                sqlInitialAdmin.Insert()
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

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        'Checks to see if the Administrators table returned anything based on the login entry
        If adminReader.Read() Then
            'Sets the access level
            objSecurityLevel.SetAccess("A")

            'Grabs the ID for the current session
            LoginSession = GetID()

            'Sets the level variable to the currently set access level
            level = objSecurityLevel.GetAccess()

            'Adds/Retrieves session data
            If LoginSession.ContainsKey(level) Then
                objSecurityLevel = CType(LoginSession(level), SecurityLevel)
            Else
                LoginSession.Add(level, objSecurityLevel)
            End If

            'Checks to see if the login is the default initial setup account
            If txtUsername.Text = initial_user AndAlso txtPassword.Text = initial_pass Then
                Response.Redirect("Setup_ChangeAdmin.aspx")
            Else
                Response.Redirect("Administrator_Main.aspx")
            End If
            'Checks to see if the Technicians table returned anything based on the login entry
        ElseIf techReader.Read() Then
            'Sets the access level and IDs
            objSecurityLevel.SetAccess("T")
            objSecurityLevel.SetTechnicianID(techReader.Item("TechnicianID").ToString)
            objSecurityLevel.SetBuildingID(techReader.Item("BuildingID").ToString)

            'Grabs the ID for the current session
            LoginSession = GetID()

            'Sets the level variable to the currently set access level
            level = objSecurityLevel.GetAccess()

            'Adds/Retrieves session data
            If LoginSession.ContainsKey(level) Then
                objSecurityLevel = CType(LoginSession(level), SecurityLevel)
            Else
                LoginSession.Add(level, objSecurityLevel)
            End If

            'Sends the user to the Main Page for Technicians
            Response.Redirect("Technician_Main.aspx")
        Else
            'Resets the page and displays an error message if the login does not exist
            txtUsername.Text = Nothing
            txtPassword.Text = Nothing
            lblIncorrect.Visible = True
        End If
    End Sub
End Class
