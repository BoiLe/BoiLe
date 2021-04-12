<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="test.aspx.vb" Inherits="BaoGia.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelKhachHang" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item bg-info">
                <h2>Bảng báo giá theo hạng mục</h2>
            </div>
            <div class="list-group-item">
                <table class="table table-responsive table-borderless">
                    <tr>
                        <td>
                            <label>Tên Nhóm:</label></td>
                        <td>
                            <asp:DropDownList ID="ddlMaNhom" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="TenNhom" DataValueField="MaNhom" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Tên Hạng Mục:</label></td>
                        <td>
                            <asp:DropDownList ID="ddlMaHangMuc" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="TenHangMuc" DataValueField="MaHangMuc" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>               
                            <asp:LinkButton ID="lbtnMaHangMuc" runat="server">Xem minh họa Hạng mục</asp:LinkButton>
                            <%--<asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>--%>
                        </td>
                    </tr>

                </table>
            </div>
            <div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaNhom], [TenNhom] FROM [tbl05_Nhom]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaHangMuc], [TenHangMuc] FROM [tbl08_HangMuc] WHERE ([MaNhom] = @MaNhom)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlMaNhom" Name="MaNhom" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
</asp:Content>
