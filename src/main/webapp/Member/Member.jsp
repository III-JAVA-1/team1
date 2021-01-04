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
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/theme.min.css" integrity="sha512-NIaqX+eDfmA0bIDqx/oRznvm4IYs9qfSjxdLVyDeJTP5n2YQFBGfalKsjwzduqCWeEeMMwSJfI1EoIFfLhRMhg==" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.min.css" integrity="sha512-NaCOGQe8bs7/BxJpnhZ4t4f4psMHnqsCxH/o4d3GFqBS4/0Yr/8+vZ08q675lx7pNz7lvJ6fRPfoCNHKx6d/fA==" crossorigin="anonymous" />	
	
	<%
	String basePath = request.getScheme()+"://"+
		request.getServerName()+":"+request.getServerPort()+
		request.getContextPath()+"/";
		//這會顯示localhost+port號
	%>
	
<title>AccompanyMe</title>
<style>

	#title{
		background-color: aqua;
	}
	
	#gotop {
		width:65px;
		height:65px;
    	position: fixed;
    	border-radius: 50px;
    	right: 20px;
    	bottom: 30px;
    	padding: 10px 16px;
    	background-repeat: no-repeat;
    	background-size: cover;
    	background-image: url("image/up.png");
    	color: white;
    	cursor: pointer;
    	z-index: 1000;
	}
	
	
</style>
</head>
<body>

	<jsp:include page="Header.jsp"/>
	<br>
	
	<div class="container">
	
		<div class="row justify-content-center" id="title">
    		<div class="display-1"><img src="image/title.png" style="width:150px; height:150px;">會員專區</div>
  		</div><hr>
  		
  		<div class="row">
  		
  			<div class="col-3">
  				<div class="list-group">
 					<a href="Member.jsp" class="list-group-item list-group-item-action active h4 " aria-current="true">
    					<img src="image/pawprintb.png">會員基本資料
  					</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			
  			</div>
  		
  			<div class="col-9">
  			
  				<div class="row justify-content-center">
    				<div class="display-4">會員基本資料</div>
  				</div><br>
  				
  				<div class="row justify-content-center">
    				<img src="" id="photo" alt="sorry photo not found" style="width:180px; height:180px;">
  				</div><br>
  				
  				<div class="row justify-content-center">
  				<p class="h5">請選擇照片:&nbsp&nbsp</p>
  				<form action="../Gusty/upload" method="post" enctype="multipart/form-data">
    				<input type="file" name="image">
    				<input type="submit" value="確定上傳">
    			</form>
  				</div><br>
  				
  				<div class="row">
  					<div class="col-3">
  						<p class="h3">姓名:</p>
  						<p class="h3">性別:</p>	
  						<p class="h3">手機:</p>
  						<p class="h3">生日:</p>
  						<p class="h3">電子郵件:</p>		
  						<p class="h3">暱稱:</p>
  						<p class="h3">地址:</p>
  					</div>
  					
  					<div class="col-9">
  						<p class="h3" id="name">未輸入</p>
  						<p class="h3" id="gender">未輸入</p>
  						<p class="h3" id="phone">未輸入</p>
  						<p class="h3" id="birth">未輸入</p>
  						<p class="h3" id="email">未輸入</p>
  						<p class="h3" id="sname2">未輸入</p>
  						<p class="h3" id="address">未輸入</p>
  					</div>
  				</div>
  				<br>
				<div class="row justify-content-center">	
					<button type="button" class="btn btn-info" onclick="editperson()">修改個人資料</button>
					&nbsp&nbsp
					<button type="button" class="btn btn-primary" onclick="editpassword()" id='googlepassword'>修改密碼</button>	
					<% if(session.getAttribute("user")!=null&&Integer.valueOf(session.getAttribute("user").toString())==1){
							out.print("<Button  type='button' class='btn btn-info btn-lg active ml-3' role='button' aria-pressed='true' onclick='admingo()'>管理者後台</Button>");
						}
					%>
  				</div>
  			</div>
  			<div class="col-12" id="editpersoninfo" style="display:none;">
  			<br>
  			<div class="row justify-content-center">
			<span class="h3">修改個人資料</span>
			</div>
			
			<div id="dialog" title="請輸入管理者密碼" style="display:none;">
				<p>請輸入密碼</p>
    		<input type="password" size="25" id="adminpassword" name="adminpassword"/>
    			<hr>
    		<button type="button" onclick="adminpasswordcheck()">確認</button>
				</div>
			<br>
			<form action="../Gusty/UpdateMember" method="post">
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="editname" class="col-sm-3 col-form-label col-form-label-lg">中文姓名:</label>
				<div class="col-xs-4">
					<input type="text" class="form-control form-control-lg" id="editname" name="name" required minlength="2" autocomplete="off">
				</div>
				<label for="editname" id="editnamecheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>	
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="" class="col-sm-3 col-form-label col-form-label-lg">性別:</label>
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
				<label for="editbirth" class="col-sm-3 col-form-label col-form-label-lg">生日:</label>
				<div class="col-xs-4">
					<input type="date" class="form-control form-control-lg" id="editbirth" name="birth" required>
				</div>
				<label for="editbirth" id="birthcheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="editphone" class="col-sm-3 col-form-label col-form-label-lg">手機:</label>
				<div class="col-xs-4">
					<input type="tel" class="form-control form-control-lg" id="editphone" name="phone" required minlength="10" maxlength="10" autocomplete="off">
				</div>
				<label for="editphone" id="editphonecheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="editemail" class="col-sm-3 col-form-label col-form-label-lg">電子郵件:</label>
				<div class="col-xs-4">
					<input type="email" class="form-control form-control-lg" id="editemail" name="email" required autocomplete="off">
				</div>
				<label for="editemail" id="editemailcheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>	
		
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="editsname" class="col-sm-3 col-form-label col-form-label-lg">暱稱:</label>
				<div class="col-xs-4">
					<input type="text" class="form-control form-control-lg" id="editsname" name="sname" required autocomplete="off">
				</div>
				<label for="editsname" id="editsnamecheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="form-group row w-50">
				<label for="editaddress" class="col-sm-3 col-form-label col-form-label-lg">地址:</label>
					<div id="twzipcode" class="form-row">
                    <div class="form-group col-4">
                        <div data-role="zipcode" data-style="form-control" data-name="zip"></div>
                    </div>
                    <div class="form-group col-4">
                        <div data-role="county" data-style="form-control" data-name="country"></div>
                    </div>
                    <div class="form-group col-4"> 
                        <div data-role="district" data-style="form-control" data-name="district"></div>
                    </div>
                    <input type="text" class="form-control form-control-lg" id="editaddress" name="address" placeholder="請輸入地址" required autocomplete="off">
					</div>
					<label for="editaddress" id="editaddresscheck" class="col-sm-3 col-form-label col-form-label-lg"></label>
			</div>
		</div>
		<div class="row justify-content-center">
		<p class="h5" id="doublecheck"></p>
		</div>
		<div class="row justify-content-center">
		<button type="submit" class="btn btn-warning" id="editbutton" disabled>確認修改</button>
		</div>
		</form>	
		
  			</div>
  			<div class="col-12" id="editpasswordinfo" style="display:none;" ><br>
  			<div class="row justify-content-center">
  			<p class="h4">修改密碼</p>
  			</div>
  			<form action="../Gusty/updatepassword" method="post" onsubmit="return oldpasswordcheck()">
  				<div class="row justify-content-center">
				<div class="form-group row w-50">
				<label for="oldeditpassword" class="col-sm-3 col-form-label col-form-label-lg">輸入舊密碼:</label>
				<div class="col-xs-4">
					<input type="password" class="form-control form-control-lg" id="oldeditpassword" name="oldpassword" required minlength="6" maxlength="12" placeholder="6~12英數混和">
				</div>
				<label for="oldeditpassword" id="oldeditpasswordeye" class="row-sm-3 col-form-label col-form-label-lg">
				&nbsp<img src="image/eye.png" id="oldeye">
				</label>
				<label for="oldeditpassword" id="oldeditpasswordcheck" class="col-sm-3 col-form-label col-form-label-lg">
				</label>
				</div>
				</div>
				<div class="row justify-content-center">
				<div class="form-group row w-50">
				<label for="editpassword" class="col-sm-3 col-form-label col-form-label-lg">輸入新密碼:</label>
				<div class="col-xs-4">
					<input type="password" class="form-control form-control-lg" id="editpassword" name="password" required minlength="6" maxlength="12" placeholder="6~12英數混和">
				</div>
				<label for="editpassword" id="editpasswordeye" class="row-sm-3 col-form-label col-form-label-lg">
				&nbsp<img src="image/eye.png" id="eye">
				</label>
				<label for="editpassword" id="editpasswordcheck" class="col-sm-3 col-form-label col-form-label-lg">
				</label>
				</div>
				</div>
				<div class="row justify-content-center">
				<button type="submit" class="btn btn-warning" id="editpasswordgogo" disabled>確認修改</button>
				</div>
				</form>
  			</div>
  		</div>
	</div>
	
	<div id="gotop">
	</div>
	
	<br>
	
	<jsp:include page="Footer.jsp"/>

	

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
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
	
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<!--     弄地址的 -->
	
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
	}
	
    function oldpasswordcheck(){
    	var xxn=false;
    	$.ajax({
			url:"../Gusty/headercheck",
			type:"post",
			async : false,//要賦值給全域變數要改false
			dataType:"json",
			data : { 
				"user_id" : <%=session.getAttribute("user")%>,                 
            },
			success:function(data){
				$.each(data,function(i,n){
					
					if($("#oldeditpassword").val()==n.password){
						if($("#editpassword").val()==n.password){
							alert("請輸入新密碼");
							xxn=false;
						}
						else{
							xxn=true;
						}
					}
					else{
						alert("舊密碼錯誤");
						xxn=false;
					}			
				});
			}
		});
    	console.log(xxn);
    	return xxn;
    }
    var a;
    var b;
    var c;
    var d;
    var e;
    $().ready(function(){//AJAX秀會員資料
		$.ajax({
			url:"../Gusty/headercheck",
			type:"post",
			dataType:"json",
			data : { 
				"user_id" : <%=session.getAttribute("user")%>,                     
            },
			success:function(data){
				$.each(data,function(i,n){
					
					if(n.img==null){
						$("#photo").attr("src","image/user.png");
					}
					else{
						$("#photo").attr("src","<c:url value='/Gusty/getimg'/>");
					}
					if(n.password.includes("http")&&n.img==null){
						$("#photo").attr("src",n.password);
					}
					if(n.password.includes("http")){
						$("#googlepassword").css("display","none");
					}
					$("#name").html(n.name);
					$("#editname").val(n.name);
					a=n.name;
					$("#gender").html(n.gender);
					$('[name="gender"][value='+n.gender+']').attr('checked', 'checked');
					
					$("#phone").html(n.phone);
					$("#editphone").val(n.phone);
					b=n.phone;
					
					$("#birth").html(n.birth.substring(0,10));
					$("#editbirth").val(n.birth.substring(0,10));
					
					$("#email").html(n.email);
					$("#editemail").val(n.email);
					c=n.email;
					$("#sname2").html(n.sname);
					$("#editsname").val(n.sname);
					d=n.sname;
					
					$("#address").html(n.zip+n.country+n.district+n.address);
					$("#editaddress").val(n.address);
					$('#twzipcode').twzipcode({
				    	'countySel'   : n.country,
				    	'districtSel' : n.district
					});
					e=n.address;
				});
			}
		});
	});
    
    var dead=2;
    let today=new Date();//生日判斷
	document.getElementById("editbirth").addEventListener("mouseout",function(){
		if(Date.parse(document.getElementById("editbirth").value).valueOf()>today){
			//console.log("555555");
			document.getElementById("birthcheck").innerHTML="<img src='image/cancel.png'>未來使者";
			dead=0;
		}
		else{
			document.getElementById("birthcheck").innerHTML="<img src='image/checked.png'>OK";
			dead=1;
		}
		
	});
    
    $("#gotop").click(function(){//回最上層JQUERY
        jQuery("html,body").animate({
            scrollTop:0
        },1000);
    });
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 300){
            $('#gotop').fadeIn("fast");
        } else {
            $('#gotop').stop().fadeOut("fast");
        }
    });
    
    let editpersondisplay=0;
    function editperson(){
    	//console.log("sdsdsd");
    	if(editpersondisplay==0){
    		$("#editpersoninfo").css("display","");editpersondisplay=1;
    		$("html,body").animate({
                scrollTop:1100
            },1000);
    	}else{
    		$("#editpersoninfo").css("display","none");editpersondisplay=0;
    	}
    	
    }
    
    let editpassworddisplay=0;
    function editpassword(){
    	//console.log("sdsdsd");
    	if(editpassworddisplay==0){
    		$("#editpasswordinfo").css("display","");editpassworddisplay=1;
    		$("html,body").animate({
                scrollTop:600
            },1000);
    	}else{
    		$("#editpasswordinfo").css("display","none");editpassworddisplay=0;
    	}
    	
    }
    
	var check=[];
	
	let phone = /^[09]{2}[0-9]{8}$/;//手機判斷
	document.getElementById("editphone").addEventListener("mouseout",function(){
		
		if (!phone.test(document.getElementById("editphone").value)){
			document.getElementById("editphonecheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
			check[0]=0;
		}
		else{
			document.getElementById("editphonecheck").innerHTML="<img src='image/checked.png'>OK";
			check[0]=1;
		}
    });
	
	var sumpassword=[];
	
	let password=/[a-zA-z]+\d|\d+[a-zA-z]+/;//密碼判斷
	document.getElementById("editpassword").addEventListener("mouseout",function(){

    	if (!password.test(document.getElementById("editpassword").value)){
    		document.getElementById("editpasswordcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";	
    		sumpassword[0]=0;
    	}
		else{
			document.getElementById("editpasswordcheck").innerHTML="<img src='image/checked.png'>OK";
			sumpassword[0]=1;
		} 
    });
	
	let eye=0;//密碼可視判斷
	document.getElementById("editpasswordeye").addEventListener("click",function(){
		if(eye==0){
			document.getElementById("editpassword").type="text";eye=1;
			document.getElementById("eye").src="image/invisible.png";
		}
		else{
			document.getElementById("editpassword").type="password";eye=0;
			document.getElementById("eye").src="image/eye.png";
		}

	});
	
	let oldpassword=/[a-zA-z]+\d|\d+[a-zA-z]+/;//舊密碼判斷
	document.getElementById("oldeditpassword").addEventListener("mouseout",function(){

    	if (!password.test(document.getElementById("oldeditpassword").value)){
    		document.getElementById("oldeditpasswordcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";	
    		sumpassword[1]=0;
    	}
		else{
			document.getElementById("oldeditpasswordcheck").innerHTML="<img src='image/checked.png'>OK";
			sumpassword[1]=1;
		} 
    });
	
	let oldeye=0;//舊密碼可視判斷
	document.getElementById("oldeditpasswordeye").addEventListener("click",function(){
		if(eye==0){
			document.getElementById("oldeditpassword").type="text";eye=1;
			document.getElementById("oldeye").src="image/invisible.png";
		}
		else{
			document.getElementById("oldeditpassword").type="password";eye=0;
			document.getElementById("oldeye").src="image/eye.png";
		}

	});
	
	var checkpasswordgo = window.setInterval(sumpasswordcheck,100);//最後總和密碼驗整結果判斷
	function sumpasswordcheck(){
		//console.log(check.length);
		let passwordcheckn=0;
		for(let i=0;i<sumpassword.length;i=i+1)
		{
			if(sumpassword[i]==1){
				passwordcheckn=passwordcheckn+1;
				//console.log(check[i]);
			}
		}
		//console.log(x);
		if(passwordcheckn>=2){$("#editpasswordgogo").attr('disabled', false);}
		else{$("#editpasswordgogo").attr('disabled', true);}
	}
	
    let name= /[^\u4e00-\u9fa5]/;//名字判斷
    document.getElementById("editname").addEventListener("mouseout",function(){

    	if (!name.test(document.getElementById("editname").value)&&document.getElementById("editname").value.length>=2){
    		document.getElementById("editnamecheck").innerHTML="<img src='image/checked.png'>OK";
    		check[1]=1;
		}
		else{
			document.getElementById("editnamecheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
			check[1]=0;
		}   
    });
    
	let email=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;//電郵判斷
	document.getElementById("editemail").addEventListener("mouseout",function(){
	
    	if (!email.test(document.getElementById("editemail").value)){
    		document.getElementById("editemailcheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
    		check[2]=0;
		}
    	else if(email.test(document.getElementById("editemail").value)){
    		
    		var zzn=0;
    		$.ajax({
				url:"../Gusty/logincheck",
				type:"post",
				dataType:"json",
				//async: false,
				success:function(data){
					
					$.each(data,function(i,n){
						//console.log(n.email)
<%-- 						if(n.u_Id==<%=session.getAttribute("user")%>){ --%>
// 							return;
// 						}
						if($("#editemail").val()==n.email){
							if(n.u_Id==<%=session.getAttribute("user")%>){
								$("#editemailcheck").html("<img src='image/checked.png'>OK");
								return false;
							}
							
							$("#editemailcheck").html("<img src='image/cancel.png'>已被註冊");
							check[2]=0;
							return false;	
						}
						else if(i==data.length-1){				
						console.log("wwwww");
							//$("#editemailcheck").html("<img src='image/checked.png'>OK");
							$.ajax({
								url: 'https://api.email-validator.net/api/verify',
						        type: 'post',
						        cache: false,
						        async : false,
						        crossDomain: true,
						        data: { EmailAddress: $("#editemail").val(), APIKey: 'ev-db4a73f10a219142ae728cca00efcb10' },
						        success: function (json) {
						        		console.log("aqqqqq");
						        		if(json.info=="OK - Valid Address"){
						        			$("#editemailcheck").html("<img src='image/checked.png'>OK");
						        			check[2]=1;
			 									
						        		}
						        		else{
						        			$("#editemailcheck").html("<img src='image/cancel.png'>無效電子郵件");
						        			check[2]=0;
						        		}
						        },error:function(){
						        	console.log("asdas");
						        }
						    });
						}				
					});	
					if(data==""&&$("#editemail").val()!=""){
						console.log("asdasd");
						$("#editemailcheck").html("<img src='image/checked.png'>OK");
						check[2]=1;
					}
					
				}
			});
    	}
    });

	let address=/^[\u4e00-\u9fff]+\d+/;//地址判斷
	document.getElementById("editaddress").addEventListener("mouseout",function(){

    	if (!address.test(document.getElementById("editaddress").value)){
    		document.getElementById("editaddresscheck").innerHTML="<img src='image/cancel.png'>格式錯誤";
    		check[3]=0;
		}
		else{
			document.getElementById("editaddresscheck").innerHTML="<img src='image/checked.png'>OK";
			check[3]=1;
		}
    });
	
	document.getElementById("editsname").addEventListener("mouseout",function(){//AJAX暱稱判斷
		if($("#editsname").val()==""){
			$("#editsnamecheck").html("<img src='image/cancel.png'>格式錯誤");	
		}
		$.ajax({
			url:"../Gusty/logincheck",
			type:"post",
			dataType:"json",
			//$(":contains(text)")
			success:function(data){
				$.each(data,function(i,n){
					if(n.u_Id==<%=session.getAttribute("user")%>){return;}
					if($("#editsname").val()==n.sname){
						$("#editsnamecheck").html("<img src='image/cancel.png'>已被使用");						
						check[4]=0;
						return false;
					}
					else{
						$("#editsnamecheck").html("<img src='image/checked.png'>OK");
						check[4]=1;
						return;
					}
				});
				if(data==""&&$("#editsname").val()!=""){
					$("#editsnamecheck").html("<img src='image/checked.png'>OK");
					check[4]=1;
				}
				if($("#editsname").val()==""){
					$("#editsnamecheck").html("<img src='image/cancel.png'>格式錯誤");
					check[4]=0;
				}
			}
		});
    });
	
	var sumcheckgo = window.setInterval(sumcheck,100);//最後總和驗整結果判斷

	function sumcheck(){
		//console.log(a);
		//console.log(check.length);
		let checkn=0;
		for(let i=0;i<check.length;i=i+1)
		{
			if(check[i]==1){
				checkn=checkn+1;
				//console.log(check[i]);
			}
		}
		//console.log(dead);
		if(checkn>=5){$("#editbutton").attr('disabled', false);}
		else{$("#editbutton").attr('disabled', true);}
		if($("#editname").val()==a&&$("#editphone").val()==b&&$("#editemail").val()==c&&$("#editsname").val()==d&&$("#editaddress").val()==e&&dead==2){
			$("#doublecheck").html("請至少修改一筆資料才能送出");
			$("#editbutton").attr('disabled', true);
		}else{
			$("#doublecheck").html("");
			$("#editbutton").attr('disabled', false);
		}
		if(dead==0){$("#editbutton").attr('disabled', true);}	
	}
	</script>

</body>
</html>