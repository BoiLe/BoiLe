<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Layout.Master" CodeBehind="Error.aspx.vb" Inherits="BaoGia._Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="account-pages mt-5 mb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-pattern">

                        <div class="card-body p-4">

                            <div class="text-center">
                                <a href="Admin/Index.aspx">
                                    <span>
                                        <img src="../Themes/Minton_green/assets/images/logo-dark.png" alt="" height="22" /></span>
                                </a>
                            </div>

                            <div class="text-center mt-4">
                                <h5 class="text-error">500</h5>
                                <h3 class="mt-3 mb-2 text-uppercase">Lỗi ràng buộc dữ liệu</h3>
                                <h4 class="text-muted mb-3">
                                    <asp:Label ID="lblError" CssClass="text-danger text-left" runat="server" Text=""></asp:Label></h4>

                                <a href="Admin/Index.aspx" class="btn btn-success waves-effect waves-light">Back to Home</a>
                            </div>

                        </div>
                        <!-- end card-body -->
                    </div>
                    <!-- end card -->

                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
