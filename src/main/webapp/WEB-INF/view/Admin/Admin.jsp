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
	.functioncard{
		background:	#82D900;
		border:5px #FF5809 solid;
		padding:5px;
		margin:5px;
	}
	.functioncard img{
		transform:scale(1,1);transition: all 1s ease-out;
	}
	.functioncard img:hover{
		transform:scale(1.2,1.2);
	}
	
</style>
</head>
<body>
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">後台首頁</p>
    		<div class="d-flex">
      		<a class="nav-link" href="../index.jsp">離開後台</a>
    		</div>
  		</div>
	</nav>

	<br>
	
	<div class="container">
	
		<div class="row">
		
			<div class="col-4">
			<div class="card functioncard ">
			<a href="<c:url value='/Gusty/goadminabality?abality=Member&admin=1'/>" class="nav-link">
  				<img src="../Admin/image/member.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理會員相關事項</p>
  				</div>
  			</a>	
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard ">
			<a href="<c:url value='../Store/?memberId=admin'/>" class="nav-link">
  				<img src="../Admin/image/shop.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理商品上下架和銷售量顯示</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard ">
			<a href="Member.jsp" class="nav-link">
  				<img src="../Admin/image/chat.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理論壇相關事項</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard">
			<a href="Member.jsp" class="nav-link">
  				<img src="../Admin/image/store.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理實體寵物店面相關事項</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard">
			<a href="Member.jsp" class="nav-link">
  				<img src="../Admin/image/activity.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理活動和課程相關事項</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard">
			<a href="Member.jsp" class="nav-link">
  				<img src="../Admin/image/mom.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理保母相關事項</p>
  				</div>
  			</a>	
			</div>
			</div>
			
		</div>
		
	</div>
	
	<div id="gotop">
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
	
	<script>
    
	</script>

</body>
</html>