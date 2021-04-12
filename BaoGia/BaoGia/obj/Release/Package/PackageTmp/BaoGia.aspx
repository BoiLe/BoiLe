<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="BaoGia.aspx.vb" Inherits="BaoGia.BaoGia" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelKhachHang" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item bg-info">
                <h2>Bảng báo giá theo hạng mục</h2>
            </div>
            <div class="list-group-item">
                <table class="table table-responsive table-borderless">
                    <tr>
                        <td>
                            <label>Tên Hạng Mục:</label></td>
                        <td>
                            <asp:DropDownList ID="ddlMaHangMuc" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="TenHangMuc" DataValueField="MaHangMuc" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="list-group-item ">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px">
                    <LocalReport ReportPath="Report/R01_BaoGia.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="R01_BaoGia" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>
            <div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBaoGiaHangMuc" TypeName="BaoGia.dsBaoGiaTableAdapters.V01_BangBaoGiaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlMaHangMuc" Name="MaHangMuc" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaHangMuc], [TenHangMuc] FROM [tbl08_HangMuc]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
</asp:Content>
