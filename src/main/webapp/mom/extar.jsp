<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh-Hant-TW">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap初始規模-->
<title>AccompanyMe</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
#map { /*google map 要給大小 不然不會顯示*/
	height: 1000px;
	width: 100%;
}

#gotop { /*回到top按鈕設計*/
	position: fixed;
	right: 30px;
	bottom: 31px;
	width: 50px;
	height: 50px;
	text-align: center;
	border: none;
	background-image: url("Images/up.png");
	background-size: 50px 50px;
}

#gotop:hover { /*button滑入不要背景顏色*/
	background-color: transparent;
}
</style>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<!--要include 的程式 最下面還有-->
</head>

<body>

	<jsp:include page="Header.jsp"/>

	<div class="container">

		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="Images/fkpofpeffe.jpg" style="width:1100px; height:325px;">
				</div>
				<div class="carousel-item">
					<img src="Images/dogcover.jpg" style="width:1100px; height:325px;">
				</div>
				<div class="carousel-item">
					<img src="Images/cat-spot-in-Japan-2.jpg" style="width:1100px; height:325px;">
				</div>
					<div class="carousel-item">
					<img src="Images/寵物-背版2.jpg " style="width:1100px; height:325px;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>

		<div class="row justify-content-center">
			<!--保母搜尋框框自己改-->
			<input type="text"><input type="button" value="搜尋">

		</div>
		<div class="row justify-content-center">
			<button type="button" name="reg" id="reg" onclick="go()">註冊保姆</button>
		</div>

		<script>
			function go() {
		<%if (session.getAttribute("user") == null || session.getAttribute("user") == "") {%>
			window.alert("請先登入");
		<%} else {%>
			location.href = "registerMom.jsp?userID=<%=session.getAttribute("user").toString()%>";
		<%}%>
			}
			
		</script>


		<div class="row">
			<article class="col-8">
			</article>

			<div class="col">
				<!--右邊google地圖 剩下自己設定-->

				<div id="map"></div>

			</div>
		</div>
	</div>

	<div w3-include-html="footer.html"></div>
	<!--要include 的地方-->

	<button type="button" class="btn btn-outline-primary" id="gotop"></button>


	<!--include 的下半部分-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!--bootstrap的東西-->

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChBlcBS8CVWG0N3smlRpMO678wobs4bdA&callback=initMap">
		
	</script>
	<!--把key= 到 &的金鑰換成自己的 googlemap 引用script設定-->

	<script>
		function initMap() {/*要用googleamp的初始參數設定*/
			var uluru = {
				lat : 23.58,
				lng : 120.58
			};/*經緯度 目前大約是台灣*/
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,/*放大比例*/
				center : uluru
			});
		}

		$(function() {//會到最上層的jquery
			$('#gotop').click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 333);
			});
			$(window).scroll(function() {
				if ($(this).scrollTop() > 300) {
					$('#gotop').fadeIn(222);
				} else {
					$('#gotop').stop().fadeOut(222);
				}
			}).scroll();
		});
	</script>

</body>

</html>