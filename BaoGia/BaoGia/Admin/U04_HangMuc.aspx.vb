Imports System
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Data.Common
Imports System.Data.OleDb
Public Class U04_HangMuc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        panelError.Visible = False
        lblMaPhong.Text = Session("MaPhong").ToString()
        lblTenPhong.Text = Session("TenPhong").ToString()

    End Sub

    Protected Sub btnImport_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#importModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "ImportShowModalScript", sb.ToString(), False)
    End Sub

    Protected Sub btnImportRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        If IsValid Then
            Dim ExcelContentType As String = "application/vnd.ms-excel"
            Dim Excel2010ContentType As String = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

            If FileUpload1.HasFile Then

                If FileUpload1.PostedFile.ContentType = ExcelContentType OrElse FileUpload1.PostedFile.ContentType = Excel2010ContentType Then

                    Try
                        Dim path As String = String.Concat(Server.MapPath("../BulkFolder/"), FileUpload1.FileName)
                        FileUpload1.SaveAs(path)
                        Dim excelConnectionString As String = String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path)

                        Using connection As OleDbConnection = New OleDbConnection(excelConnectionString)
                            Dim command As OleDbCommand = New OleDbCommand("Select * FROM [Sheet1$]", connection)
                            connection.Open()

                            Using dr As DbDataReader = command.ExecuteReader()
                                Dim sqlConnectionString As String = ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString

                                Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(sqlConnectionString)
                                    bulkCopy.DestinationTableName = "tbl08_HangMuc"
                                    bulkCopy.WriteToServer(dr)
                                    panelError.Visible = True
                                    lblError.Text = "The data has been exported succefuly from Excel to SQL"
                                    GridView1.DataBind()
                                End Using
                            End Using
                        End Using

                        Dim sb As StringBuilder = New StringBuilder()
                        sb.Append("<script type='text/javascript'>")
                        sb.Append("alert('Record Imported Successfully');")
                        sb.Append("$('#importModal').modal('hide');")
                        sb.Append("</script>")
                        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "ImportHideModalScript", sb.ToString(), False)
                    Catch ex As Exception
                        panelError.Visible = True
                        lblError.Text = ex.Message
                    End Try
                End If
            End If
        End If
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#addModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddShowModalScript", sb.ToString(), False)
        'lblMaDonVi.Text = ddlMaDonVi.SelectedValue
    End Sub


    Protected Sub btnAddRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        '([MaHangMuc], TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong], [HanMuc])

        If IsValid Then
            Dim parameters = SqlDataSource1_HangMuc.InsertParameters
            parameters("TenHangMuc").DefaultValue = txtTenHangMuc.Text
            parameters("GhiChu").DefaultValue = txtGhiChu.Text
            parameters("MaNhom").DefaultValue = ddlMaNhom.SelectedValue
            parameters("MaThuongHieu").DefaultValue = ddlMaThuongHieu.SelectedValue
            'parameters("MaPhong").DefaultValue = ddlMaPhong.SelectedValue
            parameters("MaPhong").DefaultValue = Session("MaPhong").ToString()
            parameters("HanMuc").DefaultValue = ddlHanMuc.SelectedValue

            Try

                If txtTenHangMuc.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1_HangMuc.Insert()
                    txtTenHangMuc.Text = ""
                    txtGhiChu.Text = ""
                    Dim sb As StringBuilder = New StringBuilder()
                    sb.Append("<script type='text/javascript'>")
                    sb.Append("alert('Record Added Successfully');")
                    sb.Append("$('#addModal').modal('hide');")
                    sb.Append("</script>")
                    ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddHideModalScript", sb.ToString(), False)
                End If

            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        If e.CommandName.Equals("editRecord") Then
            '([MaHangMuc], TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong])

            Dim gvrow As GridViewRow = GridView1.Rows(index)
            txtMaHangMuc1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtTenHangMuc1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            ddlMaNhom1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            ddlMaThuongHieu1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            ddlMaPhong1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            ddlHanMuc1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            lblResult.Visible = False
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#editModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditModalScript", sb.ToString(), False)
        ElseIf e.CommandName.Equals("deleteRecord") Then
            Dim code As String = GridView1.DataKeys(index).Value.ToString()
            hfCode.Value = code
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#deleteModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "DeleteModalScript", sb.ToString(), False)
            'ElseIf e.CommandName.Equals("selectRecord") Then
            '    Dim gvrow As GridViewRow = GridView1.Rows(index)
            'Session("MaPhong") = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            'Session("TenPhong") = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString()
            'Dim url As String = "/Admin/U02_Tang.aspx"
            'Dim sb As StringBuilder = New StringBuilder()
            'sb.Append("<script type = 'text/javascript'>")
            'sb.Append("window.open('")
            'sb.Append(url)
            'sb.Append("');")
            'sb.Append("</script>")
            'ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "SelectScript", sb.ToString(), False)
        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        If IsValid Then
            Dim parameters = SqlDataSource1_HangMuc.UpdateParameters
            parameters("MaHangMuc").DefaultValue = txtMaHangMuc1.Text
            parameters("TenHangMuc").DefaultValue = txtTenHangMuc1.Text
            parameters("GhiChu").DefaultValue = txtGhiChu1.Text
            parameters("MaNhom").DefaultValue = ddlMaNhom1.SelectedValue
            parameters("MaThuongHieu").DefaultValue = ddlMaThuongHieu1.SelectedValue
            'parameters("MaPhong").DefaultValue = ddlMaPhong1.SelectedValue
            parameters("MaPhong").DefaultValue = ddlMaPhong1.SelectedValue
            parameters("HanMuc").DefaultValue = ddlHanMuc1.SelectedValue

            '([MaHangMuc], TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong], [HanMuc])

            Try

                If txtTenHangMuc1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1_HangMuc.Update()
                    Dim sb As StringBuilder = New StringBuilder()
                    sb.Append("<script type='text/javascript'>")
                    sb.Append("alert('Records Updated Successfully');")
                    sb.Append("$('#editModal').modal('hide');")
                    sb.Append("</script>")
                    ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditHideModalScript", sb.ToString(), False)
                End If

            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub

    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            '([MaHangMuc], TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong], [HanMuc])

            Dim parameters = SqlDataSource1_HangMuc.DeleteParameters
            parameters("MaHangMuc").DefaultValue = code

            Try
                SqlDataSource1_HangMuc.Delete()
            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim code As String = hfCode.Value
        executeDelete(code)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("alert('Record deleted Successfully');")
        sb.Append("$('#deleteModal').modal('hide');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "delHideModalScript", sb.ToString(), False)
    End Sub

End Class