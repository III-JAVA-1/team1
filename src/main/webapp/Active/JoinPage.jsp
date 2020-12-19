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

<!-- Custom styles for this template -->
<link href="Styles/index.css" rel="stylesheet">
<script src="https://www.w3schools.com/lib/w3.js"></script>

</head>
<jsp:include page="Header.jsp"/>
<body>


	<!-- NavBar頭-->
	<nav class="navbar navbar-expand-sm bg-light">

		<!-- Links -->
		<ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp">新增活動</a></li>
			
		</ul>

	</nav>

	<!--Nav尾-->
	<div style="background-color: rgb(240, 232, 219); margin-bottom: 50px; width: 1000px; margin: auto;">
		<H1 style="text-align: center;">活動報名</H1>


		<%
			String rqname = request.getParameter("name");//這是把活動代碼接住
		%>

		<!-- 確認報名活動主題 -->
		<div style="text-align: center; font-size: 25px;">
		<p id="act_name"></p>
		</div>
		
		
		
		<div style="text-align: center;">

			
		

		<form action="../Wu/insertJoinAct"  method="POST">
<!-- 			<div style="width: 1000px; margin: 0 auto; padding: 20px;"> -->


					<!-- 各種要給過去的東西type="hidden" -->
					<!-- 活動代碼 -->
					<input type="hidden" name="act_no" id="act_no" value="<%=rqname%>" size="30" /> 
					<!-- UserID -->
					<input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("user")%>">
					<!--活動名稱-->
					<input type="hidden" name="act_name" id="act_name2" value="" >
					<!--參加狀態 -->
					<input type="hidden" name="join_actnow" id="join_actnow" value="已參加">
					
					





				<br> <br> <label for="extratext"><span style="color: rgb(174, 174, 240);">(非必填)</span>攜帶寵物種類:</label>
<!-- 				<div> -->
<!-- 					<input type="text" name="pettype" id="pettype" maxlength="10" placeholder="輸入寵物種類名稱"> -->
<!-- 				</div> -->
				<select name="pettype" id="pettype">
  					<option value="無">無</option>
  					<option value="貓">貓</option>
  					<option value="狗">狗</option>
  					<option value="其他">其他</option>
				</select>
				
				
				<br> 
				<label for="extratext"><span style="color: rgb(174, 174, 240);">(非必填)</span>攜帶寵物數量:</label>
				<div>
					<input type="number" name="petnum" id="petnum" min="0" placeholder="0">
				</div>
				
				
				<br> 
				<label for="extratext"><span style="color: rgb(174, 174, 240);">(非必填)</span>備註:</label>
				<div>
					<textarea style="resize: none; width: 500px; height: 130px;"
							id="extra" name="extra" placeholder="可註明攜帶寵物的種類或各種事項"></textarea>
				</div>
				
				
				<br> <br> 
				
				<button type="submit" id="BtnSend" name="todo" value="join">送出</button>
				
				</form>
			</div>
		<br> 
	</div>
<br>
	<!-- container'sfoot -->

		


</body>

<jsp:include page="Footer.jsp"/>
<script>

$().ready(function(){//ajax完整活動資訊然後把活動標題放進去
	$.ajax({
		url:"../Wu/ActDetail",
		type:"post",
		dataType:"json",
		data:{
			"act_no":<%=rqname %>
		},
		success : function(data) {
			$.each(data,function(i,n){
				
				$("#act_name").html(n.act_name);
				$("#act_name2").val(n.act_name);
						
					});
				}
			});
			   
		});

</script>

</html>