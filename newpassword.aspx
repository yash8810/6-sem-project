<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="newpassword.aspx.cs" Inherits="Dsms.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/loginstyle.css" rel="stylesheet" />
       <link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <section class="w3l-mockup-form">
        <div class="container">
            <!-- /form -->
            <div class="workinghny-form-grid">
                <div class="main-mockup">
                    <div class="w3l_form align-self">
                        <div class="left_grid_info">
                            <img src="images\undraw_appreciate_it_qnkk.svg" alt="">
                        </div>
                    </div>
                    <div class="content-wthree" style="padding-top: 15%;">
                        <h2>Reset Password</h2>
                        <p>Enter The New Password<asp:TextBox ID="txtPass" runat="server" CssClass="email"></asp:TextBox>
                            <asp:TextBox ID="txtRepass" runat="server" CssClass="email"></asp:TextBox>
                            
                        </p>
                        <asp:Button ID="Button1" runat="server" BackColor="#0043A2" CssClass="btn" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="Reset Password" OnClick="Button1_Click" />    
                    </div>
                </div>
            </div>
            <!-- //form -->
        </div>
    </section>
    <!-- //form section start -->

    <script src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function(c) {
            $('.alert-close').on('click', function(c) {
                $('.main-mockup').fadeOut('slow', function(c) {
                    $('.main-mockup').remove();
                });
            });
        });
    </script>
    <script type="text/javascript">
        // Disable back button
        window.history.forward();
        window.onload = function () {
            window.history.forward();
        }
        window.onpageshow = function (evt) {
            if (evt.persisted) {
                window.history.forward();
            }
        }
        window.onunload = function () { void (0) }

        // Prevent the user from navigating back using browser buttons
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>

</asp:Content>
