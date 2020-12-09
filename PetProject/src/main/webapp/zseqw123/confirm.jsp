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
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #E0E0E0;
}

article {
	/* border:1px solid gray; */
	border-radius: 15px;
	padding: 30px 80px;
	background-color: #ffffff;
}

.h4 {
	/*nav消除間距*/
	margin: 0px;
}

#gotop {
	/*回到top按鈕設計*/
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

#gotop:hover {
	/*button滑入不要背景顏色*/
	background-color: transparent;
}

input[type="text"] {
	text-align: center;
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

	<sql:query dataSource="${ds}" var="result">
   		SELECT * FROM LIST WHERE MEMBERUID = <%=session.getAttribute("user") %>
	</sql:query>
	<c:forEach var="row" items="${result.rows}">


		<div class="container">
			<form action=".\MomRegisterServlet" method="post">
				<table width="50%" style="margin: auto;">
				<tr bgcolor="#FFFFE1">
						<td>訂單狀態</td>
						<td><c:out value="${row.LISTSTATUS}" /></td>
					</tr>
					<tr bgcolor="#F2F4FB">
						<td>建立時間</td>
						<td><c:out value="${row.LISTCREATETIME}" /></td>
					</tr>
					<tr bgcolor="#FFFFE1">
						<td>手機</td>
						<td><c:out value="${row.CONNPHONE}" /></td>
					</tr>
					<tr bgcolor="#F2F4FB">
						<td>地址</td>
						<td><c:out value="${row.COUNTRY}" />&emsp;&emsp; <c:out
								value="${row.DISTRICT}" />&emsp;&emsp; <c:out
								value="${row.ADDRESS}" /></td>
					</tr>
					<tr bgcolor="#FFFFE1">
						<td>寵物名字</td>
						<td><c:out value="${row.PETNAME}" /></td>
					</tr>
					<tr bgcolor="#F2F4FB">
						<td>品種</td>
						<td><c:out value="${row.PETBREED}" /></td>
					</tr>
					<tr bgcolor="#FFFFE1">
						<td>年齡</td>
						<td><c:out value="${row.PETAGE}" /></td>
					</tr>
					<tr bgcolor="#F2F4FB">
						<td>性別</td>
						<td><c:out value="${row.PETGENDER}" /></td>
					</tr>
					<tr bgcolor="#FFFFE1">
						<td>寵物體型</td>
						<td><c:out value="${row.PETTYPE}" /></td>
					</tr>
					<tr bgcolor="#F2F4FB">
						<td>預約時段</td>
						<td><c:out value="${row.CHOOSESARTDATE}" />~ <c:out
								value="${row.CHOOSEENDDATE}" /></td>
					</tr>
					<tr bgcolor="#FFFFE1">
						<td>服務價格</td>
						<td><c:out value="${row.SERVICE}" />&emsp;&emsp;元</td>
					</tr>
				
				</table>
				<center>
					<button type="button" name="reg" id="reg" onclick="goToExtar()">確認</button>
				</center>
			</form>
	</c:forEach>
		</div>


		<button type="button" class="btn btn-outline-primary" id="gotop"></button>
		<!--回最上層button-->

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
		<script>
			function goToExtar() {
			location.href = "extar.jsp";	
			}
		</script>
		<script>
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