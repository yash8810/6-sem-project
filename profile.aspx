<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Dsms.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
    <link href="Css/loginstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <section class="w3l-mockup-form">
        <div class="container">
            <!-- /form -->
            <div class="workinghny-form-grid">
                <div class="main-mockup">
                    <div class="w3l_form align-self">
                        <div class="left_grid_info">
                            <img src="images\undraw_reminder_re_fe15.svg" alt="">
                        </div>
                    </div>
                    <div class="content-wthree">
                        <h2>User Profile</h2>
                        <br />
                        <br />
                        <label style="font-size: large;">Username :</label>
                        <asp:TextBox ID="txtuname" runat="server" CssClass="email" ReadOnly="True"></asp:TextBox>
                        <label style="font-size: large;">Email : </label>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="email" ReadOnly="True"></asp:TextBox>
                        <label style="font-size: large;">Account created on: </label>
                        <asp:TextBox ID="txtdate" runat="server" CssClass="email" ReadOnly="True"></asp:TextBox>
                        <label style="font-size: large;">Change Password: </label>
                        <asp:TextBox ID="txtOldpass" runat="server" CssClass="email" placeholder="Enter Old Password" TextMode="Password"></asp:TextBox>
                        <asp:TextBox ID="txtNewpass" runat="server" CssClass="email" placeholder="Enter New Password" TextMode="Password"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Change Password" BackColor="#0043A2" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="Button1_Click" /><br />
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="View Orders" BackColor="#0043A2" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
            <!-- //form -->
        </div>


       <%-- <div class="container px-3 my-5 clearfix">
            <!-- Shopping cart table -->
            <div class="card">
                <div class="card-header">
                    <h2>Order History</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered m-0" style="font-size: large;">
                            <thead>
                                <tr>
                                    <!-- Set columns width -->
                                    <th class="text-center py-4 px-4" style="width: 100px;">Order id</th>
                                    <th class="text-center py-4 px-4" style="width: 100px;">Name</th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                    <th class="text-center py-3 px-4" style="width: 120px;">Placed_On</th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Delivery Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                        <tr>
                                            <td class="p-4">
                                                <div class="media align-items-center">
                                                    <div class="media-body">
                                                        <a href="" class="d-block text-dark"><Order ID</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right font-weight-semibold align-middle p-4">Name</td>
                                            <td class="align-middle p-2"><input type="text" class="form-control text-center" value="₹Price" readonly></td>
                                            <td class="text-right font-weight-semibold align-middle p-4"> Date</td>
                                            <td class="text-right font-weight-semibold align-middle p-4"> Delivery Status</td>
                                        </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- / Shopping cart table -->

                </div>
            </div>
        </div>--%>
    
        <center>

            <br />
            <br />
            <br />
            <br />

        </center>
   
    </section>
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
