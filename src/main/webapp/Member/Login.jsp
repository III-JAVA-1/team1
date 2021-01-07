<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="343913388884-d9vp78dklqeej4slebrsgqhbk7jq0bbg.apps.googleusercontent.com">
<!--bootstrap初始規模-->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
	
	
    <script src="https://apis.google.com/js/platform.js" async defer></script>
	
<title>AccompanyMe</title>
</head>
<body>

	<jsp:include page="Header.jsp"/>
	
	<div class="container">

		<div class="row justify-content-center">
			<h1 class="display-3">會員登入</h1>
		</div>
		<hr>
		
		<form method="post" action="../Gusty/login" onsubmit="gogo()">
		
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
			
			<div class="row justify-content-center" onclick='changever()'>
				<img src="<c:url value='/Gusty/captcha'/>" id='ver' style="width:250px; height:100px;">
			</div>
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label for="safecode" class="col-sm-3 col-form-label col-form-label-lg">驗證碼:</label>
					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg" id="safecode" name="verCode" required autocomplete="off" placeholder="英文不分大小寫">
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="form-check h5">
  				<input class="form-check-input" type="checkbox" value="" id="remember">
  				<label class="form-check-label" for="remember">
    				記住我
  				</label>
				</div>
  			</div>
			
			<br>
			
			<div class="row justify-content-center">
			<div class="g-signin2 ml-3" data-onsuccess="onSignIn" onclick="clicked()" data-theme="dark"></div>
				<Button  type="submit" class="btn btn-primary btn-lg active ml-3" role="button" aria-pressed="true">登錄</Button>
				<a href="Register.jsp" class="btn btn-success btn-lg active ml-3" role="button" aria-pressed="true">註冊</a>
				<Button  type="button" onclick="forgetshow()" class="btn btn-danger btn-lg active ml-3" role="button" aria-pressed="true">忘記密碼</Button>
			</div>
			<br>
			<div class="row justify-content-center">
			<button type="button" class="btn btn-info m-3" onclick='admingogo()'>管理者</button>
			<button type="button" class="btn btn-info m-3" onclick='normalgogo()'>一般人</button>
			</div>
<!-- 			<div class="row justify-content-center"> -->
			
<!-- <!--     		<a href="#" onclick="signOut();">Sign out</a> --> -->
<!-- 			</div> -->
			
		</form>
		
		<div id="forget" style="display:none">
		<div class="row justify-content-center h4">
		忘記密碼
		</div>
		<form method="post" action="../Gusty/forget">
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="forgetemail" class="col-sm-3 col-form-label col-form-label-lg">電子郵件:</label>
				<div class="col-xs-4">
					<input type="email" class="form-control form-control-lg" id="forgetemail" name="forgetemail" required autocomplete="off" placeholder="請輸入註冊的電子郵件">
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
		<Button  type="submit" class="btn btn-warning btn-lg active ml-3" role="button" aria-pressed="true">送出新密碼</Button>
		</div>
		</form>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	<script>
	var clickcheck=false;
		function changever(){
			$.get("<c:url value='/Gusty/captcha'/>",function(){
				$("#ver").attr("src","<c:url value='/Gusty/captcha'/>");
			})
		}
		function clicked(){
			clickcheck=true;
			//onSignIn(this);
		}
		function onSignIn(googleUser) {
			console.log("aa");
			signOut("重複");
			if(clickcheck==true){
				console.log("cc");
				// 客戶端如果有需要的話可以通過profile來獲取使用者資訊
		        var profile = googleUser.getBasicProfile();
		        // 傳回後臺驗證，並獲取userid
		        var id_token = googleUser.getAuthResponse().id_token;
		        //console.log("ID Token: " + id_token);
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', "<c:url value='/Gusty/googleVerify'/>");
		        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		        xhr.onload = function() {
		          console.log('Signed in as: ' + xhr.responseText);
		          if(xhr.responseText=="重複"){
		        	  Swal.fire({
		  	      		  title: '電子郵件已註冊過帳號，請使用註冊帳號登入',
		  	      		  icon: 'error',
		  	      		  confirmButtonText: '確定'
		  	      		})
		        	  signOut("重複");
		          }else{
		        	  Swal.fire({
		  	      		  title: '登入成功',
		  	      		  icon: 'success',
		  	      		  showConfirmButton: false,
		  	      		  timer: 1500
		  	      		}).then((result) => {
		  	      			 window.location.href='Member.jsp';
		  	      		})
		          }
		        };
		        xhr.send('idtokenstr=' + id_token);
			}
	        
	      }
	      
	      function signOut() {
	    	    var auth2 = gapi.auth2.getAuthInstance();
	    	    auth2.signOut().then(function () {
	    	      console.log('User signed out.');
	    	    });
	    }
	    
	      if(getCookie('useremail')&& getCookie('password')){
	    	  $("#LoginEmail").val(getCookie('useremail'))
	    	  $("#LoginPassword").val(getCookie('password'))
	    	  document.getElementById("remember").checked=true;
		}
	      
	    document.getElementById("remember").addEventListener("change",function(){
	    	if(document.getElementById("remember").checked){
		    	//console.log("aaaaaa");
		    }else{
		    	delCookie('useremail');
		    	delCookie('password');
		    }
	    })
	    
		function gogo(){
	    	
	    	if(document.getElementById("remember").checked){ 
				setCookie('useremail',$("#LoginEmail").val(),7); //保存帐号到cookie，有效期7天
				setCookie('password',$("#LoginPassword").val(),7); //保存密码到cookie，有效期7天
      		}else{
      			delCookie('useremail');
				delCookie('password');
      		}
	    }
	     
	    function setCookie(name,value,day){
			var date = new Date();
			date.setDate(date.getDate() + day);
			document.cookie = name + '=' + value + ';expires='+ date;
		 };
		
    //获取cookie
		function getCookie(name){
			var reg = RegExp(name+'=([^;]+)');
			var arr = document.cookie.match(reg);
			if(arr){
			  return arr[1];
			}else{
			  return '';
			}
		 };
		
    //删除cookie
		function delCookie(name){
			setCookie(name,null,-1);
		 }
	     
    	let show=0;
    	function forgetshow(){
    		jQuery("html,body").animate({
    	            scrollTop:1000
    	        },100);
    		if(show==0){
    			$("#forget").css("display","");
    			show=1;
    		}else{
    			$("#forget").css("display","none");
    			show=0;
    		}
    	}
    	
    	function admingogo(){
    		$("#LoginEmail").val("eeit125team1@gmail.com")
    		$("#LoginPassword").val("abc123456")
    	}
    	
    	function normalgogo(){
    		$("#LoginEmail").val("ching89118@gmail.com")
    		$("#LoginPassword").val("abc123")
    	}
	</script>

</body>
</html>