<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="U04_HangMuc.aspx.vb" Inherits="BaoGia.U04_HangMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item maudo">
                CẬP NHẬT HẠNG MỤC
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <th>Mã Phòng:</th>
                                <td>
                                    <asp:Label ID="lblMaPhong" runat="server" Text=""></asp:Label></td>
                                <asp:Label ID="lblTenPhong" runat="server" Text=""></asp:Label></td>
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
                            DataKeyNames="MaHangMuc" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1_HangMuc" AllowPaging="True" >
                            <Columns>
                                 <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaHangMuc" HeaderText="MaHangMuc"  ReadOnly="True" SortExpression="MaHangMuc" InsertVisible="False"  />
                                <asp:BoundField DataField="TenHangMuc" HeaderText="TenHangMuc" SortExpression="TenHangMuc" />
                                <asp:BoundField DataField="GhiChu" HeaderText="GhiChu" SortExpression="GhiChu"/>
                                <asp:BoundField DataField="MaNhom" HeaderText="MaNhom" SortExpression="MaNhom" />
                                <asp:BoundField DataField="MaThuongHieu" HeaderText="MaThuongHieu" SortExpression="MaThuongHieu"  />
                                <asp:BoundField DataField="MaPhong" HeaderText="MaPhong" SortExpression="MaPhong" />
                                <asp:BoundField DataField="HanMuc" HeaderText="HanMuc" SortExpression="HanMuc" />
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
                               <%-- ([MaHangMuc], TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong]) --%>
                                <table class="table">
                                    <tr>
                                        <td>Mã hạng mục: </td>
                                        <td>
                                            <asp:TextBox ID="txtMaHangMuc" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tên hạng mục:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenHangMuc" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ghi chú:</td>
                                        <td>
                                            <asp:TextBox ID="txtGhiChu" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Mã nhóm:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaNhom" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_Nhom" DataTextField="TenNhom" DataValueField="MaNhom"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mã thương hiệu</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaThuongHieu" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3_ThuongHieu" DataTextField="TenThuongHieu" DataValueField="MaThuongHieu"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td>Mã phòng:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaPhong" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4_Phong" DataTextField="TenPhong" DataValueField="MaPhong"></asp:DropDownList>
                                        </td>
                                    </tr>--%>
                                     <tr>
                                        <td>Mã hạn mức:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlHanMuc" CssClass="form-control" runat="server" DataSourceID="SqlDataSource6_HanMuc" DataTextField="HanMuc" DataValueField="HanMuc"></asp:DropDownList>
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

                               <%-- ([MaHangMuc], TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong],[HanMuc]) --%>
                                <table class="table">
                                    <tr>
                                        <td>Mã hạng mục: </td>
                                        <td>
                                            <asp:TextBox ID="txtMaHangMuc1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tên hạng mục:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenHangMuc1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ghi chú:</td>
                                        <td>
                                            <asp:TextBox ID="txtGhiChu1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Mã nhóm:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaNhom1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_Nhom" DataTextField="TenNhom" DataValueField="MaNhom"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mã thương hiệu</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaThuongHieu1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3_ThuongHieu" DataTextField="TenThuongHieu" DataValueField="MaThuongHieu"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mã phòng:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaPhong1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4_Phong" DataTextField="TenPhong" DataValueField="MaPhong"></asp:DropDownList>
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td>Mã hạn mức:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlHanMuc1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource6_HanMuc" DataTextField="HanMuc" DataValueField="HanMuc"></asp:DropDownList>
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
            <asp:SqlDataSource ID="SqlDataSource1_HangMuc" runat="server"
                ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT * FROM [tbl08_HangMuc] WHERE ([MaPhong] = @MaPhong)" 
                DeleteCommand="DELETE FROM [tbl08_HangMuc] WHERE [MaHangMuc] = @MaHangMuc" 
                InsertCommand="INSERT INTO [tbl08_HangMuc] ([TenHangMuc], [GhiChu], [MaNhom], [MaThuongHieu], [MaPhong], [HanMuc]) VALUES (@TenHangMuc, @GhiChu, @MaNhom, @MaThuongHieu, @MaPhong, @HanMuc)" 
                UpdateCommand="UPDATE [tbl08_HangMuc] SET [TenHangMuc] = @TenHangMuc, [GhiChu] = @GhiChu, [MaNhom] = @MaNhom, [MaThuongHieu] = @MaThuongHieu, [MaPhong] = @MaPhong, [HanMuc] = @HanMuc WHERE [MaHangMuc] = @MaHangMuc">
                <DeleteParameters>
                    <asp:Parameter Name="MaHangMuc" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenHangMuc" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaNhom" Type="Int32" />
                    <asp:Parameter Name="MaThuongHieu" Type="Int32" />
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                    <asp:Parameter Name="HanMuc" Type="Single" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaPhong" SessionField="MaPhong" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenHangMuc" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaNhom" Type="Int32" />
                    <asp:Parameter Name="MaThuongHieu" Type="Int32" />
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                    <asp:Parameter Name="HanMuc" Type="Single" />
                    <asp:Parameter Name="MaHangMuc" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2_Nhom" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tbl05_Nhom]" DeleteCommand="DELETE FROM [tbl05_Nhom] WHERE [MaNhom] = @MaNhom" InsertCommand="INSERT INTO [tbl05_Nhom] ([TenNhom]) VALUES (@TenNhom)" UpdateCommand="UPDATE [tbl05_Nhom] SET [TenNhom] = @TenNhom WHERE [MaNhom] = @MaNhom">
               
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3_ThuongHieu" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tbl04_ThuongHieu]" DeleteCommand="DELETE FROM [tbl04_ThuongHieu] WHERE [MaThuongHieu] = @MaThuongHieu" InsertCommand="INSERT INTO [tbl04_ThuongHieu] ([TenThuongHieu]) VALUES (@TenThuongHieu)" UpdateCommand="UPDATE [tbl04_ThuongHieu] SET [TenThuongHieu] = @TenThuongHieu WHERE [MaThuongHieu] = @MaThuongHieu">
                
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4_Phong" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tbl14_Phong]" DeleteCommand="DELETE FROM [tbl14_Phong] WHERE [MaPhong] = @MaPhong" InsertCommand="INSERT INTO [tbl14_Phong] ([TenPhong], [MaTang]) VALUES (@TenPhong, @MaTang)" UpdateCommand="UPDATE [tbl14_Phong] SET [TenPhong] = @TenPhong, [MaTang] = @MaTang WHERE [MaPhong] = @MaPhong"> 
               
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6_HanMuc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tbl22_HanMuc]" DeleteCommand="DELETE FROM [tbl22_HanMuc] WHERE [MaHangMuc] = @MaHangMuc AND [Ngay] = @Ngay" InsertCommand="INSERT INTO [tbl22_HanMuc] ([MaHangMuc], [Ngay], [HanMuc]) VALUES (@MaHangMuc, @Ngay, @HanMuc)" UpdateCommand="UPDATE [tbl22_HanMuc] SET [HanMuc] = @HanMuc WHERE [MaHangMuc] = @MaHangMuc AND [Ngay] = @Ngay">
               
            </asp:SqlDataSource>
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
