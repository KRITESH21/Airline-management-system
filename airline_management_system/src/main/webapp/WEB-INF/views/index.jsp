<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel Yatri</title>

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href='<spring:url value="/style.css"/>'>




</head>
<body>

	<!-- header section starts  -->

	<header>

		<div id="menu-bar" class="fas fa-bars"></div>

		<a href="#" class="logo"><span>Airline</span>Management<span>System</span></a>

		<nav class="navbar">
			 <a href="#packages">packages</a>
			<a href="#services">services</a> <a href="#gallery">gallery</a> <a
				href="#review">review</a> <a href="#contact">contact</a>
		</nav>

		<div class="icons">
			<i class="fas fa-search" id="search-btn"></i>

			<%
				if ((session.getAttribute("userDetails") == null) || (session.getAttribute("userDetails") == "")) {
			%>
			<i class="fas fa-user" id="login-btn"></i>
			<%
				} else {
			%>
			<i class="fas fa-user" id="myProfile-btn"></i>
			<h2>
				<a href='<spring:url value="/User/myprofile"/>'>
					${sessionScope.userDetails.name} </a>
			</h2>
			<%
				}
			%>
		</div>

		<form action='<spring:url value="/searchflight"/>' method="post" class="search-bar-container">
			<input type="search" name="to" id="search-bar" placeholder="search here...">
			<label for="search-bar" class="fas fa-search"></label>
		</form>

	</header>

	<!-- header section ends -->

	<!-- login form container  -->

	<div class="login-form-container">

		<i class="fas fa-times" id="form-close"></i>

		<form action='<spring:url value="/login"/>' method="post">
			<h2 style="color: red">${requestScope.message}</h2>
			<h3>login</h3>
			<input type="email" name="email" class="box"
				placeholder="enter your email"> <input type="password"
				name="password" class="box" placeholder="enter your password">
			<button class="btn">login now</button>
			<input type="checkbox" id="remember"> <label for="remember">remember
				me</label>
			<p>
				forget password? <a href='<spring:url value="/forgetpassword"/>'>click here</a>
			</p>
			<p>
				don't have and account? <a href='<spring:url value="/signup"/>'>register
					now</a>
			</p>
		</form>

	</div>



	<div class="profile-form-container">

		<i class="fas fa-times" id="form-close1"></i>

		<form action='<spring:url value="/login"/>' method="post">
			<h2 style="color: red">${requestScope.message}</h2>
			<h3>login</h3>
			<input type="email" name="email" class="box"
				placeholder="enter your email"> <input type="password"
				name="password" class="box" placeholder="enter your password">
			<button class="btn">login now</button>
			<input type="checkbox" id="remember"> <label for="remember">remember
				me</label>
			<p>
				forget password? <a href="#">click here</a>
			</p>
			<p>
				don't have and account? <a href='<spring:url value="/signup"/>'>register
					now</a>
			</p>
		</form>

	</div>




	<!-- home section starts  -->

	<section class="home" id="home">

		<div class="content">
			<h3>adventure is worthwhile</h3>
			<p>dicover new places with us, adventure awaits</p>
			<a href="#" class="btn">discover more</a>
		</div>

		<div class="controls">
			<span class="vid-btn active" data-src="images/vid-1.mp4"></span> <span
				class="vid-btn" data-src="images/vid-2.mp4"></span> <span
				class="vid-btn" data-src="images/vid-3.mp4"></span> <span
				class="vid-btn" data-src="images/vid-4.mp4"></span> <span
				class="vid-btn" data-src="images/vid-5.mp4"></span>
		</div>

		<div class="video-container">
			<video src="images/vid-1.mp4" id="video-slider" loop autoplay muted></video>
		</div>

	</section>

	<!-- home section ends -->

	<!-- book section starts  -->


	<section class="packages" id="packages">

		<h1 class="heading">
			<span>AirLine</span>  <span>Management</span>  <span>System</span>
		</h1>

		<div class="box-container">
			<c:forEach var="pac" items="${sessionScope.packages}">
				<div class="box">
					<img src="data:image/jpeg;base64,${pac.imgUtility}" alt="">
					<div class="content">
						<h3>
							<i class="fas fa-map-marker-alt"></i> ${pac.title}
						</h3>
						<p>${pac.fromto}</p>
						<div class="stars">

							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="far fa-star"></i>
						</div>
						<div class="price">
							 ${pac.price} 
						</div>
						<%
							if ((session.getAttribute("userDetails") == null) || (session.getAttribute("userDetails") == "")) {
						%>
						<a href="#login-btn" class="btn">book now</a>

						<%
							} else {
						%>
						<a
							href='<spring:url value="/User/bookPackage?pid=${pac.id}"></spring:url>'
							class="btn">book now</a>
						<%
							}
						%>
					</div>
				</div>
			</c:forEach>



		</div>

	</section>

	<!-- packages section ends -->

	<!-- services section starts  -->

	<section class="services" id="services">

		<h1 class="heading">
			<span>s</span> <span>e</span> <span>r</span> <span>v</span> <span>i</span>
			<span>c</span> <span>e</span> <span>s</span>
		</h1>

		<div class="box-container">

			<div class="box">
				<i class="fas fa-hotel"></i>
				<h3>affordable hotels</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-utensils"></i>
				<h3>food and drinks</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-bullhorn"></i>
				<h3>safty guide</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-globe-asia"></i>
				<h3>around the world</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-plane"></i>
				<h3>fastest travel</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>
			<div class="box">
				<i class="fas fa-hiking"></i>
				<h3>adventures</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
					Inventore commodi earum, quis voluptate exercitationem ut minima
					itaque iusto ipsum corrupti!</p>
			</div>

		</div>

	</section>

	<!-- services section ends -->

	<!-- gallery section starts  -->

	<section class="gallery" id="gallery">

		<h1 class="heading">
			<span>g</span> <span>a</span> <span>l</span> <span>l</span> <span>e</span>
			<span>r</span> <span>y</span>
		</h1>

		<div class="box-container">
			<c:forEach var="img" items="${sessionScope.imageList}">
				<div class="box">
					<img src="data:image/jpeg;base64,${img.imgUtility}" alt="">
					<div class="content">
						<h3>amazing places</h3>
						<p>${img.description}</p>
						<a href="#" class="btn">see more</a>
					</div>
				</div>
			</c:forEach>
		</div>

	</section>

	<!-- gallery section ends -->

	<!-- review section starts  -->

	<section class="review" id="review">

		<h1 class="heading">
			<span>r</span> <span>e</span> <span>v</span> <span>i</span> <span>e</span>
			<span>w</span>
		</h1>

		<div class="swiper-container review-slider">

			<div class="swiper-wrapper">
				<c:forEach var="feed" items="${sessionScope.feedBackList}">
					<div class="swiper-slide">
						<div class="box">
							<img src="data:image/jpeg;base64,${feed.imgUtility}" alt="">
							<h3>${feed.name}</h3>
							<p>${feed.feedback}</p>

							<div class="stars">
								
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>

	</section>

	<!-- review section ends -->

	<!-- contact section starts  -->

	<section class="contact" id="contact">

		<h1 class="heading">
			<span>c</span> <span>o</span> <span>n</span> <span>t</span> <span>a</span>
			<span>c</span> <span>t</span>
		</h1>

		<div class="row">

			<div class="image">
				<img src="images/contact-img.svg" alt="">
			</div>

			<form action='<spring:url value="/User/contactus"/>' method="post">
				<div class="inputBox">
					<input type="text" placeholder="name"> <input type="email"
						placeholder="email">
				</div>
				<div class="inputBox">
					<input type="number" placeholder="number"> <input
						type="text" placeholder="subject">
				</div>
				<textarea placeholder="message" name="" id="" cols="30" rows="10"></textarea>
				<input type="submit" class="btn" value="send message">
			</form>

		</div>

	</section>

	<!-- contact section ends -->

	<!-- brand section  -->


	<!-- footer section  -->

	<section class="footer">

		<div class="box-container">

			<div class="box">
				<h3>about us</h3>
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Assumenda quas magni pariatur est accusantium voluptas enim nemo
					facilis sit debitis.</p>
			</div>
			<div class="box">
				<h3>branch locations</h3>
				<a href="#">india</a> <a href="#">USA</a> <a href="#">japan</a> <a
					href="#">france</a>
			</div>
			<div class="box">
				<h3>quick links</h3>
				<a href="#">home</a> <a href="#">book</a> <a href="#">packages</a> <a
					href="#">services</a> <a href="#">gallery</a> <a href="#">review</a>
				<a href="#">contact</a>
			</div>
			<div class="box">
				<h3>follow us</h3>
				<a href="#">facebook</a> <a href="#">instagram</a> <a href="#">twitter</a>
				<a href="#">linkedin</a>
			</div>

		</div>

		<h1 class="credit">
			Proposed by <span> CDAC Banglore</span> | all rights reserved!
		</h1>

	</section>
















	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- custom js file link  -->
	<script src='<spring:url value="/script.js"/>'></script>
	<script>
		var swiper = new Swiper(".review-slider", {
			spaceBetween : 20,
			loop : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			breakpoints : {
				640 : {
					slidesPerView : 1,
				},
				768 : {
					slidesPerView : 2,
				},
				1024 : {
					slidesPerView : 3,
				},
			},
		});

		var swiper = new Swiper(".brand-slider", {
			spaceBetween : 20,
			loop : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			breakpoints : {
				450 : {
					slidesPerView : 2,
				},
				768 : {
					slidesPerView : 3,
				},
				991 : {
					slidesPerView : 4,
				},
				1200 : {
					slidesPerView : 5,
				},
			},
		});
	</script>

</body>
</html>