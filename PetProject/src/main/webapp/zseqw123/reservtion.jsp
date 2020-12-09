<%@page import="javax.swing.text.Document"%>
<%@page import="java.sql.Date"%>
<%@page import="zseqw123.Util"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
@import url(https://fonts.googleapis.com/css?family=Lily+Script+One);

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

input[type="file"] {
	width: 415px;
	height: 200px;
	border: aqua solid 2px;
}
</style>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<!--要include 的程式 最下面還有-->
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
	
	<%		
		if(request.getParameter("useriid").toString().equals(session.getAttribute("user").toString()))
		{
			out.print("<script>");
			out.print("window.alert('大哥不能自己預約自己'); window.location.href='extar.jsp';");
			out.print("</script>");
		}
	%>
	<div class="container">

		<article class="col-8">

			<form action="/jsptest/MomRegisterServlet" method="POST"
				style="margin: auto;" onsubmit="goTime()">

				<div>
					<b>
						<p>
						<h4>
							<i><b>聯絡<c:set var="momidd" value='<%=Integer.parseInt(request.getParameter("useriid").toString())%>'/>
							
							<sql:query dataSource="${ds}" var="result">
   									SELECT * FROM Member WHERE Member.U_Id = ?
   							<sql:param value="${momidd}" />	
							</sql:query>
							<c:forEach var="roww" items="${result.rows}">
								<c:out value="${roww.Sname}" />
							
							</b></i>
						</h4>
						</p>
					</b> <br> <b>
						<p>會員基本資料</p>
					</b>

					<div class="input-group mb-3">

						<div class="col-sm-3">
							<label for="userPhone">手機</label>
						</div>
						<input type="text" class="form-control" id="userPhone" type="text" name="connPhone"
							required=" " value="<c:out value="${roww.Phone}" />">
							
							</c:forEach>
					</div>

					<div class="input-group mb-3">
						<!-- idAddress -->

						<div class="form-inline" role="form">
							<div id="twzipcode_My" >&emsp;地址&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</div>
							
							<input class="form-control" id="idAddress" type="text" name="address"
								required=" " placeholder="地址">
						</div>
					</div>
				</div>
				<br>
				<input type="hidden" name="momUID" value="<%=request.getParameter("momId").toString() %>">
				<input type="hidden" name="listCreate" value="" id="listCreate">
				<input type="hidden" name="status" value="處理中">
				
				<div>
					<b>
						<p>寵物資料</p>
					</b>
					<div class="input-group mb-3">

						<div class="col-sm-3">
							<label for="petName">寵物名字</label>
						</div>
						<input type="text" class="form-control" id="petName" type="text" name="petName"
							required=" ">
					</div>

					<div class="input-group mb-3">

						<div class="col-sm-3">
							<label for="breed">品種</label>
						</div>
						<input type="text" class="form-control" id="breed" type="text" name="petBreed"
							required=" ">
					</div>

					<div class="input-group mb-3">

						<div class="col-sm-3">
							<label for="age">年齡</label>
						</div>
						<input type="text" class="form-control" id="age" type="text" name="petAge"
							required=" ">
					</div>

					<div class="input-group mb-3">
						<div class="col-sm-3">
							<label for="gender">性別</label>
						</div>
						<select class="custom-select" name="petGender">
							<option>公</option>
							<option>母</option>
						</select>
					</div>

					<div class="input-group mb-3">
						<div class="col-sm-3">
							<label for="type">體型</label>
						</div>
						
						<select class="custom-select" name="petType">
							<c:set var="momidd" value='<%=Integer.parseInt(request.getParameter("momId").toString())%>'/>
							<sql:query dataSource="${ds}" var="result">
   								SELECT * FROM MOM WHERE MOMID = ?
   							<sql:param value="${momidd}" />	
							</sql:query>
							<c:forEach var="row" items="${result.rows}">
								<c:if test="${row.BODYTYPE1 != 'null'}">
									<option value="<c:out value="${row.BODYTYPE1}"/>">迷你犬(0~4kg)</option>
								</c:if>
								
								<c:if test="${row.BODYTYPE2 != 'null'}">
									<option value="<c:out value="${row.BODYTYPE2}"/>">小型犬(4~10kg)</option>
								</c:if>
								
								<c:if test="${row.BODYTYPE3 != 'null'}">
									<option value="<c:out value="${row.BODYTYPE3}"/>">中型犬(10~24kg)</option>
								</c:if>
								
								<c:if test="${row.BODYTYPE4 != 'null'}">
									<option value="<c:out value="${row.BODYTYPE4}"/>"> 大型犬(24kg以上)</option>
								</c:if>
								
								<c:if test="${row.BODYTYPE5 != 'null'}">
									<option value="<c:out value="${row.BODYTYPE5}"/>"> 貓</option>
								</c:if>
		
						</select>
					</div>
				</div>
				<br>
				<div>
					<b>
						<p>服務項目</p>
					</b>
					<div class="input-group mb-3">
						<div class="col-sm-3">
							<label for="type">服務價格</label>
						</div>
						<select class="custom-select" name="service">
								<c:if test="${row.PROJECTPRICE1 > 0}">
									<option value="<c:out value="${row.PROJECTPRICE1}" />">安親托育&emsp;&emsp;
										<c:out value="${row.PROJECTPRICE1}" />元 
									</option>
								</c:if>

								<c:if test="${row.PROJECTPRICE2 > 0}">
									<option value="<c:out value="${row.PROJECTPRICE2}" />">寄宿照顧&emsp;&emsp;
										<c:out value="${row.PROJECTPRICE2}" />元 
									</option>
								</c:if>

								<c:if test="${row.PROJECTPRICE3 > 0}">
									<option value="<c:out value="${row.PROJECTPRICE3}" />">到府陪伴&emsp;&emsp;
										<c:out value="${row.PROJECTPRICE3}" />元
									</option>
								</c:if>

								<c:if test="${row.PROJECTPRICE4 > 0}">
									<option value="<c:out value="${row.PROJECTPRICE4}" />">到府遛狗
										&emsp;&emsp;
										<c:out value="${row.PROJECTPRICE4}" />元	
									</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="col-sm-3">
							<label for="type">預約時段</label>

						</div>
						<input type="datetime-local"  name="chooseStart" required=" ">至<input type="datetime-local"  name="chooseEnd" required=" ">

					</div>
					<div class="input-group mb-3">

						<div class="col-sm-3">
							<label for="remark"> 備註</label>
						</div>
						<textarea class="form-control" name="remarks" id="remark" rows="6" name="remark"></textarea>
					</div>

				</div>

				<div class="form-check" style="text-align: center;">
					<!-- checked -->
					<!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1"><p style="color: red;">我同意AccompanyMe的服務條款</p></label> -->

					<button type="submit" name="reservtion" class="btn btn-primary">送出</button>
				</div>

			</form>

		</article>

	</div>



	<div w3-include-html="footer.html"></div>
	<!--要include 的地方-->

	<button type="button" class="btn btn-outline-primary" id="gotop"></button>

	<script>
		w3.includeHTML();
	</script>
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

	<!-- TWzipcode的js -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	<script>
		$("#twzipcode_My").twzipcode({
			zipcodeIntoDistrict : true, // 郵遞區號自動顯示在區別選單中
			css : [ "city form-control", "town form-control" ],
			countyName : "city", // 自訂城市 select 標籤的 name 值
			districtName : "town", // 自訂地區 select 標籤的 name 值
			countySel   : '桃園市',
        	districtSel : '中壢區'
			

		});
	</script>

	<script>
		function goTime(){
			 document.getElementById("listCreate").value=new Date();
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