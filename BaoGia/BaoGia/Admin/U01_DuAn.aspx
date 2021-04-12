<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="U01_DuAn.aspx.vb" Inherits="BaoGia.U01_DuAn" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item maudo">
                CẬP NHẬT DỰ ÁN
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><i class="fe-upload-cloud"></i> Import</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaDuAn" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1_DuAn" AllowPaging="true" >
                            <Columns>
                                <asp:ButtonField CommandName="selectRecord" ButtonType="Link" Text='<i class="fe-settings"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maureu btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaDuAn" HeaderText="Mã dự án" ReadOnly="True" SortExpression="MaDuAn" InsertVisible="False"  />
                                <asp:BoundField DataField="TenDuAn" HeaderText="Tên dự án" SortExpression="TenDuAn"  />
                                <asp:BoundField DataField="DienGiai" HeaderText="Mô tả" SortExpression="DienGiai"/>
                                <asp:BoundField DataField="MaKhachHang" HeaderText="ID khách hàng" SortExpression="MaKhachHang" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                               <%-- ([MaDuAn], [TenDuAn], [DienGiai], [MaKhachHang]) --%>
                                <table class="table">
                                    <tr>
                                        <td>Mã dự án: </td>
                                        <td>
                                            <asp:TextBox ID="txtMaDuAn" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tên dự án:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenDuAn" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mô tả: </td>
                                        <td>
                                            <CKEditor:CKEditorControl ID="txtDienGiai" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mã Khách hàng:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaKhachHang" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_KhachHang" DataTextField="TenKhachHang" DataValueField="MaKhachHang"></asp:DropDownList>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Add</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--Import Modal--%>
        <div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle2" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle2">Import</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <td>Upload File: (*)</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><i class="fe-save"></i> Import</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Kết thúc thêm-->



        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upEdit" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">

                               <%-- ([MaDuAn], [TenDuAn], [DienGiai], [MaKhachHang]) --%>
                                <table class="table">
                                    <tr>
                                        <td>Mã dự án: </td>
                                        <td>
                                            <asp:TextBox ID="txtMaDuAn1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tên Dự Án:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenDuAn1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mô tả: </td>
                                        <td>
                                            <CKEditor:CKEditorControl ID="txtDienGiai1" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mã Khách hàng:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaKhachHang1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_KhachHang" DataTextField="TenKhachHang" DataValueField="MaKhachHang"></asp:DropDownList>
                                        </td>
                                    </tr>

                                </table>

                            </div>
                            <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Update</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!-- Kết thúc sửa -->


        <!--Bắt đầu Xóa-->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                Are you sure you want to delete the record?
                                    <asp:HiddenField ID="hfCode" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><i class="fe-trash-2"></i> Delete</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Cancel</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!--Kết thúc xóa -->

        <div>
            <asp:SqlDataSource ID="SqlDataSource1_DuAn" runat="server"
                ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT * FROM [DuAn]"
                DeleteCommand="DELETE FROM [DuAn] WHERE [MaDuAn] = @MaDuAn"
                InsertCommand="INSERT INTO [DuAn] ([TenDuAn], [DienGiai], [MaKhachHang]) VALUES (@TenDuAn, @DienGiai, @MaKhachHang)"
                UpdateCommand="UPDATE [DuAn] SET [TenDuAn] = @TenDuAn, [DienGiai] = @DienGiai, [MaKhachHang] = @MaKhachHang WHERE [MaDuAn] = @MaDuAn">
                <DeleteParameters>
                    <asp:Parameter Name="MaDuAn" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenDuAn" Type="String" />
                    <asp:Parameter Name="DienGiai" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenDuAn" Type="String" />
                    <asp:Parameter Name="DienGiai" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                    <asp:Parameter Name="MaDuAn" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2_KhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tbl21_KhachHang]"></asp:SqlDataSource>

        </div>
    </asp:Panel>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
    <asp:Panel ID="panelError" runat="server" Visible="True">
        <h4 class="alert alert-warning" role="alert">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
