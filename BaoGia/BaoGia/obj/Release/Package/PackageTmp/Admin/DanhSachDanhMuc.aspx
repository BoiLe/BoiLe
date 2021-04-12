<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="DanhSachDanhMuc.aspx.vb" Inherits="BaoGia.DanhSachDanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom box css -->
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Themes/Minton_green/assets/libs/custombox/custombox.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Apps</a></li>
                        <li class="breadcrumb-item active">Team Members</li>
                    </ol>
                </div>
                <h4 class="page-title">Team Members</h4>
            </div>
        </div>
    </div>
    <!-- end page title -->
    <!-- start page nhom -->
    <div class="row">
        <div class="col-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-12">
                        <asp:Panel ID="panelKhachHang" runat="server">
                            <div class="list-group">
                                <div class="list-group-item">
                                    <table class="table table-responsive table-borderless">
                                        <tr>
                                            <td>
                                                <label>Tên Nhóm:</label></td>
                                            <td>
                                                <asp:DropDownList ID="ddlMaNhom" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="TenNhom" DataValueField="MaNhom" AutoPostBack="True"></asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MaNhom], [TenNhom] FROM [tbl05_Nhom]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>

                </div>
                <!-- end row -->
            </div>
            <!-- end card-box -->
        </div>
        <!-- end col-->
    </div>

    <!-- end page nhom -->
    <div class="row">
        <asp:Panel ID="Panel1" runat="server">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="MaHangMuc" OnItemCommand="ListView1_ItemCommand">
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <ItemTemplate>

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <%--                        <div class="text-center card-box">
                            <div class="pt-2 pb-2">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select">
                                    <asp:Image ID="Image2" CssClass="rounded-circle img-thumbnail avatar-xl" alt="profile-image" runat="server" ImageUrl="../Themes/Minton_green/assets/images/users/avatar-2.jpg" />
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Select">
                                    <asp:Label ID="lblTenHangMuc" runat="server" Text='<%# Eval("TenHangMuc") %>' />
                                </asp:LinkButton>
                            </div>
                            <!-- end .padding -->
                        </div>--%>
                        <div class="text-center card-box">
                            <div class="pt-2 pb-2">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select">
                                    <asp:Image ID="Image2" CssClass="rounded-circle img-thumbnail avatar-xl" alt="profile-image" runat="server" ImageUrl="../Themes/Minton_green/assets/images/users/avatar-2.jpg" />
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Select">
                                             <h4 class="mt-3 font-17 text-dark"><%# Eval("TenHangMuc") %></h4>

                                </asp:LinkButton>
                                <h4 class="mt-3 font-17"><a href="extras-profile.html" class="text-dark">Mark K. Horne</a></h4>
                                <p class="text-muted">@Director  <span>| </span><span><a href="#" class="text-pink">profileq.com</a> </span></p>

                                <p class="text-muted font-13 mb-3">
                                    Hi I'm Johnathn Deo,has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.
                                       
                                </p>

                                <button type="button" class="btn btn-primary btn-sm waves-effect waves-light"><i class="mdi mdi-email mr-1"></i>Message</button>
                                <button type="button" class="btn btn-light btn-sm waves-effect"><i class="mdi mdi-phone mr-1"></i>Call</button>

                                <ul class="social-list list-inline mt-3 mb-0">
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-purple text-purple"><i class="mdi mdi-facebook"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="mdi mdi-google"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-info text-info"><i class="mdi mdi-twitter"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-secondary text-secondary"><i class="mdi mdi-github-circle"></i></a>
                                    </li>
                                </ul>

                            </div>
                            <!-- end .padding -->
                        </div>
                        <!-- end card-box-->
                        <!-- end card-box-->
                    </div>
                    <!-- end col -->
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </asp:Panel>
    </div>
    <!-- end row -->
    <!-- end row -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="SELECT [MaHangMuc], [TenHangMuc], [MaNhom] FROM [tbl08_HangMuc] WHERE ([MaNhom] = @MaNhom)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMaNhom" Name="MaNhom" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <!-- Modal-Effect -->
    <script src="../Themes/Minton_green/assets/libs/custombox/custombox.min.js"></script>
</asp:Content>
