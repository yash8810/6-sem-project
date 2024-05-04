<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Dsms.WebForm3" UnobtrusiveValidationMode="None" %>
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
                            <img src="images\undraw_showing_support_re_5f2v.svg" alt="">
                        </div>
                    </div>
                    <div class="content-wthree">
                        <h2>Register Now</h2>
                        <p>Join Us In This Journey By Being A Part Of It! 
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </p>
                        
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="inputBox" placeholder="Enter Your Username" Width="300px"></asp:TextBox>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="inputBox" placeholder="Enter Your Email" Width="300px" TextMode="Email"></asp:TextBox>
                            <br/>
                            <asp:Button ID="btnOtp" runat="server" BackColor="RoyalBlue" CssClass="btn" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="btnOtp_Click" Text="Get Otp" />
                            <asp:TextBox ID="txtOtp" runat="server" CssClass="inputBox" placeholder="Enter Otp" Width="300px" TextMode="Number"></asp:TextBox>    
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="inputBox" placeholder="Enter Your Password" Width="300px" TextMode="Password"></asp:TextBox>
                            
                            <asp:Button ID="btnRegister" runat="server" BackColor="RoyalBlue" CssClass="btn" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="btnRegister_Click" Text="Register" />
                        <div class="social-icons">
                            <p>Have an account! <a href="login.aspx">Login</a>.</p>
                        </div>
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
