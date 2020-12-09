<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.Date"%>
<%@page import="zseqw123.Util"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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

<%
	Connection conn = null;
	PreparedStatement st = null;
	ResultSet rs = null;

	String sql = "SELECT * FROM MOM";
	int userMom= Integer.parseInt(request.getParameter("userID").toString());
	try {
		conn = Util.getDataSource().getConnection();
		st = conn.prepareStatement(sql);
		rs = st.executeQuery();
		boolean boo = true;		
		while (rs.next()) {
			if(rs.getInt("USERUID")==userMom){
				boo=false;
				if(boo == false){	
					out.print("<script>");
					out.print("window.alert('大哥不能重複註冊');");
					out.print("location.href = 'extar.jsp'");
					out.print("</script>");					
				}
				break;
			}
			
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		Util.close(rs, st, conn);
	}
	%>





	<div class="container">

		<article class="col-8">
			<form action="/jsptest/MomRegisterServlet"
				onsubmit="return isCheck()" method="POST"
				style="margin: auto; float: 50px;">
				<div>
					<b>
						<p>
						<h4>
							<i><b>申請成為寵物保姆</b></i>
						</h4>
						</p>
					</b> <br> <br> <b>
						<p>保姆服務內容</p>
					</b>
					<div class="input-group mb-3">
						<!-- idService -->
						<div class="col-sm-3">
							<label for="idService">服務標題</label>
						</div>
						<input type="text" class="form-control" id="idService"
							name="title" type="text" required=" ">
					</div>

					<div class="input-group mb-3">
						<!-- idMoney -->
						<div class="col-sm-3">
							<label for="idMoney">年資</label>
						</div>
						<input type="text" class="form-control" id="idMoney"
							name="experience" type="text" required=" ">
					</div>
					<div class="input-group mb-3">
						<!-- idMoney -->
						<div class="col-sm-3">
							<label for="notic"> 接待注意事項</label>
						</div>
						<textarea class="form-control" name="notices" id="notic" rows="6"></textarea>
					</div>
					<div class="input-group mb-3">
						<!-- exampleFormControlTextarea1 -->
						<div class="col-sm-3">
							<label for="exampleFormControlTextarea1">服務說明</label>
						</div>
						<textarea class="form-control" name="petContent"
							id="exampleFormControlTextarea1" rows="6"></textarea>
					</div>
					<div class="input-group mb-3">
						<!-- myFilePic -->
						<div class="col-sm-3">
							<label for="myFilePic">照片</label>
						</div>
						<input id="myFilePic" type="file" name="pic" multiple
							class="file-loading">
					</div>
				</div>
				<br>
				<div>
					<b>
						<p>服務項目</p>
					</b>
					<div>

						<small>項目與價格</small> <br>

						<div>
							<div class="input-group mb-3">
								<div class="col-sm-3"></div>
								<div>
									<label class="form-check-label" for="check1">安親托育</label> <input
										class="inp" type="text" name="proPrice1" id="input1"
										placeholder="保姆家照顧的價錢">
								</div>
							</div>
						</div>

						<div>
							<div class="input-group mb-3">
								<div class="col-sm-3"></div>
								<div>
									<label class="form-check-label" for="check2">寄宿照顧</label> <input
										type="text" class="inp" name="proPrice2" id="input2"
										placeholder="保姆家過夜的價格">
								</div>
							</div>
						</div>

						<div>
							<div class="input-group mb-3">
								<div class="col-sm-3"></div>
								<div>
									<label class="form-check-label" for="check3">到府陪伴</label> <input
										type="text" class="inp" name="proPrice3" id="input3"
										placeholder="到府陪伴的價格">
								</div>
							</div>
						</div>

						<div>
							<div class="input-group mb-3">
								<div class="col-sm-3"></div>
								<div>
									<label class="form-check-label" for="check4">到府遛狗</label> <input
										type="text" class="inp" name="proPrice4" id="input4"
										placeholder="到府帶狗狗散步的價格">
								</div>
							</div>
						</div>

					</div>
					<div>

						<small>寵物體型</small>

						<div class="input-group mb-3">
							<div class="col-sm-3"></div>
							<div>
								<input class="chk" name="bodyType1" type="checkbox" id="check5"
									value="迷你犬(0~4kg)"> <label for="check5"><small
									style="font-size: small;">迷你犬(0~4kg)</small></label>
							</div>
						</div>


						<div class="input-group mb-3">
							<div class="col-sm-3"></div>
							<div>
								<input class="chk" name="bodyType2" type="checkbox" id="check6"
									value="小型犬(4~10kg)"> <label for="check6"><small
									style="font-size: small;">小型犬(4~10kg) </small></label>
							</div>
						</div>


						<div class="input-group mb-3">
							<div class="col-sm-3"></div>
							<div>
								<input class="chk" name="bodyType3" type="checkbox" id="check7"
									value="中型犬(10~24kg)"> <label for="check7"><small
									style="font-size: small;">中型犬(10~24kg)</small></label>
							</div>
						</div>

						<div class="input-group mb-3">
							<div class="col-sm-3"></div>
							<div>
								<input class="chk" name="bodyType4" type="checkbox" id="check8"
									value="大型犬(24kg以上)"> <label for="check8"><small
									style="font-size: small;">大型犬(24kg以上)</small></label>
							</div>
						</div>

						<div class="input-group mb-3">
							<div class="col-sm-3"></div>
							<div>
								<input class="chk" name="bodyType5" type="checkbox" id="check9"
									value="貓"> <label for="check9"> <small
									style="font-size: small;">貓</small></label>
							</div>
						</div>
					</div>


					<br>

					<div class="form-check" style="text-align: center;">
						<!-- checked -->
						<!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1"><p style="color: red;">我同意AccompanyMe的服務條款</p></label> -->

						<button type="submit" class="btn btn-primary" name="submit">送出</button>
					</div>
			</form>

		</article>
	</div>
	<script>
		function isCheck() {
			let inpValue = document.getElementsByClassName("inp");
			let inpCount = 0;
			for (let i = 0; i < inpValue.length; i++) {
				//console.log(inpValue[i].value);
				if (inpValue[i].value > 0) {
					inpCount++;
				}
			}
			console.log(inpCount);
			if (inpCount < 1) {
				window.alert("服務價格 至少輸一個吧大哥");
				return false;
			}

			let chkValue = document.getElementsByClassName("chk");
			let chkCount = 0;
			for (let i = 0; i < chkValue.length; i++) {
				if (chkValue[i].checked == true) {
					chkCount++;
				}

			}
			console.log(chkCount);
			if (chkCount < 1) {
				window.alert("寵物品種 至少輸一個吧大哥");
				return false;
			} else {
				return true;
			}

		}
	</script>

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


	<!-- TWzipcode的js -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	<script>
		$("#twzipcode_ADV").twzipcode({
			zipcodeIntoDistrict : true, // 郵遞區號自動顯示在地區
			css : [ "city form-control", "town form-control", ], // 自訂 "城市"、"地區" class 名稱 
			countyName : "city", // 自訂城市 select 標籤的 name 值
			districtName : "town" // 自訂地區 select 標籤的 name 值
		});
	</script>

	<script>
		$(function() { //會到最上層的jquery
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