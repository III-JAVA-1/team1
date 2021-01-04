<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

	<jsp:include page="Header.jsp" />






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
					<img src="Images/fkpofpeffe.jpg"
						style="width: 1100px; height: 325px;">
				</div>
				<div class="carousel-item">
					<img src="Images/dogcover.jpg"
						style="width: 1100px; height: 325px;">
				</div>
				<div class="carousel-item">
					<img src="Images/cat-spot-in-Japan-2.jpg"
						style="width: 1100px; height: 325px;">
				</div>
				<div class="carousel-item">
					<img src="Images/寵物-背版2.jpg " style="width: 1100px; height: 325px;">
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
			<div class="row">
				<div class="col-md-4">
					<select name="country" id="selectArea" class="form-control">
						<option value="0">台北市</option>
						<option value="1">新北市</option>
						<option value="2">桃園市</option>
						<option value="3">台中市</option>
						<option value="4">台南市</option>
						<option value="5">高雄市</option>
						<option value="6">基隆市</option>
						<option value="7">新竹市</option>
						<option value="8">新竹縣</option>
						<option value="9">嘉義市</option>
						<option value="10">嘉義縣</option>
						<option value="11">苗栗縣</option>
						<option value="12">彰化縣</option>
						<option value="13">南投縣</option>
						<option value="14">雲林縣</option>
						<option value="15">屏東縣</option>
						<option value="16">宜蘭縣</option>
						<option value="17">花蓮縣</option>
						<option value="18">台東縣</option>
						<option value="19">澎湖縣</option>
					</select>
				</div>
				<div class="col-md-5">
					<input type="text" name="title" class="form-control">
				</div>
				<div class="col-md-3">
					<input type="button" value="搜尋" class="btn btn-primary">
				</div>
			</div>

			<button class="btn btn-secondary" type="button" name="reg" id="reg"
				onclick="go()">註冊保姆</button>

			<div class="col-md-7"></div>
		</div>

		
		<br>
		<div class="row">
		
			<div class="col-md-8">
			
				<div class="row" id="showMom">
<!-- 					<div class="col-md-4"> -->
<!-- 						<img src="Images/test.jpg" alt=""> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-1"></div> -->
<!-- 					<div class="col-md-7"> -->
<!-- 						<h5 id="title"></h5> -->
<!-- 						<br> <small id="momName"></small> <br>  -->
<!-- 						<small id="type"></small> <br> -->
<!-- 						<small id="notices"></small> -->

<!-- 						<button class="btn btn-secondary" type="button" name="reg" -->
<!-- 							id="reg" onclick="goTo()" style="position: absolute; bottom: 10px; right: 10px;">預約</button> -->
<!-- 					</div> -->
				</div>
			</div>
			
					

			<div class="col-md-4">
				    <div id="map"></div>
					<!--右邊google地圖 剩下自己設定-->
			
			</div>
		</div>
	</div>
	<script>
		function go() {
	<%if (session.getAttribute("user") == null || session.getAttribute("user") == "") {%>
		window.alert("請先登入");
	<%} else {%>
		location.href = "registerMom.jsp"
	<%}%>
		}
	
		function goTo() {
			<%if (session.getAttribute("user") == null || session.getAttribute("user") == "") {%>
			window.alert("請先登入");
		<%} else {%>
		location.href = "reservtion.jsp"
		<%}%>
		}
	</script>



	<jsp:include page="Footer.jsp" />
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

		$().ready(function() {
			$.ajax({
				url : "../mom/allMom",
				type : "post",
				dataType : "json",
				data : {
					"country" :"",
					"title" : "",
				},
				success : function(data) {
					$.each(data, function(n, m) {	
				$("#showMom").append(
					"<div class='col-md-4' >"
							+"<img src='Images/test.jpg'>"
						+"</div>"
						+"<div class='col-md-1'></div>"
						+"<div class='col-md-7'>"
							+"<h5 >"+m[1]+"</h5>"
							+"<br> <small >"+m[2]+"</small> <br>" 
							+"<small >"+m[3]+"</small> <br>"
							+"<small >"+m[4]+"</small> <br>"
							+"<small >"+m[5]+"</small> <br>"
							+"<small >"+m[6]+"</small>" 

							+"<button class='btn btn-secondary' type='button' name='reg'"
								+"id='reg' onclick='goTo()' style='position: absolute; bottom: 10px; right: 20px;'>預約</button>"
								+"<hr>"
												
					);

					});
				}

			});
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<!-- TWzipcode的js -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	<script>
		$("#twzipcode_My").twzipcode({
			css : [ "city form-control", "town form-control" ],
			countyName : "city", // 自訂城市 select 標籤的 name 值
			districtName : "town", // 自訂地區 select 標籤的 name 值
		});
	</script>

</body>

</html>