<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="Dsms.WebForm10" %>
<link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            text-align: center;
            padding: 0px 0;
            background: #EBF0F5;
        }

        h1 {
            color: #88B04B;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-weight: 900;
            font-size: 40px;
            margin-bottom: 10px;
        }

        p {
            color: #404F5E;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-size: 20px;
            margin: 0;
        }

        i {
            color: #9ABC66;
            font-size: 100px;
            line-height: 200px;
            margin-left: -15px;
        }

        .card {
            background: white;
            padding: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;
            display: inline-block;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SqlDataSource1" Visible="False">
        <Columns>
            <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
            <asp:BoundField DataField="ptype" HeaderText="ptype" SortExpression="ptype" />
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LAPTOP-B85NU0HM\SQLEXPRESS;Initial Catalog=dbDsms;Integrated Security=True;MultipleActiveResultSets=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblCart] WHERE ([uid] = @uid)">
        <SelectParameters>
            <asp:SessionParameter Name="uid" SessionField="uid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <div class="card">
        <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
            <i class="checkmark">✓</i>
        </div>
        <h1>Success</h1>
        <p>We received your purchase request;<br /> You will receive your order by </p><br>
        <asp:Label ID="Label1" runat="server" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Continue Shopping" BackColor="#83A948" CssClass="btn btn-primary" Font-Size="Medium" ForeColor="White" OnClick="Button1_Click" /><br />
         <br /><asp:Button ID="Button2" runat="server" Text="Get Invoice" BackColor="red" CssClass="btn btn-primary" Font-Size="Medium" ForeColor="White" OnClick="Button2_Click" />
    </div>
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
