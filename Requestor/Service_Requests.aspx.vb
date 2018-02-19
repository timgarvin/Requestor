'Tim Garvin

Imports System.Data.SqlClient

Partial Class Service_Requests
    Inherits System.Web.UI.Page

    'Declares data readers
    Private srMaxID As SqlDataReader
    Private archiveMaxID As SqlDataReader
    Private buildingsActive As SqlDataReader
    Private deptsActive As SqlDataReader
    Private techniciansActive As SqlDataReader

    'Declares variables for Session State
    Private ResultsSession As SortedList
    Private objSecurityLevel As New SecurityLevel

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Service Request Submission"

        'Initializes the data readers
        srMaxID = CType(sqlSRMaxID.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        archiveMaxID = CType(sqlArchiveMaxID.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        buildingsActive = CType(sqlBuildings.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        deptsActive = CType(sqlDepartments.Select(DataSourceSelectArguments.Empty), SqlDataReader)
        techniciansActive = CType(sqlTechniciansActive.Select(DataSourceSelectArguments.Empty), SqlDataReader)

        'Checks to see if the required tables hold data and if not sets the page as Temporarily Under Construction
        If buildingsActive.Read() And deptsActive.Read() And techniciansActive.Read() Then
            'Displays the Service_Requests panel
            'plService_Requests.Enabled = True
            'plService_Requests.Visible = True

            'Adds an empty item in the dropdown list for validation purposes
            ddlDepartment.Items.Add(" ")

            'Attempts to do the following and throws an error if it fails
            Try
                'Declares and initializes a variable to hold the largest ID
                Dim maxID As Double = 1000

                'Grabs all rows from the tables to find and set the largest ID
                If srMaxID.Read() And archiveMaxID.Read() Then
                    While srMaxID.Read
                        If CType(srMaxID.Item("RequestID").ToString, Double) > maxID Then
                            maxID = CType(srMaxID.Item("RequestID").ToString, Double)
                        End If
                    End While

                    While archiveMaxID.Read
                        If CType(archiveMaxID.Item("RequestID").ToString, Double) > maxID Then
                            maxID = CType(archiveMaxID.Item("RequestID").ToString, Double)
                        End If
                    End While

                    'Sets the Request Number textbox depending if any IDs exist or not
                    txtRequestNum.Text = maxID + 1
                Else
                    txtRequestNum.Text = maxID
                End If
            Catch ex As Exception
                'Displays an error if an error was produced
                lblResult.Text = "Apologies for any inconveniece. An error occurred while trying to load a new Service Request #: " + ex.Message
            End Try
        Else
            'Sets the Temporary Unavailable label on the Master page to Temporarily Under Construction and hides the rest of the page
            Dim tempUnavailable As Label = CType(Master.FindControl("lblTempUnavailable"), Label)

            'plService_Requests.Enabled = False
            'plService_Requests.Visible = False
            tempUnavailable.Text = "Temporarily Under Construction"
            tempUnavailable.Visible = True
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        'Checks to see if the page is valid before continuing
        If Page.IsValid Then
            'Attempts to do the following and throws an error if it fails
            Try
                If ddlReqType.SelectedItem.Text = "Hardware" And txtComputerNum.Text IsNot Nothing Then
                    sqlServiceRequests.InsertParameters("InventoryNum").DefaultValue = txtComputerNum.Text
                Else
                    sqlServiceRequests.InsertParameters("InventoryNum").DefaultValue = DBNull.Value.ToString
                End If

                sqlServiceRequests.InsertParameters("RequestDate").DefaultValue = DateTime.Now

                sqlServiceRequests.Insert()

                GoToResults("Valid")
            Catch ex As Exception
                GoToResults(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub ddlReqType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlReqType.SelectedIndexChanged
        'Hides or shows the Inventory Number textbox and label depending on whats selected
        If ddlReqType.SelectedItem.Text = "Hardware" Then
            lblComputerNum.Visible = True
            txtComputerNum.Visible = True
        Else
            lblComputerNum.Visible = False
            txtComputerNum.Visible = False
        End If
    End Sub

    Protected Sub GoToResults(ByVal message As String)
        'Checks to see if the statements executed before this was called were valid
        If message = "Valid" Then
            'Sets the Session State with the value Valid and tells the user their submission was successful
            objSecurityLevel.ResultsStatus = "Valid"
            objSecurityLevel.Results = "The information provided has been sucessfully submitted! Thank you."

            ResultsSession = GetID()

            Dim result As String = objSecurityLevel.ResultsStatus

            If ResultsSession.ContainsKey(result) Then
                objSecurityLevel = CType(ResultsSession(result), SecurityLevel)
            Else
                ResultsSession.Add(result, objSecurityLevel)
            End If

            Response.Redirect("Results.aspx", False)
        Else
            'Sets the Session State with the value Error and tells the user there was an error
            objSecurityLevel.ResultsStatus = "Error"
            objSecurityLevel.Results = "Apologies for any inconveniece. An error occurred in the loading of the page or in the attempt to process your request: " + message

            ResultsSession = GetID()

            Dim result As String = objSecurityLevel.ResultsStatus

            If ResultsSession.ContainsKey(result) Then
                objSecurityLevel = CType(ResultsSession(result), SecurityLevel)
            Else
                ResultsSession.Add(result, objSecurityLevel)
            End If

            Response.Redirect("Results.aspx", False)
        End If
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        'Resets the form and clears all entered information
        lblResult.Text = Nothing
        lbBuilding.SelectedIndex = -1
        ddlDepartment.SelectedIndex = -1
        txtRoom.Text = Nothing
        ddlReqType.SelectedIndex = -1
        txtComputerNum.Text = Nothing
        txtName.Text = Nothing
        txtPhoneNum.Text = Nothing
        txtEmail.Text = Nothing
        ddlPriority.SelectedIndex = -1
        txtDescription.Text = Nothing
    End Sub
End Class
