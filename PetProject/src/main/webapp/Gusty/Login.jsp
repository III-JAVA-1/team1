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
<title>Accompany</title>
<style>

#speedlogin{/*hr塞字*/
  text-align:center;
  line-height:0px;
  background:blue;
  height:10px;
}

#speedlogin:after{
  content:"快速登入";
  font-weight:bold;
  font-size:30px;
  background:white;
  z-index:2;
}

</style>
</head>
<body>

	<div class="container">

		<div class="row justify-content-center">
			<h1 class="display-3">會員登入</h1>
		</div>
		<hr>
		<form method="post" action="">
		
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="LoginEmail" class="col-sm-3 col-form-label col-form-label-lg">電子郵件:</label>
					<div class="col-xs-4">
						<input type="email" class="form-control form-control-lg" id="LoginEmail" name="email" required>
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="LoginPassword" class="col-sm-3 col-form-label col-form-label-lg">密碼:</label>
					<div class="col-xs-4">
						<input type="password" class="form-control form-control-lg" id="LoginPassword" name="password" required>
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<img src="<c:url value='/captcha'/>" style="width:250px; height:100px;">
			</div>
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="safecode" class="col-sm-3 col-form-label col-form-label-lg">驗證碼:</label>
					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg" id="safecode" name="safecode" required>
					</div>
				</div>
			</div>
			
			<br>
			
			<div class="row justify-content-center">
				<Button  type="submit" class="btn btn-primary btn-lg active ml-3" role="button" aria-pressed="true">登錄</Button>
				<a href="Register.jsp" class="btn btn-success btn-lg active ml-3" role="button" aria-pressed="true">註冊</a>
			</div>
			
			<br>
			<hr id="speedlogin">
			<br>
			
			<div class="row justify-content-center">
			<button type="button" class="btn btn-primary btn-lg ml-3">Facebook</button>
			<button type="button" class="btn btn-primary btn-lg ml-3">Google</button>
			</div>
			
		</form>


	</div>

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
	<script>
		
	</script>

</body>
</html>