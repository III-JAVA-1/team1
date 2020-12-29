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
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="#" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">我的收藏</div>
  			</div><br>
  			
  			<div class="row justify-content-center">
  			<ul class="nav nav-tabs">
  				<li class="nav-item">
    				<a class="nav-link h3 active" aria-current="page" href="#" id="store" onclick="store(this); return false;">商品</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link h3" href="#" onclick="forum(this); return false;" id="forum">文章</a>
  				</li>
			</ul>
			</div><br>
  			
  			<div class="row justify-content-start" id="favorite">
  			
<!--   			<div class="card col-4" style="width: 18rem;"> -->
<!--   				<img src="image/title.png" class="card-img-top" alt="..."> -->
<!--   				<div class="card-body"> -->
<!--     				<p class="card-text">ake up the bulk of the card's content.</p> -->
<!--   				</div> -->
<!-- 			</div> -->
			
			</div>
			
			<div class="d-flex justify-content-center" >
			<div class="h4" id="favorite2"></div>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
    
    var name;
    var userid=<%=session.getAttribute("user")%>
    $.ajax({
		url:"../Gusty/favoritestore",
		type:"post",
		//async : false,//要賦值給全域變數要改false
		dataType:"json",
		data : { 
			"user_id" : <%=session.getAttribute("user")%>,
        },
		success:function(data){
			$.each(data,function(i,n){
				if(i==0||n[1]!=name){
					$("#favorite").append("<div class='card col-4' style='width: 18rem;'>"+
			  				"<img src='"+n[3]+"' class='card-img-top' alt=''>"+
			  				"<div class='card-body'>"+
			    				"<a class='h5' href='<c:url value='../Store/productDetail?id="+n[0]+"&memberId="+userid+"'/>'><p class='card-text'>"+n[1]+"</p></a>"+
			  					"<p class='h4'>價格:&nbsp"+n[2]+"NT</p>"+
			  					"<button type='button' onclick='deletelove("+n[0]+")' class='btn btn-danger'>取消收藏</button>"+
			    			"</div>"+
						"</div>");
					name=n[1];
				}
				
			});
		},
		error:function(){
			$("#favorite2").html("沒有收藏商品");
		}
	});
    
    function forum(){
    	$("#favorite").html("");
    	$("#favorite2").html("");
    	$("#store").removeClass("active");
    	$("#forum").addClass("active");
    	$("#favorite2").html("沒有收藏文章");
    	return false;
    }
    
    function store(){
    	$("#favorite").html("");
    	$("#favorite2").html("");
    	$("#forum").removeClass("active");
    	$("#store").addClass("active");
    	 $.ajax({
    			url:"../Gusty/favoritestore",
    			type:"post",
    			//async : false,//要賦值給全域變數要改false
    			dataType:"json",
    			data : { 
    				"user_id" : <%=session.getAttribute("user")%>,
    	        },
    			success:function(data){
    				$.each(data,function(i,n){
    					if(i==0||n[1]!=name){
    						$("#favorite").append("<div class='card col-4' style='width: 18rem;'>"+
    				  				"<img src='"+n[3]+"' class='card-img-top' alt=''>"+
    				  				"<div class='card-body'>"+
    				    				"<a class='h5' href='<c:url value='../Store/productDetail?id="+n[0]+"&memberId="+userid+"'/>'><p class='card-text'>"+n[1]+"</p></a>"+
    				  					"<p class='h4'>價格:&nbsp"+n[2]+"NT</p>"+
    				  					"<button type='button' onclick='deletelove("+n[0]+")' class='btn btn-danger'>取消收藏</button>"+
    				    			"</div>"+
    							"</div>");
    						name=n[1];
    					}
    				});
    			},
    			error:function(){
    				$("#favorite2").html("沒有收藏商品");
    			}
    		});
    	return false;
    }
    
    function deletelove(pid){
    	//alert(pid);
    	$.ajax({
			url:"../Gusty/deletlove",
			type:"post",
			//async : false,//要賦值給全域變數要改false
			dataType:"json",
			data : { 
				"product_id" : pid,
	        },
			success:function(data){
				if(data==1){
					Swal.fire({
	    			title: '取消收藏成功',
	    			icon: 'success',
	    			confirmButtonText: '確定'
	    			}).then((result) => {
	    			if (result.isConfirmed) {
	    				store()
	    			}})			
				}
			},
		});
    }
    
	</script>

</body>
</html>