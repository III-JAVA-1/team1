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
	
	<%
	String basePath = request.getScheme()+"://"+
		request.getServerName()+":"+request.getServerPort()+
		request.getContextPath()+"/";
		//這會顯示localhost+port號
	%>
	
<title>AccompanyMe</title>
<style>

	a{
    	text-decoration:none;
	}

	#title{
		background-color: aqua;
	}
	
	hr#aa{
  		text-align:center;
  		line-height:0px;
  		background:blue;
	}

	hr#aa:after{
  		content:"服務項目";
  		font-weight:bold;
  		font-size:30px;
  		background:white;
  		z-index:2;
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
	
	.register{
		width:500px;
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
 					<a href="Member.jsp" class="list-group-item list-group-item-action h4 " aria-current="true">
    					<img src="image/pawprintb.png">會員基本資料
  					</a>
  					<a href="Editmom.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="Momorder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="Petshop.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			<div class="row justify-content-center">
    			<div class="display-4">保母資料修改</div>
  			</div><br>
  			
  			<div class="row justify-content-center h4" id='showtip'>您還沒註冊為保母</div>
  			<div id='show'>
  			
  			<form action='../Gusty/editmom' method='POST' enctype="multipart/form-data">
  			
  			<div class="d-flex justify-content-center h4" >
				服務標題:&nbsp<input type='text' id='titlee' name='title' class='form-group register'>
			</div>
			
			<div class="d-flex justify-content-center h4" >
				服務年資:&nbsp<input type="number" id='experience' name='experience' class='form-group register'>
			</div>
			
			<div class="d-flex justify-content-center  h4" >
				注意事項:&nbsp<textarea class='form-group register' id='notices' name='notices' rows="5"></textarea>
			</div>
			
			<div class="d-flex justify-content-center  h4" >
				服務內容:&nbsp<textarea class='form-group register' id='petContent' name='petContent' rows="5"></textarea>
			</div>
			
			<div class="d-flex justify-content-center  h4" >
				環境照片:&nbsp<input type='file' id='pic' name='picc' class='form-group register'>
			</div>
			
			<div class="d-flex justify-content-center  h4" >
				<img src='image/photo.png' id='imgperview' style='width:400px;height:250px;'>
			</div>
			
			<br><hr id="aa"><br>
			
			<div class="d-flex justify-content-center  h4" >
				安親托育:&nbsp<input type='text' id='proPrice1' name='proPrice1' class='form-group register'>
			</div>
			
			<div class="d-flex justify-content-center  h4" >
				寄宿照顧:&nbsp<input type='text' id='proPrice2' name='proPrice2' class='form-group register'>
			</div>
			
			<div class="d-flex justify-content-center  h4" >
				到府遛狗:&nbsp<input type='text' id='proPrice3' name='proPrice3' class='form-group register'>
			</div><br>
			
			<div class="d-flex justify-content-center  h4" >服務寵物:&nbsp&nbsp&nbsp&nbsp&nbsp
				<div class="form-check register">
  					<input class="form-check-input" type="checkbox" value="迷你犬(0~4kg)" id="bodyType1" name='bodyType1'>
  					<label class="form-check-label" for="bodyType1">
   						小型犬(0~10kg)
  					</label>
				</div>
			</div>
			
			<div class="d-flex justify-content-center h4" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp                               
				<div class="form-check register">
  					<input class="form-check-input" type="checkbox" value="中型犬(10~24kg)" id="bodyType2" name='bodyType2'>
  					<label class="form-check-label" for="bodyType2">
   						中型犬(10~24kg)
  					</label>
				</div>
			</div>
			
			<div class="d-flex justify-content-center h4" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp                               
				<div class="form-check register">
  					<input class="form-check-input" type="checkbox" value="大型犬(24kg以上)" id="bodyType3" name='bodyType3'>
  					<label class="form-check-label" for="bodyType3">
   						大型犬(24kg以上)
  					</label>
				</div>
			</div>
			
			<div class="d-flex justify-content-center h4" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp                               
				<div class="form-check register">
  					<input class="form-check-input" type="checkbox" value="貓" id="bodyType4" name='bodyType4'>
  					<label class="form-check-label" for="bodyType4">
   						貓
  					</label>
				</div>
			</div>
			
			<input type='hidden' id="mom_Id" name="mom_Id">
			
			<br><div class="d-flex justify-content-center h4" >
			<button type="submit" class="btn btn-primary">確認修改</button>
			</div>
			
			</form>
			
  			</div></div>
	
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

	<script>
	
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
    
    $("#pic").change(function(){
        //當檔案改變後，做一些事 
       readURL(this);   // this代表<input id="imgInp">
     });
    
    function readURL(input){
    	  if(input.files && input.files[0]){
    	    var reader = new FileReader();
    	    reader.onload = function (e) {
    	       $("#imgperview").attr('src', e.target.result);
    	   }
    	   reader.readAsDataURL(input.files[0]);
    	 }
    }
    
    $.ajax({
		url:"../Gusty/membermom",
		type:"post",
		dataType:"json",
		data : { 
			"user_id" : <%=session.getAttribute("user")%>,
        },
		success:function(data){
			document.getElementById("show").style.display="";
			document.getElementById("showtip").style.display="none";
			$.each(data,function(i,n){
				$("#mom_Id").val(n[0])
				$("#titlee").val(n[11])
				$("#experience").val(n[5])
				$("#notices").val(n[6])
				$("#petContent").val(n[7])
				$("#imgperview").attr("src","<c:url value='/mom/getPic?mom_Id="+n[0]+"'/>")
				$("#proPrice1").val(n[8])
				$("#proPrice2").val(n[9])
				$("#proPrice3").val(n[10])
				$("input:checkbox[value='"+n[1]+"']").attr("checked",true);
				$("input:checkbox[value='"+n[2]+"']").attr("checked",true);
				$("input:checkbox[value='"+n[3]+"']").attr("checked",true);
				$("input:checkbox[value='"+n[4]+"']").attr("checked",true);
			});
		},error:function(){
			document.getElementById("show").style.display="none";
			document.getElementById("showtip").style.display="";
		}
	});
    
	</script>

</body>
</html>