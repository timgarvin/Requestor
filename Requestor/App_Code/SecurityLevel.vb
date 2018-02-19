Imports Microsoft.VisualBasic

Public Class SecurityLevel
    Private AccessLevel As String
    Private TechnicianID As String
    Private BuildingID As String

    Public ResultsStatus As String
    Public Results As String

    Public Sub SetAccess(ByVal lvl As String)
        If lvl = "A" OrElse lvl = "T" Then
            AccessLevel = lvl
        Else
            AccessLevel = ""
        End If
    End Sub

    Public Function GetAccess() As String
        Return AccessLevel
    End Function

    Public Sub SetTechnicianID(ByVal ID As String)
        If ID > 0 Then
            TechnicianID = ID
        End If
    End Sub

    Public Function GetTechnicianID() As String
        Return TechnicianID
    End Function

    Public Sub SetBuildingID(ByVal ID As String)
        If ID > 0 Then
            BuildingID = ID
        End If
    End Sub

    Public Function GetBuildingID() As String
        Return BuildingID
    End Function
End Class
