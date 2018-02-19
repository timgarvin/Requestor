'Tim Garvin

Imports System.Data.SqlClient

Partial Class Move_To_Archive
    Inherits System.Web.UI.Page

    'Declares variables for Session State
    Private ResultsSession As SortedList
    Private objSecurityLevel As New SecurityLevel

    'Declares a data reader
    Private completedReader As SqlDataReader

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNo.Click
        'Takes administrator back to the Main Page if No is clicked
        Response.Redirect("Administrator_Main.aspx")
    End Sub

    Protected Sub btnYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnYes.Click
        'Attempts to do the following and throws an error if it fails
        Try
            'Initializes the data reader
            completedReader = CType(sqlCompletedReader.Select(DataSourceSelectArguments.Empty), SqlDataReader)

            If completedReader.Read() Then
                'Goes through the rows returned by the data reader and inserts them into the Archive
                While completedReader.Read
                    sqlCompleted.InsertParameters("RequestID").DefaultValue = completedReader.Item("RequestID")
                    sqlCompleted.InsertParameters("BuildingID").DefaultValue = completedReader.Item("BuildingID")
                    sqlCompleted.InsertParameters("DepartmentID").DefaultValue = completedReader.Item("DepartmentID")
                    sqlCompleted.InsertParameters("RoomNum").DefaultValue = completedReader.Item("RoomNum")

                    If completedReader.Item("InventoryNum") IsNot DBNull.Value Then
                        sqlCompleted.InsertParameters("InventoryNum").DefaultValue = completedReader.Item("InventoryNum")
                    Else
                        sqlCompleted.InsertParameters("InventoryNum").DefaultValue = DBNull.Value.ToString
                    End If

                    sqlCompleted.InsertParameters("RequestDate").DefaultValue = CType(completedReader.Item("RequestDate"), DateTime)
                    sqlCompleted.InsertParameters("RequestType").DefaultValue = completedReader.Item("RequestType")
                    sqlCompleted.InsertParameters("RequestorName").DefaultValue = completedReader.Item("RequestorName")
                    sqlCompleted.InsertParameters("RequestorPhone").DefaultValue = completedReader.Item("RequestorPhone")
                    sqlCompleted.InsertParameters("RequestorEmail").DefaultValue = completedReader.Item("RequestorEmail")
                    sqlCompleted.InsertParameters("PriorityLevel").DefaultValue = completedReader.Item("PriorityLevel")
                    sqlCompleted.InsertParameters("Problem").DefaultValue = completedReader.Item("Problem")

                    If completedReader.Item("TechnicianID") IsNot DBNull.Value Then
                        sqlCompleted.InsertParameters("TechnicianID").DefaultValue = completedReader.Item("TechnicianID")
                    Else
                        sqlCompleted.InsertParameters("TechnicianID").DefaultValue = DBNull.Value.ToString
                    End If

                    If completedReader.Item("SolutionDate") IsNot DBNull.Value Then
                        sqlCompleted.InsertParameters("SolutionDate").DefaultValue = CType(completedReader.Item("SolutionDate"), DateTime)
                    Else
                        sqlCompleted.InsertParameters("SolutionDate").DefaultValue = DBNull.Value.ToString
                    End If

                    If completedReader.Item("Solution") IsNot DBNull.Value Then
                        sqlCompleted.InsertParameters("Solution").DefaultValue = completedReader.Item("Solution")
                    Else
                        sqlCompleted.InsertParameters("Solution").DefaultValue = DBNull.Value.ToString
                    End If

                    sqlCompleted.InsertParameters("Status").DefaultValue = completedReader.Item("Status")

                    sqlCompleted.Insert()
                End While

                'Deletes all completed and canceled requests from the Service Requests after they have been copied to the Archive
                'sqlCompleted.Delete()
                sqlCompletedRemove.Delete()

                'Goes to the results page and notifies the user their submission was successful
                GoToResults("Valid")
            Else
                GoToResults("There are currently no Requests in the database that can be moved to the Archive, because nothing has been solved or canceled at this point in time.")
            End If
        Catch ex As Exception
            'Goes to the results page and notifies the user their submission was not successful and displays the error
            GoToResults(ex.Message)
        End Try
    End Sub

    Protected Sub GoToResults(ByVal message As String)
        'Checks to see if the statements executed before this was called were valid
        If message = "Valid" Then
            'Sets the Session State with the value Valid and tells the user their submission was successful
            objSecurityLevel.ResultsStatus = "Valid"
            objSecurityLevel.Results = "All canceled and solved requests have successfully been moved to the Archive! Thank you."

            ResultsSession = GetID()

            Dim result As String = objSecurityLevel.ResultsStatus

            If ResultsSession.ContainsKey(result) Then
                objSecurityLevel = CType(ResultsSession(result), SecurityLevel)
            Else
                ResultsSession.Add(result, objSecurityLevel)
            End If

            Response.Redirect("Results.aspx", False)
        Else
            'Sets the Session State with the value Error and tells there was an error
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sets the displayed title of the page
        Dim title As Label = CType(Master.FindControl("lblTitle"), Label)

        title.Text = "Move Solved/Canceled Requests to Archive"
    End Sub
End Class
