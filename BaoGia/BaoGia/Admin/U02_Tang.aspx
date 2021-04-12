<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="U02_Tang.aspx.vb" Inherits="BaoGia.U02_Tang" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item maudo">
                CẬP NHẬT TẦNG
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <th>Mã Dự Án:</th>
                                <td>
                                    <asp:Label ID="lblMaDuAn" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Tên Dự Án:</th>
                                <td>
                                    <asp:Label ID="lblTenDuAn" runat="server" Text=""></asp:Label></td>
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
                            DataKeyNames="MaTang" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1_Tang" AllowPaging="True">
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
                                <asp:BoundField DataField="MaTang" HeaderText="Mã Tầng" ReadOnly="True" SortExpression="MaTang" InsertVisible="False" />
                                <asp:BoundField DataField="TenTang" HeaderText="Tên Tầng" SortExpression="TenTang" />
                                <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" SortExpression="MoTa" />
                                <asp:BoundField DataField="MaDuAn" HeaderText="Mã Dự Án" SortExpression="MaDuAn"  />
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
                                <%-- ([MaTang], [TenTang], [MoTa], [MaDuAn]) --%>
                                <table class="table">
                                    <tr>
                                        <th>Mã Tầng: </th>
                                        <td>
                                            <asp:TextBox ID="txtMaTang" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Tên Tầng:</th>
                                        <td>
                                            <asp:TextBox ID="txtTenTang" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Mô Tả: </th>
                                        <td>
                                            <CKEditor:CKEditorControl ID="txtMoTa" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </td>
                                    </tr>

                                    <%--<tr>
                                        <th>Mã Dự Án:</th>
                                        <td>
                                            <asp:DropDownList ID="ddlMaDuAn" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_DuAn" DataTextField="TenDuAn" DataValueField="MaDuAn"></asp:DropDownList>
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

                                <%-- ([MaTang], [TenTang], [MoTa], [MaDuAn]) --%>
                                <table class="table">
                                    <tr>
                                        <th>Mã Tầng: </th>
                                        <td>
                                            <asp:TextBox ID="txtMaTang1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Tên Tầng:</th>
                                        <td>
                                            <asp:TextBox ID="txtTenTang1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Mô Tả: </th>
                                        <td>
                                            <CKEditor:CKEditorControl ID="txtMoTa1" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </td>
                                    </tr>

                                    <%--<tr>
                                        <th>Mã Dự Án:</th>
                                        <td>
                                            <asp:DropDownList ID="ddlMaDuAn1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_DuAn" DataTextField="TenDuAn" DataValueField="MaDuAn"></asp:DropDownList>
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
            <asp:SqlDataSource ID="SqlDataSource1_Tang" runat="server"
                ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT * FROM [tbl15_Tang] WHERE ([MaDuAn] = @MaDuAn)"
                DeleteCommand="DELETE FROM [tbl15_Tang] WHERE [MaTang] = @MaTang"
                InsertCommand="INSERT INTO [tbl15_Tang] ([TenTang], [MoTa], [MaDuAn]) VALUES (@TenTang, @MoTa, @MaDuAn)"
                UpdateCommand="UPDATE [tbl15_Tang] SET [TenTang] = @TenTang, [MoTa] = @MoTa, [MaDuAn] = @MaDuAn WHERE [MaTang] = @MaTang">
                <DeleteParameters>
                    <asp:Parameter Name="MaTang" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenTang" Type="String" />
                    <asp:Parameter Name="MoTa" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaDuAn" SessionField="MaDuAn" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenTang" Type="String" />
                    <asp:Parameter Name="MoTa" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="Int32" />
                    <asp:Parameter Name="MaTang" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2_DuAn" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaDuAn], [TenDuAn] FROM [DuAn]"></asp:SqlDataSource>

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
