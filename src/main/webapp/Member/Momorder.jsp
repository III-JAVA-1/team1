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
 					<a href="Member.jsp" class="list-group-item list-group-item-action h4 " aria-current="true">
    					<img src="image/pawprintb.png">會員基本資料
  					</a>
  					<a href="Editmom.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="Momorder.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="Petshop.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">保母訂單紀錄</div>
  			</div><br>
  			
  			<div class="row justify-content-center h4">
    			<ul class="nav nav-pills nav-fill">
  					<li class="nav-item">
    					<a class="nav-link active" aria-current="page" id="mymom" href="#" onclick="return momchange('我的保母訂單')">我的保母訂單</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="#" id="othermom" onclick="return momchange('我預約的保母訂單')">我預約的保母訂單</a>
  					</li>
				</ul>
  			</div><br>
  			
  			<div class="row justify-content-start h5" id='myreserv' style='display:none'>
    			依名字搜尋保母:<input type="text" id="search" name="search">
  			</div>
  			
  			<div class="row justify-content-start h5" id='maintable'>
			
  			</div>
  			
  			<div class="row justify-content-center" >
			<div class="h4" id="tip"></div>
			</div>
			
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
    
    $("#maintable").append("<table class='table table-hover table-bordered'>"+
				"<thead class='h4' style='background-color:#D6D6AD;'>"+
			"<tr>"+
				"<th scope='col'>保母名稱</th>"+
				"<th scope='col'>服務等級</th>"+
				"<th scope='col'>服務內容</th>"+
				"<th scope='col'>服務日期</th>"+
			"</tr></thead>"+
			"<tbody id='ttable' class='h5'>"+
			"</tbody></table>")
    
    function momchange(change){
    	if(change=='我的保母訂單'){
    		$("#maintable").html("");
    		$("#mymom").addClass("active")
    		$("#othermom").removeClass("active")
    		$("#myreserv").css("display","none")
    		$("#maintable").append("<table class='table table-hover table-bordered'>"+
      				"<thead class='h4' style='background-color:#D6D6AD;'>"+
					"<tr>"+
						"<th scope='col'>保母名稱</th>"+
						"<th scope='col'>服務等級</th>"+
						"<th scope='col'>服務內容</th>"+
						"<th scope='col'>服務日期</th>"+
					"</tr></thead>"+
					"<tbody id='ttable' class='h5'>"+
					"</tbody></table>")
    	}else{
    		$("#maintable").html("");
    		$("#mymom").removeClass("active")
    		$("#othermom").addClass("active")
    		$("#myreserv").css("display","")
    		$("#maintable").append("<table class='table table-hover table-bordered'>"+
      				"<thead class='h4' style='background-color:#DEFFAC;'>"+
					"<tr>"+
						"<th scope='col'>保母名稱</th>"+
						"<th scope='col'>服務等級</th>"+
						"<th scope='col'>服務內容</th>"+
						"<th scope='col'>服務日期</th>"+
					"</tr></thead>"+
					"<tbody id='ttable' class='h5'>"+
					"</tbody></table>")
    	}
    	
    }
    
	</script>

</body>
</html>