<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Dsms.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <section class="menu" id="menu">
      <section class="gallery" id="gallery">

         <div class="heading">
            <span>our gallery</span>
            <h3>our untold stories</h3>
         </div>
          <center>
         <div class="gallery-container">

            <%--<a href="images/food-galler-img-1.jpg" class="box">

               <img src="images/food-galler-img-1.jpg" alt="">
               <div class="icon"> <i class="fas fa-plus"></i> </div>
            </a>--%>

             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal">
                 <ItemTemplate>
                     <asp:Image ID="Image1" runat="server" Height="500px" ImageUrl='<%# Eval("path") %>' Width="500px" />
                 </ItemTemplate>
             </asp:DataList>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT [path] FROM [tblImages]"></asp:SqlDataSource>

         </div>
              </center>
      </section>

      <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

      <script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>

      <!-- custom js file link  -->
      <script src="js/script.js"></script>

      <script>
         lightGallery(document.querySelector('.gallery .gallery-container'));
      </script>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </section>
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
