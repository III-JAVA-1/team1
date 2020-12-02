<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Accompany</title>
<style>
</style>
<div class="twzipcode"></div><!--弄地址的-->
</head>
<body>

	<div class="container">

		<div class="row justify-content-center">
			<h1 class="display-3">註冊會員</h1>
		</div>
		
		<div class="row justify-content-center">
			<span class="h4">*為必填項目</span>
		</div>
		<hr>

		<div class="col-12">
		<form method="post" action="InsertMember" enctype="multipart/form-data">
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="name" class="col-sm-3 col-form-label col-form-label-lg">*中文姓名:</label>
				<div class="col-xs-4">
					<input type="text" class="form-control form-control-lg" id="name" name="name" required minlength="2">
				</div>
				<label for="name" id="namecheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>	
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="" class="col-sm-3 col-form-label col-form-label-lg">*性別:</label>
				<div class="col-xs-4">
					<div class="form-check form-check-inline form-control-lg" >
  						<input class="form-check-input" type="radio" name="gender" id="boy" value="男" required>
  						<label class="form-check-label" for="boy">男</label>
					</div>
					<div class="form-check form-check-inline form-control-lg">
  						<input class="form-check-input" type="radio" name="gender" id="girl" value="女" required>
  						<label class="form-check-label" for="girl">女</label>
					</div>			
				</div>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="password" class="col-sm-3 col-form-label col-form-label-lg">*密碼:</label>
				<div class="col-xs-4">
					<input type="password" class="form-control form-control-lg" id="password" name="password" required minlength="6" maxlength="12" placeholder="6~12英數混和">
				</div>
				<label for="password" id="passwordeye" class="row-sm-3 col-form-label col-form-label-lg">
				&nbsp<img src="image/eye.png" id="eye">
				</label>
				<label for="password" id="passwordcheck" class="col-sm-3 col-form-label col-form-label-lg">
				</label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="ID" class="col-sm-3 col-form-label col-form-label-lg">*身分證:</label>
				<div class="col-xs-4">
					<input type="text" class="form-control form-control-lg" id="ID" name="iD" required maxlength="10" pattern="[a-zA-Z]{1}[1-2]{1}\d{8}">
				</div>
				<label for="ID" id="IDcheck" class="col-sm-3 col-form-label col-form-label-lg">
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="phone" class="col-sm-3 col-form-label col-form-label-lg">*手機:</label>
				<div class="col-xs-4">
					<input type="tel" class="form-control form-control-lg" id="phone" name="phone" required minlength="10">
				</div>
				<label for="phone" id="phonecheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="email" class="col-sm-3 col-form-label col-form-label-lg">*電子郵件:</label>
				<div class="col-xs-4">
					<input type="email" class="form-control form-control-lg" id="email" name="email" required>
				</div>
				<label for="email" id="emailcheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>	
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="birth" class="col-sm-3 col-form-label col-form-label-lg">*生日:</label>
				<div class="col-xs-4">
					<input type="date" class="form-control form-control-lg" id="birth" name="birth" required>
				</div>
				<label for="birth" id="birthcheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>	
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="sname" class="col-sm-3 col-form-label col-form-label-lg">*暱稱:</label>
				<div class="col-xs-4">
					<input type="text" class="form-control form-control-lg" id="sname" name="sname" required>
				</div>
				<label for="sname" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="address" class="col-sm-3 col-form-label col-form-label-lg">*地址:</label>
					<div id="twzipcode" class="form-row">
                    <div class="form-group col-4">
                        <div data-role="zipcode" data-style="form-control" data-name="zipcode"></div>
                    </div>
                    <div class="form-group col-4">
                        <div data-role="county" data-style="form-control" data-name="county"></div>
                    </div>
                    <div class="form-group col-4"> 
                        <div data-role="district" data-style="form-control" data-name="district"></div>
                    </div>
                    <input type="text" class="form-control form-control-lg" id="address" name="address" placeholder="請輸入地址" required>
					</div>
					<label for="address" id="addresscheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
    			<label for="img" class="col-sm-3 col-form-label col-form-label-lg">會員照片:</label>
    			<div class="col-xs-4">
    			<input type="file" class="form-control form-control-lg" id="img" name="img">
  				</div>
  			</div>
		</div>
		
		<div class="row justify-content-center">
		<button type="submit" class="btn btn-primary btn-lg ml-3">確認註冊</button>
		<button type="button" class="btn btn-secondary btn-lg ml-3" onclick="window.location.href='Login.jsp'">返回登錄</button>
		</div>
		
		</form>
		</div>
	</div>
	<br>

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
		
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<!--     弄地址的 -->
    
	<script>
	$('#twzipcode').twzipcode({
    	'countySel'   : '桃園市',
    	'districtSel' : '中壢區'
	});
	
	let phone = /^[09]{2}[0-9]{8}$/;//手機判斷
	document.getElementById("phone").addEventListener("blur",function(){
		
		if (!phone.test(document.getElementById("phone").value)){
			document.getElementById("phonecheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
		}
		else{
			document.getElementById("phonecheck").innerHTML="<img src='image/checked.png'>OK";
		}
    });

    let name= /[^\u4e00-\u9fa5]/;//名字判斷
    document.getElementById("name").addEventListener("blur",function(){

    	if (!name.test(document.getElementById("name").value)&&document.getElementById("name").value.length>=2){
    		document.getElementById("namecheck").innerHTML="<img src='image/checked.png'>OK";
		}
		else{
			document.getElementById("namecheck").innerHTML="<img src='image/cancel.png'>格式錯誤";	
		}   
    });

	let password=/^[a-zA-Z]+\d+/;//密碼判斷
	document.getElementById("password").addEventListener("blur",function(){

    	if (!password.test(document.getElementById("password").value)){
    		document.getElementById("passwordcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
		}
		else{
			document.getElementById("passwordcheck").innerHTML="<img src='image/checked.png'>OK";
		} 
    });

	let n=0;//密碼可視判斷
	document.getElementById("passwordeye").addEventListener("click",function(){
		if(n==0){
			document.getElementById("password").type="text";n=n+1;
			document.getElementById("eye").src="image/invisible.png";
		}
		else{
			document.getElementById("password").type="password";n=0;
			document.getElementById("eye").src="image/eye.png";
		}

	});
    
	let email=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;//電郵判斷
	document.getElementById("email").addEventListener("blur",function(){

    	if (!email.test(document.getElementById("email").value)){
    		document.getElementById("emailcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
		}
		else{
			document.getElementById("emailcheck").innerHTML="<img src='image/checked.png'>OK";
		}
    });
    
	let ID=/^[A-Z]{1}[1-2]{1}[0-9]{8}$/;//身分證判斷
	document.getElementById("ID").addEventListener("blur",function(){

    	if (!ID.test(document.getElementById("ID").value)){
    		document.getElementById("IDcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
		}
		else{
			document.getElementById("IDcheck").innerHTML="<img src='image/checked.png'>OK";
		}
    });

	let today=new Date();//日期判斷
	document.getElementById("birth").addEventListener("blur",function(){
		//console.log(Date.parse(document.getElementById("birth").value).valueOf());
		if(Date.parse(document.getElementById("birth").value).valueOf()>today){
			//console.log("555555");
			document.getElementById("birthcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
		}
		else{
			document.getElementById("birthcheck").innerHTML="<img src='image/checked.png'>OK";
		}
		//alert(document.getElementById("birth").value);
	});

	let address=/^[\u4e00-\u9fff]+\d+/;//地址判斷
	document.getElementById("address").addEventListener("blur",function(){

    	if (!address.test(document.getElementById("address").value)){
    		document.getElementById("addresscheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
		}
		else{
			document.getElementById("addresscheck").innerHTML="<img src='image/checked.png'>OK";
		}
    });
	
	</script>

</body>
</html>