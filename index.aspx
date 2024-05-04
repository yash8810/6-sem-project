<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Dsms.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="x-icon" href="images\titlelogo.png">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <section class="home" id="home">

      <div class="swiper home-slider">

         <div class="swiper-wrapper">

            <div class="swiper-slide slide" style="background: url(images/1.jpeg) no-repeat;">
               <div class="content">
                  <span>Sweet Candies</span>
                  <h3>We have   Wide variety of it</h3>
                  <a href="Product.aspx" class="btn">get started</a>
               </div>
            </div>

            <div class="swiper-slide slide" style="background: url(images/baner.jpg) no-repeat;">
               <div class="content">
                  <span>Need Chips?</span>
                  <h3>We have it too!</h3>
                  <a href="Product.aspx" class="btn">get started</a>
               </div>
            </div>

            <div class="swiper-slide slide" style="background: url(images/3.jpeg) no-repeat;">
               <div class="content">
                  <span>Mouth Watering Biscuits?</span>
                  <h3>Have A biscuits!</h3>
                  <a href="Product.aspx" class="btn">get started</a>
               </div>
            </div>

         </div>

         <div class="swiper-button-next"></div>
         <div class="swiper-button-prev"></div>

      </div>

   </section>

   <!-- home section ends -->

   <!-- about section starts  -->

   <section class="about" id="about">

      <div class="image">
         <img src="images/about1.jpeg" alt="">
      </div>

      <div class="content">
         <h3 class="title">welcome to our Webstore</h3>
         <p>We are famous seller in surat! Specially known for wide range of chocolates,chips,mystreybox,noodles,
          We have Imported Chocolates and Gift Hampers too!</p>
        <%-- <div class="icons-container">
            <div class="icons">
               <img src="images/about-icon-1.png" alt="">
               <h3>quality Dryfruit</h3>
            </div>
            <div class="icons">
               <img src="images/about-icon-2.png" alt="">
               <h3>Spices</h3>
            </div>
            <div class="icons">
               <img src="images/about-icon-3.png" alt="">
               <h3>Namkeens</h3>
            </div>
         </div>--%>
      </div>

   </section>

   <!-- about section ends -->

   <!-- food section starts  -->

   <section class="food" id="food">

      <div class="heading">
         <span>popular dryfruits</span>
         <h3>our expertise!</h3>
      </div>

      <div class="swiper food-slider">

         <div class="swiper-wrapper">

            <div class="swiper-slide slide" data-name="food-1">
               <img src="images/cheetos.jpg" alt="">
               <h3>Cashew</h3>
               <div class="price">₹200</div>
            </div>

            <div class="swiper-slide slide" data-name="food-2">
               <img src="images/beer.jpg">
               <h3>beer Lemonande
               <div class="price">₹150</div>
            </div>

            <div class="swiper-slide slide" data-name="food-3">
               <img src="images/biscoff.jpg" alt="">
               <h3>Biscoff</h3>
               <div class="price">₹300</div>
            </div>

         </div>

         <div class="swiper-pagination"></div>

      </div>

   </section>

   <!-- food section ends -->

   <!-- food preview section starts  -->

   <section class="food-preview-container">

      <div id="close-preview" class="fas fa-times"></div>

      <div class="food-preview" data-target="food-1">
         <img src="../images/cheetos.jpg" alt="">
         <h3>Cheetos</h3>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
         </div>
         <p>Hot chille flavour</p>
         <div class="price">₹200</div>
         <a href="Product.aspx" class="btn">buy now</a>
      </div>
       <
      <div class="food-preview" data-target="food-2">
         <img src="images/beer.jpg" alt="">
         <h3>Beer lemonade</h3>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
         </div>
         <p>lemonande</p>
         <div class="price">₹150</div>
         <a href="Product.aspx" class="btn">buy now</a>
      </div>

      <div class="food-preview" data-target="food-3">
         <img src="images/biscoff.jpg" alt="">
         <h3>Almonds</h3>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
         </div>
         <p>Biscoff</p>
         <div class="price">₹300</div>
         <a href="Product.aspx" class="btn">buy now</a>
      </div>

   </section>

   <!-- food preview section ends -->


   <!-- blogs section starts  -->

   <%--<section class="blogs" id="blogs">

      <div class="heading">
         <span>Review Point</span>
         <h3>Our Latest reviews!</h3>
      </div>

      <div class="swiper blogs-slider">

         <div class="swiper-wrapper">

            <div class="swiper-slide slide">
               <div class="image">
                  <img src="images/blog-img-1.jpg" alt="">
                  <span>bharat masala</span>
               </div>
               <div class="content">
                  <div class="icon">
                     <a href="#"> <i class="fas fa-calendar"></i> 15th april, 2022 </a>
                     <a href="#"> <i class="fas fa-user"></i> by Drashti Patel </a>
                  </div>
                  <a href="#" class="title">"Bharat Masala in adajan!"</a>
                  <p>It's good to have bharat masala nearby as we don't have to travel more!</p>
               </div>
            </div>

            <div class="swiper-slide slide">
               <div class="image">
                  <img src="images/blog-img-2.jpg" alt="">
                  <span>gift hampers</span>
               </div>
               <div class="content">
                  <div class="icon">
                     <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2022 </a>
                     <a href="#"> <i class="fas fa-user"></i> by jay dave</a>
                  </div>
                  <a href="#" class="title">Best Gift Hampers i'd seen</a>
                  <p>I want gift hamper for rakshabandhan and i'd found the best hamper!</p>
               </div>
            </div>

            <div class="swiper-slide slide">
               <div class="image">
                  <img src="images/blog-img-3.jpeg" alt="">
                  <span>services</span>
               </div>
               <div class="content">
                  <div class="icon">
                     <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2022 </a>
                     <a href="#"> <i class="fas fa-user"></i> by ayush rokad</a>
                  </div>
                  <a href="#" class="title">Very Good Services!</a>
                  <p>They were out of stock but they just arranged it by that day evening.</p>
               </div>
            </div>

            <div class="swiper-slide slide">
               <div class="image">
                  <img src="images/blog-img-6.jpg" alt="">
                  <span>quality</span>
               </div>
               <div class="content">
                  <div class="icon">
                     <a href="#"> <i class="fas fa-calendar"></i> 10th march, 2022 </a>
                     <a href="#"> <i class="fas fa-user"></i> by Ved Master</a>
                  </div>
                  <a href="#" class="title">"Best quality of dryfruit!"</a>
                  <p>I founded best quality of all dryfruits at cheap prices!</p>
               </div>
            </div>

         </div>
         <a href="feedback.aspx" class="btn">Add Feedback</a>
         <div class="swiper-pagination"></div>

      </div>

   </section>--%>

   <!-- footer section starts  -->

   <section class="footer" id="footer">

      <div class="icons-container">

         <div class="icons">
            <i class="fas fa-clock"></i>
            <h3>opening hours</h3>
            <p>09:00am to 08:00pm</p>
         </div>

         <div class="icons">
            <i class="fas fa-phone"></i>
            <h3>phone</h3>
            <p>+91 9311254280</p>
           
         </div>

         <div class="icons">
            <i class="fas fa-envelope"></i>
            <h3>email</h3>
            <p>munchbagsstorein@gmail.com</p>
         </div>

         <div class="icons">
            <i class="fas fa-map"></i>
            <h3>address</h3>
            <p>Regent Residency,Opp. Pratham Ganesha Apt., Nr. Pratham Circle,Pal-Adajan,Surat - 395009</p>
         </div>

      </div>

      <div class="share">
         <a href="https://m.facebook.com/munchbag.in" class="fab fa-facebook-f"></a>
         <a href="https://twitter.com/i/flow/login?redirect_after_login=%2Fmunchbagdotin" class="fab fa-twitter"></a>
         <a href="https://www.instagram.com/munchbag.in" class="fab fa-instagram"></a>
      </div>

      <div class="qr">
         <br>
         <br>
         <h2>Scan to get all the information!</h2>
         <img src="images\qr.jpg" style="width: 200px;">
      </div>

      <div class="credit"> created by <span>Yash Pate,Dhruv Lalwala,Harshil Panwala</span> | all rights reserved! </div>

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
