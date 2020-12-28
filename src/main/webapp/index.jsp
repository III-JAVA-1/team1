<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--bootstrap初始規模-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<style>
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

<head>
<title>AccompanyME</title>

</head>
<body>
	
	<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="font-size:28px;">
            <a class="navbar-brand" href="index.jsp"><img src="image/AccompanyMe.png" style="width:200px; height:80px;" alt=""></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item ">
						<%
							if (session.getAttribute("user") == null || session.getAttribute("user") == "") {
								out.print("<a class=\"nav-link\" href=\"Store/\">毛孩商城</a>");
							} else {
								out.print("<a class=\"nav-link\" href=\"Store/?memberId="
										+ session.getAttribute("user")
										+ "\">毛孩商城</a>");
							}
						%>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<c:url value='mom/registerMom.jsp'/>">寵物保姆</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<c:url value='PetForum/forum.jsp'/>">汪喵討論區</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Petshop/mainshop.jsp">寵物店家</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Active/ActIndex.jsp">寵物活動/消息</a>
                    </li>
                    <li class="nav-item" style="color:white;">
                        <%
                        	if(session.getAttribute("user")==null||session.getAttribute("user")=="")
							{
								out.print("<a class='nav-link' href='Member/Login.jsp'><img src='image/user.svg' width='30' height='30' alt=''></a>");
							}else{
								 out.print("<a class='nav-link' href='Member/Member.jsp' id='sname'></a>");
							}
						%>
                    </li>
                </ul>
            </div>
    </nav>
    </header>
	
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="image/U1.jpg" class="d-block w-100" alt="" style="width:100%;height:500px;">
          </div>
          <div class="carousel-item">
            <img src="image/U1.jpg" class="d-block w-100" alt="" style="width:100%;height:500px;">
          </div>
          <div class="carousel-item">
            <img src="image/U1.jpg" class="d-block w-100" alt="" style="width:100%;height:500px;">
          </div>
          <div class="carousel-item">
            <img src="image/U1.jpg" class="d-block w-100" alt="" style="width:100%;height:500px;">
          </div>
          <div class="carousel-item">
            <img src="image/U1.jpg" class="d-block w-100" alt="" style="width:100%;height:500px;">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </a>
        
      </div><br>
	
	<div class="container">
		
		<div class="d-flex justify-content-center">
    		<div class="display-2">精選活動或店家</div>
  		</div>
		
		<div class="row justify-content-center">
		
		<div class="card m-2" style="width: 15rem;">
  			<img src="image/shark.jpg" class="card-img-top" alt="...">
  			<hr>
  			<div class="card-body">
    			<h5 class="card-title">活動</h5>
    			<p class="card-text">我應該會放活動</p>
    			<a href="#" class="btn btn-primary">Go somewhere</a>
  			</div>
		</div>
		
		<div class="card m-2" style="width: 15rem;">
  			<img src="image/shark.jpg" class="card-img-top" alt="...">
  			<hr>
  			<div class="card-body">
    			<h5 class="card-title">活動</h5>
    			<p class="card-text">我應該會放活動</p>
    			<a href="#" class="btn btn-primary">Go somewhere</a>
  			</div>
		</div>
		
		<div class="card m-2" style="width: 15rem;">
  			<img src="image/shark.jpg" class="card-img-top" alt="...">
  			<hr>
  			<div class="card-body">
    			<h5 class="card-title">活動</h5>
    			<p class="card-text">我應該會放活動</p>
    			<a href="#" class="btn btn-primary">Go somewhere</a>
  			</div>
		</div>
		
		<div class="card m-2" style="width: 15rem;">
  			<img src="image/shark.jpg" class="card-img-top" alt="...">
  			<hr>
  			<div class="card-body">
    			<h5 class="card-title">活動</h5>
    			<p class="card-text">我應該會放活動</p>
    			<a href="#" class="btn btn-primary">Go somewhere</a>
  			</div>
		</div>
		
		</div>
		<hr style="height:20px; color:green">
		
		<div class="d-flex justify-content-center">
<!--     		<div class="display-2">最新商品</div> -->
  		</div>
  		
  		<div class="row justify-content-center" id="indexshop" >
  		
<!--   		<div class="card m-2" style="width: 15rem;"> -->
<!--   			<img src="image/ame.png" class="card-img-top" alt="..."> -->
<!--   			<div class="card-body"> -->
<!--   			<h2>我是商品</h2> -->
<!--     			<p class="card-text">商品商品商品商品商品商品商品商品商品</p> -->
<!--   			</div> -->
<!-- 		</div> -->
		
		</div>
		
	</div><br>
	
	<div id="gotop">
	</div>
	
	<footer class="py-5 bg-dark">
        <p class="m-0 text-center text-white h2">AccompanyMe │ 有你陪伴 &copy Designed by Eva .</p>
    </footer>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>	
	
		
	<script>
	$('#gotop').click(function(){//回最上層JQUERY
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
	
    $().ready(function(){
		$.ajax({
			url:"Gusty/headercheck",
			type:"post",
			dataType:"json",
			data : { 
				"user_id" : <%=session.getAttribute("user")%>,                     
            },
			success:function(data){
				$.each(data,function(i,n){
					$("#sname").html(n.sname+"您好");
				});
			}
		});
	});
    var shopname;
    var xx=0;
    var userid=<%=session.getAttribute("user")%>;//商品顯示最新4筆
    $().ready(function(){
		$.ajax({
			url:"Gusty/indexshop",
			type:"post",
			dataType:"json",
			success:function(data){
				$.each(data,function(i,n){
					if(i==0||shopname!=n[0]){
						shopname=n[0];xx=xx+1;
						if(xx>4){return false;}
						$("#indexshop").append("<div class='card m-2' style='width: 15rem;'>"+
					  			"<img src='"+n[2]+"' class='card-img-top border border-dark border-2'>"+
					  			"<div class='card-body'>"+
					  			"<h2 id='"+n[3]+"'></h2><hr>"+
					    		"<p class='card-text h4'>"+n[1]+"&nbspNT</p>"+
					  			"</div></div>");
						if(userid==null||userid==""){
							$("#"+n[3]+"").append("<a class='card-link' href='<c:url value='Store/productDetail?id="+n[3]+"&memberId='/>'>"+n[0]+"</a>");
						}else{
							$("#"+n[3]+"").append("<a class='card-link' href='<c:url value='Store/productDetail?id="+n[3]+"&memberId="+userid+"'/>'>"+n[0]+"</a>");
						}
						
					}
				});
			}
		});
	});
    
	</script>
	
</body>
</html>