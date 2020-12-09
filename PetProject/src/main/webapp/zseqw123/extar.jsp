<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="zseqw123.Util"%>
<%@page import="java.sql.Connection"%>
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

	<sql:setDataSource var="ds"
		driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
		url="jdbc:sqlserver://127.0.0.1:1433;databaseName=PetDB" user="scott"
		password="tiger" />

	<%
		int userid = 0;
	if (session.getAttribute("user") != null) {
		userid = Integer.parseInt(session.getAttribute("user").toString());
	}
	%>
	<c:set var="useridd" value="<%=userid%>" />
	<!--<c:out value="${useridd}"/>-->

	<jsp:include page="header.jsp"/>

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


		<!--<sql:query dataSource="${ds}" var="result">
   			SELECT USERUID FROM MOM , Member WHERE  Member.U_Id = ?   
   		<sql:param value="${useridd}"></sql:param>
		</sql:query>
		<c:forEach var="row" items="${result.rows}">
			<c:choose>
				<c:when test="${row.USERUID == null}">
					
				</c:when>
				<c:otherwise>
						window.alert("請不要重複註冊");
					</c:otherwise>
			</c:choose>
		</c:forEach>-->
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
				<!--迴圈-->
				<%
					Connection conn = null;
				PreparedStatement st = null;
				ResultSet rs = null;

				String sql = "SELECT * FROM MOM,MEMBER WHERE MOM.USERUID=Member.U_Id";
				try {
					conn = Util.getDataSource().getConnection();
					st = conn.prepareStatement(sql);
					rs = st.executeQuery();

					while (rs.next()) {

						out.print("<div class='media mb-3'>");
						out.print("<img src='"+rs.getString("PICTURE")+"' class='mr-3' width='250' height='200' alt='...沒有圖片'>");
						out.print("<div class='media-body'>");
						out.print("<h5 class='mt-0'>" + rs.getString("title"));
						out.print("</h5>");
						out.print("<smail class='mt-0'>保母資歷:" + rs.getString("EXPERIENCE"));
						out.print("</smail><br>");
						out.print("<smail class='mt-0'>保母名稱:" + rs.getString("Sname"));
						out.print("</smail><br>");
					
						out.print("<smail class='mt-0'>願意接待體型:");
						out.print("</smail><br>");
						if(!(rs.getString("BODYTYPE1").equals("null"))){
							out.print(rs.getString("BODYTYPE1"));
						}
						if(!(rs.getString("BODYTYPE2").equals("null"))){
							out.print(rs.getString("BODYTYPE2"));
						}
						if(!(rs.getString("BODYTYPE3").equals("null"))){
							out.print(rs.getString("BODYTYPE3"));
						}
						out.print("<br>");
						if(!(rs.getString("BODYTYPE4").equals("null"))){
							out.print(rs.getString("BODYTYPE4"));
						}
						if(!(rs.getString("BODYTYPE5").equals("null")) ){
							out.print(rs.getString("BODYTYPE5"));
						}
						out.print("</smail><br>");
			
						out.print("<h5 class='mt-0'>注意事項:" + rs.getString("NOTICES"));
						out.print("</h5>");
						
						if(session.getAttribute("user")==null||session.getAttribute("user")==""){
							out.print("要預約請先登入");
						}
						else{
							out.print("<a href='reservtion.jsp?momId=" + rs.getInt("MOMID")+"&useriid="+rs.getInt("USERUID"));
							out.print("'>預約</a>");
						}
													
						
						
						//System.out.print("<a href='reservtion.jsp?momId='"+rs.getInt("MOMID"));
						//System.out.print("'>預約</a>");
						//request.getParameter("momid");
						out.print("</div>");
						out.print("</div>");
						
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					Util.close(rs, st, conn);
				}
				%>
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