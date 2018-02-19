'Tim Garvin

Imports System.Data.SqlClient

Partial Class Add_Solution
    Inherits System.Web.UI.Page

    'Declares variables for Session State
    Private SessionInfo As SortedList
    Private ResultsSession As SortedList
    Private objSecurityLevel As New SecurityLevel

    'Declares a data reader
    Private reqStatus As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Add Solution"

        'Attempts to do the following and throws an error if it fails
        Try
            'Grabs the ID for the current session
            SessionInfo = GetID()

            'Declares the DictionaryEntry variable for the session
            Dim objCount As DictionaryEntry

            'Goes through the session data and assigns values accordingly
            For Each objCount In SessionInfo
                objSecurityLevel = CType(objCount.Value, SecurityLevel)

                If objSecurityLevel.GetTechnicianID() IsNot Nothing Then
                    sqlSolution.UpdateParameters("TechnicianID").DefaultValue = objSecurityLevel.GetTechnicianID()
                End If
            Next
        Catch ex As Exception
            'Returns a message after an error
            lblResult.Text = "Apologies for any inconveniece. An error occurred in the loading of the page or in the attempt to process your request: " + ex.Message
        End Try
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        'Checks to see if the page is valid before continuing
        If Page.IsValid Then
            'Initializes the data reader
            reqStatus = CType(sqlRequestStatus.Select(DataSourceSelectArguments.Empty), SqlDataReader)

            'Attempts to do the following and throws an error if it fails
            Try
                'Checks if the data reader returns anything
                If reqStatus.Read() Then
                    'Sets parameters for updating
                    sqlSolution.UpdateParameters("SolutionDate").DefaultValue = calDateCompleted.SelectedDate() & " " & txtHour.Text & ":" & txtMinute.Text & ":00 " & ddlAMPM.SelectedItem.Text
                    sqlSolution.UpdateParameters("Status").DefaultValue = "Solved"

                    'Updates the database
                    sqlSolution.Update()
                Else
                    'Tells the user it has already been taken care of
                    lblResult.Text = "This request has already been solved."
                End If

                'Notifies the user of a successful submission
                lblResult.Text = "The information provided has been sucessfully submitted! Thank you."

                'Clears the page
                txtRequestID.Text = Nothing
                dvSolution.Visible = False
                txtHour.Text = Nothing
                txtMinute.Text = Nothing
                ddlAMPM.SelectedIndex = -1
                txtDateCompleted.Text = Nothing
                txtSolution.Text = Nothing
            Catch ex As Exception
                'Displays an error if an error was produced
                lblResult.Text = "Apologies for any inconveniece. An error occurred in the loading of the page or in the attempt to process your request: " + ex.Message
            End Try
        End If
    End Sub

    Protected Sub calDateCompleted_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calDateCompleted.DayRender
        'Disables all the dates after today on the calendar
        If e.Day.Date > DateTime.Now Then
            e.Cell.BackColor = System.Drawing.Color.LightGray
            e.Day.IsSelectable = False
        End If
    End Sub

    Protected Sub calDateCompleted_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles calDateCompleted.SelectionChanged
        'Places the selected date in the hidden textbox for validation
        txtDateCompleted.Text = calDateCompleted.SelectedDate()
    End Sub

    'Gets/sets the ID for the Session
    Private Function GetID() As SortedList
        If Session("SL") Is Nothing Then
            Session.Add("SL", New SortedList)
        End If

        Return CType(Session("SL"), SortedList)
    End Function

    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShow.Click
        'Selects from the database to display the details
        sqlSolution.Select(DataSourceSelectArguments.Empty)

        'Shows the details of the ID
        dvSolution.Visible = True
    End Sub

    Protected Sub txtRequestID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRequestID.TextChanged
        'Resets the message label
        If txtRequestID.Text IsNot Nothing Then
            lblResult.Text = Nothing
        End If
    End Sub

    Protected Sub dvSolution_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvSolution.Load
        If txtRequestID.Text IsNot Nothing Then
            'Selects from the database to display the details
            sqlSolution.Select(DataSourceSelectArguments.Empty)

            'Sets the text to display if no results are found
            dvSolution.EmptyDataText = "No details can be displayed for " & txtRequestID.Text & " because the Request ID does not exist."
        End If
    End Sub
End Class
