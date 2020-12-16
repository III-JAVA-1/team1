<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap初始規模-->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/theme.min.css" integrity="sha512-NIaqX+eDfmA0bIDqx/oRznvm4IYs9qfSjxdLVyDeJTP5n2YQFBGfalKsjwzduqCWeEeMMwSJfI1EoIFfLhRMhg==" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.min.css" integrity="sha512-NaCOGQe8bs7/BxJpnhZ4t4f4psMHnqsCxH/o4d3GFqBS4/0Yr/8+vZ08q675lx7pNz7lvJ6fRPfoCNHKx6d/fA==" crossorigin="anonymous" />
<title>Accompany</title>
</head>
<body>

	<jsp:include page="Header.jsp"/>
	
	<div class="container">

		<div class="row justify-content-center">
			<h1 class="display-3">會員登入</h1>
		</div>
		<hr>
		
		<form method="post" action="../Gusty/login">
		
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="LoginEmail" class="col-sm-3 col-form-label col-form-label-lg">電子郵件:</label>
					<div class="col-xs-4">
						<input type="email" class="form-control form-control-lg" id="LoginEmail" name="useremail" required autocomplete="off">
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="LoginPassword" class="col-sm-3 col-form-label col-form-label-lg">密碼:</label>
					<div class="col-xs-4">
						<input type="password" class="form-control form-control-lg" id="LoginPassword" name="password" required autocomplete="off">
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<img src="<c:url value='/Gusty/captcha'/>" style="width:250px; height:100px;">
			</div>
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="safecode" class="col-sm-3 col-form-label col-form-label-lg">驗證碼:</label>
					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg" id="safecode" name="verCode" required autocomplete="off" placeholder="英文不分大小寫">
					</div>
				</div>
			</div>
			
			<br>
			
			<div class="row justify-content-center">
				<Button  type="submit" class="btn btn-primary btn-lg active ml-3" role="button" aria-pressed="true">登錄</Button>
				<a href="Register.jsp" class="btn btn-success btn-lg active ml-3" role="button" aria-pressed="true">註冊</a>
				<Button  type="button" class="btn btn-info btn-lg active ml-3" role="button" aria-pressed="true" onclick="admingo()">管理者後台</Button>
			</div>
			
		</form>
		
		<div id="dialog" title="請輸入管理者密碼" style="display:none;">
		<p>請輸入密碼</p>
    		<input type="password" size="25" id="adminpassword" name="adminpassword"/>
    	<hr>
    		<button type="button" onclick="adminpasswordcheck()">確認</button>
		</div>

	</div><br>
	
<%-- 	<jsp:include page="Footer.jsp"/> --%>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/Gusty1/live2d-widget@latest/autoload.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>


	<script>
		function admingo(){
			$("#dialog").dialog();
		}
		function adminpasswordcheck(){
			if($("#adminpassword").val()=="admin"){
				window.location.href='<c:url value='/Gusty/goadmin'/>';
			}
			else if($("#adminpassword").val()==""||$("#adminpassword").val()!="admin"){
				$("#dialog").dialog("close");
				$("#adminpassword").val("");
				alert("密碼錯誤");
			}
			
			//$("#dialog").dialog("close");
			//adminpassword
		}
		
	</script>

</body>
</html>