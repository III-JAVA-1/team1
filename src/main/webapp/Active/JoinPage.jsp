<%@page import="java.sql.Date"%>
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
<title>活動報名</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<script src="https://www.w3schools.com/lib/w3.js"></script>

</head>
<jsp:include page="Header.jsp"/>
<body style="background-color:#F0F0F0;">


	<!-- NavBar頭-->
	<nav class="navbar navbar-expand-sm bg-light">

		<!-- Links -->
		<ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCalender.jsp">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp" onclick="return gogo()">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

	</nav>

	<!--Nav尾-->
	<div style="background-color:#FFFFFF; margin-bottom: 50px; width: 800px; margin: auto;">
		<H1 style="text-align: center;">活動報名</H1>


		<%
			String rqname = request.getParameter("name");//這是把活動代碼接住
		%>

		<!-- 確認報名活動主題 -->
		<div style="text-align: center; font-size: 25px;">
		<p id="act_name"></p>
		</div>
		
		
		
		<div class="container" style="padding:10px 100px;">

			
		

		<form action="../Wu/insertJoinAct"  method="POST">
<!-- 			<div style="width: 1000px; margin: 0 auto; padding: 20px;"> -->


					<!-- 各種要給過去的東西type="hidden" -->
					<!-- 活動代碼 -->
					<input type="hidden" name="act_no" id="act_no" value="<%=rqname%>" size="30" /> 
					<!-- UserID -->
					<input type="hidden" name="u_Id" id="u_Id" value="<%=session.getAttribute("user")%>">
					<!--活動名稱-->
					<input type="hidden" name="act_name" id="act_name2" value="" >
					<!--參加狀態 -->
					<input type="hidden" name="join_actnow" id="join_actnow" value="已參加">
					
					
					
					
					
					
					<div>
					<p>名字:</p>
					<input type="text" name="name" id="name" readonly="readonly">
					</div>

					<br>

					<div>
					<p>電子郵件:</p>
					<input type="text" name="email" id="email" >
					</div>
					
					<br>
					
			<div>

<!-- 					<p>地址:</p> -->
					<p>地址:</p>
					<input size=6  type="text" name="country" id="country">
					<input size=16  type="text" name="district" id="district">
					<input size=25  type="text" name="address" id="address">					

			</div>

					<br> 
				
				<label for="extratext"><span style="color: rgb(174, 174, 240);">(非必填)</span>攜帶寵物種類:</label>
				<select name="pettype" id="pettype">
  					<option value="無">無</option>
  					<option value="貓">貓</option>
  					<option value="狗">狗</option>
  					<option value="其他">其他</option>
				</select>
				
				<br><br>
					
				<div>
				<label for="extratext"><span style="color: rgb(174, 174, 240);">(非必填)</span>攜帶寵物數量:</label>				
					<input type="number" name="petnum" id="petnum" min="0" value="0">
				</div>
	
				<br>
				
				<label for="extratext"><span style="color: rgb(174, 174, 240);">(非必填)</span>備註:</label>
				<div>
					<textarea style="resize: none; width: 500px; height: 130px;"
							id="extra" name="extra" placeholder="可註明攜帶寵物的種類或各種事項"></textarea>
				</div>
								
				<br> <br> 
				<div class="row justify-content-center">
				<input type="hidden" id="JoinTime" name="JoinTime"  value="<%= (new java.util.Date()).toLocaleString()%>">
				<input type="hidden" name="now" id="now" value="<%= new Date(new java.util.Date().getTime())%>" /> 
				<input type="hidden" id="stt" name="stt" >
				<button class="btn btn-primary btn-lg" type="submit" id="BtnSend" name="todo" value="join" onClick="check()">送出</button>
				
				</form>
				</div>
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
				$("#stt").val(n.starttime);
				
				if (Date.parse(stt.value) < Date.parse(now.value)){
					alert("活動已經截止報名");window.history.back(-1);
				}
				
						
					});
				}
			});
			   
		});
		
	$().ready(function(){
		$.ajax({
			url:"../Gusty/headercheck",
			type:"post",
			dataType:"json",
			data : { 
				"user_id" : <%=session.getAttribute("user")%>,                     
        	},
			success:function(data){
				$.each(data,function(i,n){
					$("#name").val(n.name);
					$("#email").val(n.email);
					$("#country").val(n.country);
					$("#district").val(n.district);
					$("#address").val(n.address);
					
				});
			}
		});
	});

	
	
	
	function check(){//檢查填入資訊
		if(stt.value == "") 
	    {
	            alert("非正常活動參與");
	    }
	    
		else submit();
	}


</script>

</html>