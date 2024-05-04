<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="vieworders.aspx.cs" Inherits="Dsms.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <center>
        <br />

        <br />
        <br />
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="onum" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="191px" Width="971px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="onum" HeaderText="onum" InsertVisible="False" ReadOnly="True" SortExpression="onum" />
                <asp:BoundField DataField="uname" HeaderText="uname" SortExpression="uname" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="contact" HeaderText="contact" SortExpression="contact" />
                <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                <asp:HyperLinkField DataNavigateUrlFields="onum" DataNavigateUrlFormatString="report/PrintInvoice.aspx?id={0}" HeaderText="View" Text="View" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT * FROM [tblOrderDetails] WHERE ([uname] = @uname)">
            <SelectParameters>
                <asp:SessionParameter Name="uname" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </center>
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

