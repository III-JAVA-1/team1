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
	
<title>Accompany</title>
<style>

	
</style>
</head>
<body>
	
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">會員後台</p>
    		<div class="d-flex">
      		<a class="nav-link" href="Admin.jsp">回後台首頁</a>
    		</div>
  		</div>
	</nav>

	<br>
	
	<div class="container">
		
		<div class="row" >
		
		<div class="col-6" >
		<div class="row justify-content-center">
		<h1>會員男女比例</h1>
		</div>
		<canvas id="boyandgirl" >
		</canvas>
		</div>
		
		<div class="col-6" >
		<div class="row justify-content-center">
		<h1>會員年齡比例</h1>
		</div>
		<canvas id="age" >
		</canvas>
		</div>
		
		</div><br>
		
		<div class="col">
		<div class="row justify-content-center">
			<h1>全部會員資料</h1>
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
	var boy=0;
	var girl=0;
	var nowdate=new Date();
	var age1=0;
	var age2=0;
	var age3=0;
	//console.log(nowdate)
		$.ajax({
			url:"../Gusty/logincheck",
			type:"post",
			dataType:"json",
			async:false,
			//$(":contains(text)")
			success:function(data){
			$.each(data,function(i,n){
					if(n.gender=="男"){
						boy=boy+1;
					}
					if(n.gender=="女"){
						girl=girl+1;
					}
					var oldbirth = new Date(n.birth);
					//console.log(oldbirth.getyear());
					//console.log(nowdate.getYear() - oldbirth.getYear());
					if((nowdate.getYear() - oldbirth.getYear())<=30){
						age1++;
					}
					if((nowdate.getYear() - oldbirth.getYear())<=50&&(nowdate.getYear() - oldbirth.getYear())>=31){
						age2++;
					}
					if((nowdate.getYear() - oldbirth.getYear())>=51){
						age3++;
					}
				});
			}
		});
	
	
	var ctx = document.getElementById("boyandgirl").getContext('2d');//顯示男女比例
	var myChart = new Chart(ctx, {
		
	    type: 'pie',
	    data: {
	        labels: ["女", "男"],
	        datasets: [{        
	            data: [girl, boy],
	            backgroundColor: [
	                'rgba(255, 99, 132)',
	                'rgba(54, 162, 235)',
	            ],
	        }]
	    },
	});
	
	var ctx2 = document.getElementById("age").getContext('2d');//顯示男女比例
	var myChart = new Chart(ctx2, {
	    type: 'pie',
	    data: {
	        labels: ["30歲以下", "31-50歲","51歲以上"],
	        datasets: [{        
	            data: [age1,age2,age3],
	            backgroundColor: [
	                '#003D79',
	                '#01814A',
	                '#A23400',
	            ],
	        }]
	    },
	});
	</script>

</body>
</html>