<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="R01_BaoGia.aspx.vb" Inherits="BaoGia.R01_BaoGia" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelKhachHang" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item bg-info">
                <h2>Bảng báo giá theo phòng</h2>
            </div>
            <div class="list-group-item">
                <table class="table table-responsive table-borderless">
                    <tr>
                        <td>
                            <label>Phòng:</label></td>
                        <td>
                            <asp:DropDownList ID="ddlMaPhong" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="TenPhong" DataValueField="MaPhong" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="list-group-item ">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="1200px">
                    <LocalReport ReportPath="Report/R01_BaoGia.rdlc" ReportEmbeddedResource="BaoGia.R01_BaoGia.rdlc" EnableExternalImages="True" >
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="R01_BaoGia" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>
            <div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BaoGia.dsBaoGiaTableAdapters.pcd_bangbaogiaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlMaPhong" Name="maphong" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaPhong], [TenPhong] FROM [tbl14_Phong]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
