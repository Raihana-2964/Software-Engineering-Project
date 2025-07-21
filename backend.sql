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
'Admin Database'
Imports System.Data.SqlClient
Public Class modifydatabase

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim statement As String
        con.ConnectionString = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
        con.Open()
        If (TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Or TextBox5.Text = "" Or TextBox6.Text = "") Then
            MessageBox.Show("Please enter all fields")
        Else
            statement = "INSERT INTO Table_3 VALUES('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & TextBox5.Text & "','" & TextBox6.Text & "')"
            cmd = New SqlCommand(statement, con)
            cmd.ExecuteNonQuery()
            MsgBox(" User added successfully to the database", MsgBoxStyle.Information, "success")
            TextBox1.Clear()
            TextBox2.Clear()
            TextBox3.Clear()
            TextBox4.Clear()
            TextBox5.Clear()
            TextBox6.Clear()
        End If
        con.Close()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim stmt As String
        con.ConnectionString = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
        con.Open()
        If (TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Or TextBox5.Text = "" Or TextBox6.Text = "") Then
            MessageBox.Show("Please enter all fields")
        Else
            stmt = "UPDATE Table_3 SET name='" & TextBox2.Text & "',college='" & TextBox3.Text & "',dept='" & TextBox4.Text & "',yos='" & TextBox5.Text & "',room_no='" & TextBox6.Text & "' WHERE studid='" & TextBox1.Text & "' "
            cmd = New SqlCommand(stmt, con)
            cmd.ExecuteNonQuery()
            MsgBox(" Record updated successfully", MsgBoxStyle.Information, " success")
            TextBox1.Clear()
            TextBox2.Clear()
            TextBox3.Clear()
            TextBox4.Clear()
            TextBox5.Clear()
            TextBox6.Clear()

        End If
        con.Close()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim smt As String
        con.ConnectionString = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
        con.Open()
        If (TextBox1.Text = "") Then
            MessageBox.Show("Please enter student ID to delete data")
        Else
            smt = "DELETE FROM Table_3 where studid='" & TextBox1.Text & "'"
            cmd = New SqlCommand(smt, con)
            cmd.ExecuteNonQuery()
            MsgBox("User data deleted successfully", MsgBoxStyle.Information, "success")
            TextBox1.Clear()
            TextBox2.Clear()
            TextBox3.Clear()
            TextBox4.Clear()
            TextBox5.Clear()
            TextBox6.Clear()
        End If
        con.Close()
    End Sub

    Dim connectionString As String = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
    Dim connection As New SqlConnection(connectionString)

    Private Sub modifydatabase_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            connection.Open()
            LoadDataIntoDataGridView()
        Catch ex As Exception
            MessageBox.Show("Error opening database connection: " & ex.Message)
        End Try
    End Sub

    Private Sub LoadDataIntoDataGridView()

        Dim query As String = "SELECT * FROM Table_3"
        Dim dataAdapter As New SqlDataAdapter(query, connection)
        Dim dataTable As New DataTable()
        dataAdapter.Fill(dataTable)
        DataGridView1.DataSource = dataTable
    End Sub

    Private Sub viewdatabase_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        If connection.State = ConnectionState.Open Then
            connection.Close()
        End If
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim a As New adminpage
        adminpage.Show()
        Me.Close()
    End Sub
End Class
'View registration form details'
Imports System.Data.SqlClient

Public Class viewregform
    Dim connectioString As String = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
    Dim connection As New SqlConnection(connectioString)
    Private Sub viewdatabase_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            connection.Open()
            LoadDataIntoDataGridView()
        Catch ex As Exception
            MessageBox.Show("Error opening database connection: " & ex.Message)
        End Try
    End Sub

    Private Sub LoadDataIntoDataGridView()

        Dim query As String = "SELECT * FROM Table_1"
        Dim dataAdapter As New SqlDataAdapter(query, connection)
        Dim dataTable As New DataTable()
        dataAdapter.Fill(dataTable)
        DataGridView1.DataSource = dataTable
    End Sub

    Private Sub viewregform_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        If connection.State = ConnectionState.Open Then
            connection.Close()
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ad As New adminpage
        adminpage.Show()
        Me.Close()
    End Sub

    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick

    End Sub
End Class
'View feedback details'
Imports System.Data.SqlClient

Public Class viewdatabase
    Dim connectionString As String = "Data Source=2004AX_LAPTOP\SQLEXPRESS;Initial Catalog=myhead;Integrated Security=True"
    Dim connection As New SqlConnection(connectionString)
    Private Sub viewdatabase_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            connection.Open()
            LoadDataIntoDataGridView()
        Catch ex As Exception
            MessageBox.Show("Error opening database connection: " & ex.Message)
        End Try
    End Sub

    Private Sub LoadDataIntoDataGridView()

        Dim query As String = "SELECT * FROM Table_2"
        Dim dataAdapter As New SqlDataAdapter(query, connection)
        Dim dataTable As New DataTable()
        dataAdapter.Fill(dataTable)
        DataGridView1.DataSource = dataTable
    End Sub

    Private Sub viewdatabase_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        If connection.State = ConnectionState.Open Then
            connection.Close()
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim adp As New adminpage
        adminpage.Show()
        Me.Close()
    End Sub

    
