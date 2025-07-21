'User registration form'
Imports System.Data.SqlClient

Public Class registrationform
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Using con As New SqlConnection("Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True")
                con.Open()
                Dim query As String = "INSERT INTO [dbo].[Table_1] ([name], [colg], [dept], [yos], [room], [bed]) VALUES (@Name, @College, @Department, @Year, @Room, @Bed)"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text)
                    cmd.Parameters.AddWithValue("@College", TextBox2.Text)
                    cmd.Parameters.AddWithValue("@Department", TextBox3.Text)
                    cmd.Parameters.AddWithValue("@Year", TextBox4.Text)
                    cmd.Parameters.AddWithValue("@Room", ComboBox1.SelectedItem.ToString())
                    cmd.Parameters.AddWithValue("@Bed", ComboBox2.SelectedItem.ToString())
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            MessageBox.Show("Registration successful", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Catch ex As Exception
            MessageBox.Show("An error occurred: " & ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim form As New Form4
        Form4.Show()
        Me.Close()
    End Sub
End Class
'user feedback form'
Imports System.Data.SqlClient
Public Class feedback

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim start As String
        con.ConnectionString = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
        con.Open()
        If (ComboBox1.Text = "" Or TextBox1.Text = "" Or TextBox2.Text = "") Then
            MessageBox.Show("Please enter all fields")
        Else
            start = "INSERT INTO Table_2 VALUES ('" & ComboBox1.Text & "','" & TextBox1.Text & "','" & TextBox2.Text & "')"
            cmd = New SqlCommand(start, con)
            cmd.ExecuteNonQuery()
            MsgBox("Thank you for your valuable feedback", MsgBoxStyle.Information, "success")
            TextBox1.Clear()
            TextBox2.Clear()
        End If

        con.Close()
    End Sub
