<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Dsms.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <section class="menu" id="dryfruit">
      <div class="heading">
         <span>list</span>
         <h3>Our products</h3>
      </div>
      <div class="swiper menu-slider">
         <div class="swiper-wrapper">
            <div class="swiper-slide slide">
               <h3 class="title">Chocolates</h3>
               <div class="box-container">
                   <%-- <div class="box">
                        <div class="info">
                           <h3>Cashew</h3>
                           <br>
                              <input type="text" size="8" placeholder="quantity" name="quantity" style="height: 45px; font-size: 18px;" required>
                              <select name="weight" style="width: 70px; height: 28px; font-size: 15px;" required>
                                 <option value="250gm">250gms</option>
                              </select><br><br>
                              <input class="btn" type="submit" name="addtocart" value="Add To Cart">
                           <br>
                        </div>
                        <div class="img"><img src="images/cashew.jpg" style="float: right; width: 100px; height: 100px;" >
                        </div>
                        <div class="price">₹750/1kg</div>
                    </div>--%>
                   <asp:DataList ID="DataList1" runat="server" CellPadding="5" DataKeyField="pid" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3">
                       <ItemTemplate>
                            <div class="box">
                            <div class="info">
                               <h3><%# Eval("pname") %></h3>
                               <br>
                                <asp:TextBox ID="txtQuantity1" runat="server" Height="45px" Width="99px" placeholder="Enter Quantity"></asp:TextBox>
                                <%--<asp:DropDownList ID="ddPtype" runat="server">
                                    <asp:ListItem>250gm</asp:ListItem>
                                    <asp:ListItem>500gm</asp:ListItem>
                                    <asp:ListItem>1kg</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:Label ID="pid" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                                <br>
                                <br>
                                <asp:Label ID="lblOS" runat="server" Text="Out of stock!" Font-Size="Large" Visible="False" CssClass="btn"></asp:Label>
                                <asp:Button ID="btnAddtocart" runat="server" CssClass="btn" Text="Add to cart" Width="143px" Height="35px" />
                                <br>

                            </div>
                            <div class="img"><img src="<%# Eval("image") %>" style="float: right; width: 100px; height: 100px;" >
                            </div>
                            <div class="price">₹ <%# Eval("price") %>/1kg</div>
                        </div>
                       </ItemTemplate>

                   </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([category] = @category)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="dryfruit" Name="category" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               </div>
            </div>
         </div>
      </div>
   </section>

    <section class="menu" id="driedfruit">
      <div class="swiper menu-slider">
         <div class="swiper-wrapper">
            <div class="swiper-slide slide">
               <h3 class="title">SoftDrinks</h3>
               <div class="box-container">
                   <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" OnItemCommand="DataList2_ItemCommand" OnItemDataBound="DataList2_ItemDataBound" RepeatColumns="3" >
                        <ItemTemplate>
                            <div class="box">
                            <div class="info">
                               <h3><%# Eval("pname") %></h3>

                               <br>
                                <asp:TextBox ID="txtQuantity2" runat="server" Height="45px" Width="99px" placeholder="Enter Quantity"></asp:TextBox>
                               <%-- <asp:DropDownList ID="ddPtype2" runat="server">
                                    <asp:ListItem>250gm</asp:ListItem>
                                    <asp:ListItem>500gm</asp:ListItem>
                                    <asp:ListItem>1kg</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:Label ID="pid" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                                <br>
                                <br>
                                <asp:Label ID="lblOS2" runat="server" Text="Out of stock!" Font-Size="Large" Visible="False" CssClass="btn"></asp:Label>
                                <asp:Button ID="btnAddtocart" runat="server" CssClass="btn" Text="Add to cart" Width="143px" Height="35px" />
                                <br>

                            </div>
                            <div class="img"><img src="<%# Eval("image") %>" style="float: right; width: 100px; height: 100px;" >
                            </div>
                            <div class="price">₹ <%# Eval("price") %>/1kg</div>
                        </div>
                       </ItemTemplate>
                   </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([category] = @category)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="driedfruit" Name="category" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- menu section ends -->

    <section class="menu" id="masala">
      <div class="swiper menu-slider">
         <div class="swiper-wrapper">
            <div class="swiper-slide slide">
               <h3 class="title">Snacks</h3>
               <div class="box-container">
                   <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" DataKeyField="pid" OnItemCommand="DataList3_ItemCommand" OnItemDataBound="DataList3_ItemDataBound" RepeatColumns="3" >
                       <ItemTemplate>
                            <div class="box">
                            <div class="info">
                               <h3><%# Eval("pname") %></h3>
                               <br>
                                <asp:TextBox ID="txtQuantity3" runat="server" Height="45px" Width="99px" placeholder="Enter Quantity"></asp:TextBox>
                              <%--  <asp:DropDownList ID="ddPtype" runat="server">
                                    <asp:ListItem>250gm</asp:ListItem>
                                    <asp:ListItem>500gm</asp:ListItem>
                                    <asp:ListItem>1kg</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:Label ID="pid" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                                <br>
                                <br>
                                <asp:Label ID="lblOS3" runat="server" Text="Out of stock!" Font-Size="Large" Visible="false" CssClass="btn"></asp:Label>
                                <asp:Button ID="btnAddtocart" runat="server" CssClass="btn" Text="Add to cart" Width="143px" Height="35px" />
                                <br>

                            </div>
                            <div class="img"><img src="<%# Eval("image") %>" style="float: right; width: 100px; height: 100px;" >
                            </div>
                            <div class="price">₹ <%# Eval("price") %>/Pkt</div>
                        </div>
                       </ItemTemplate>
                   </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([category] = @category)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="masala" Name="category" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               </div>
            </div>
         </div>
      </div>
   </section>
     <section class="menu" id="namkeen">
      <div class="swiper menu-slider">
         <div class="swiper-wrapper">
            <div class="swiper-slide slide">
               <h3 class="title">Noodles</h3>
               <div class="box-container">
                   <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4" RepeatDirection="Horizontal" DataKeyField="pid" OnItemCommand="DataList4_ItemCommand" OnItemDataBound="DataList4_ItemDataBound" RepeatColumns="3" >
                       <ItemTemplate>
                            <div class="box">
                            <div class="info">
                               <h3><%# Eval("pname") %></h3>
                               <br>
                                <asp:TextBox ID="txtQuantity4" runat="server" Height="45px" Width="99px" placeholder="Enter Quantity"></asp:TextBox>
                              <%--  <asp:DropDownList ID="ddPtype" runat="server">
                                    <asp:ListItem>250gm</asp:ListItem>
                                    <asp:ListItem>500gm</asp:ListItem>
                                    <asp:ListItem>1kg</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:Label ID="pid" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                                <br>
                                <br>
                                <asp:Label ID="lblOS4" runat="server" Text="Out of stock!" Font-Size="Large" Visible="false" CssClass="btn"></asp:Label>
                                <asp:Button ID="btnAddtocart" runat="server" CssClass="btn" Text="Add to cart" Width="143px" Height="35px" />
                                <br>

                            </div>
                            <div class="img"><img src="<%# Eval("image") %>" style="float: right; width: 100px; height: 100px;" >
                            </div>
                            <div class="price">₹ <%# Eval("price") %>/Pkt</div>
                        </div>
                       </ItemTemplate>
                   </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([category] = @category)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="namkeen" Name="category" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               </div>
            </div>
         </div>
      </div>
   </section>

  

    <section class="menu" id="colddrink">
      <div class="swiper menu-slider">
         <div class="swiper-wrapper">
            <div class="swiper-slide slide">
               <h3 class="title">Mystrey Box</h3>
               <div class="box-container">
                   <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5" RepeatDirection="Horizontal" DataKeyField="pid" OnItemCommand="DataList5_ItemCommand" OnItemDataBound="DataList5_ItemDataBound" RepeatColumns="3" >
                       <ItemTemplate>
                            <div class="box">
                            <div class="info">
                               <h3><%# Eval("pname") %></h3>
                               <br>
                                <asp:TextBox ID="txtQuantity5" runat="server" Height="45px" Width="99px" placeholder="Enter Quantity"></asp:TextBox>
                               <%-- <asp:DropDownList ID="ddPtype" runat="server">
                                    <asp:ListItem>250gm</asp:ListItem>
                                    <asp:ListItem>500gm</asp:ListItem>
                                    <asp:ListItem>1kg</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:Label ID="pid" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                                <br>
                                <br>
                                <asp:Label ID="lblOS5" runat="server" Text="Out of stock!" Font-Size="Large" Visible="false" CssClass="btn"></asp:Label>
                                <asp:Button ID="btnAddtocart" runat="server" CssClass="btn" Text="Add to cart" Width="143px" Height="35px" />
                                <br>

                            </div>
                            <div class="img"><img src="<%# Eval("image") %>" style="float: right; width: 100px; height: 100px;" >
                            </div>
                            <div class="price">₹ <%# Eval("price") %>/Pcs</div>
                        </div>
                       </ItemTemplate>
                   </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbDsmsConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([category] = @category)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="colddrink" Name="category" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               </div>
            </div>
         </div>
      </div>
   </section>
   <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>

   <!-- custom js file link  -->
   <script src="js/script.js"></script>
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   <script>
      lightGallery(document.querySelector('.gallery .gallery-container'));
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
