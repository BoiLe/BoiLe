<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="U03_Phong.aspx.vb" Inherits="BaoGia.U03_Phong" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hiddencol{
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item maudo">
                CẬP NHẬT PHÒNG
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <th>Mã Tầng:</th>
                                <td>
                                    <asp:Label ID="lblMaTang" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Tên Tầng:</th>
                                <td>
                                    <asp:Label ID="lblTenTang" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><i class="fe-upload-cloud"></i> Import</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaPhong" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1_Phong" AllowPaging="True">
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
                                <asp:BoundField DataField="MaPhong" HeaderText="Mã Phòng" ReadOnly="True" SortExpression="MaPhong" InsertVisible="False"  />
                                <asp:BoundField DataField="TenPhong" HeaderText="Tên Phòng" SortExpression="TenPhong" />
                                <asp:BoundField DataField="MaTang" HeaderText="Mã Tầng" SortExpression="MaTang" />
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
                                <%-- ([MaPhong], [TenPhong], [MaTang]) --%>
                                <table class="table">
                                    <tr>
                                        <th>Mã Phòng: </th>
                                        <td>
                                            <asp:TextBox ID="txtMaPhong" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Tên Phòng:</th>
                                        <td>
                                            <asp:TextBox ID="txtTenPhong" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>


                                    <%--<tr>
                                        <th>Mã Tầng:</th>
                                        <td>
                                            <asp:DropDownList ID="ddlMaTang" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_Tang" DataTextField="TenTang" DataValueField="MaTang"></asp:DropDownList>
                                        </td>
                                    </tr>--%>

                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Add</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Close</button>
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
                                <th>Upload File: (*)</th>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><i class="fe-save"></i> Import</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Close</button>
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

                                <%-- ([MaPhong], [TenPhong], [MaTang]) --%>
                                <table class="table">
                                    <tr>
                                        <th>Mã Phòng: </th>
                                        <td>
                                            <asp:TextBox ID="txtMaPhong1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Tên Phòng:</th>
                                        <td>
                                            <asp:TextBox ID="txtTenPhong1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <%--<tr>
                                        <th>Mã Dự Án:</th>
                                        <td>
                                            <asp:DropDownList ID="ddlMaTang1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_Tang" DataTextField="TenTang" DataValueField="MaTang"></asp:DropDownList>
                                        </td>
                                    </tr>--%>

                                </table>

                            </div>
                            <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Update</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Close</button>
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
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Cancel</button>
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
            <asp:SqlDataSource ID="SqlDataSource1_Phong" runat="server"
                ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT * FROM [tbl14_Phong] WHERE ([MaTang] = @MaTang)"
                DeleteCommand="DELETE FROM [tbl14_Phong] WHERE [MaPhong] = @MaPhong"
                InsertCommand="INSERT INTO [tbl14_Phong] ([TenPhong], [MaTang]) VALUES (@TenPhong, @MaTang)"
                UpdateCommand="UPDATE [tbl14_Phong] SET [TenPhong] = @TenPhong, [MaTang] = @MaTang WHERE [MaPhong] = @MaPhong">
                <DeleteParameters>
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenPhong" Type="String" />
                    <asp:Parameter Name="MaTang" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaTang" SessionField="MaTang" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenPhong" Type="String" />
                    <asp:Parameter Name="MaTang" Type="Int32" />
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2_Tang" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaDuAn], [TenDuAn] FROM [DuAn]"></asp:SqlDataSource>

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
