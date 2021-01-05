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
    	background-image: url("../Admin/image/up.png");
    	color: white;
    	cursor: pointer;
    	z-index: 1000;
	}
/* 	tr:nth-child(even+1) {background: #CCC} */
/* 	tr:nth-child(odd+1) {background: #FFF} */
	
</style>
</head>
<body>
	
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">商城後台</p>
    		<div class="d-flex">
      		<a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
    		</div>
  		</div>
	</nav><br>
	
<%-- 	<c:url value='../Store/?memberId=admin'/> --%>

	<div class="container">
		
		<div class="row justify-content-center">
		<div class='h1'>本月銷售商品Top10</div>
		<canvas id="storesales" width="100" height="50"></canvas>
		</div><hr><br>
		
		<div class="row justify-content-center">
		<div class='h1'>本月銷售業績</div>
		<canvas id="sales" width="100" height="50"></canvas>
		</div>
		
		<div class="row justify-content-center">
		<button type="button" class="btn btn-info btn-lg" onclick="location.href='<c:url value='../Store/?memberId=1'/>'">管理商品</button>
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
    
    var storename=[];//top10商品名稱
    var storeamount=[];//top10商品銷量
    var storeday=[];//總金額日期
    var storeallmoney=[];//總金額金額
    
    $.ajax({
		url:"../Gusty/storetop10",
		type:"post",
		dataType:"json",
		async:false,
		data : { 
			"month" :new Date().getMonth()+1,                     
        },
		success:function(data){
			$.each(data,function(i,n){				
				storename[i]=n[0]
				storeamount[i]=n[1]
			});
		}
	});
    
    $.ajax({
		url:"../Gusty/allsaless",
		type:"post",
		dataType:"json",
		async:false,
		data : { 
			"month" :new Date().getMonth()+1,                     
        },
		success:function(data){
			$.each(data,function(i,n){				
				storeday[i]=n[0]
				storeallmoney[i]=n[1]
			});
		}
	});
    
//     console.log(new Date().getMonth());
//     console.log(storename);
//     console.log(storeamount);
    
    Chart.defaults.global.defaultFontSize = 16;
    Chart.defaults.global.defaultFontColor = '#000000';
    
    var storesales = document.getElementById('storesales').getContext('2d');
   	//Chart.defaults.global.defaultFontStyle = '微軟正黑體';
    var chart = new Chart(storesales, {
        type: 'bar',
        data: {
            labels: storename,
            datasets: [{
                label: '銷售量',
                data: storeamount,
                backgroundColor: [
                    '#FF0080',
                    '#FF0000',
                    '#9F35FF',
                    '#00DB00',
                    '#00FFFF',
                    '#0080FF',
                    '#F9F900',
                    '#5CADAD',
                    '#9AFF02',
                    '#642100'
                ],
                borderWidth: 2,
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        display: false //this will remove only the label
                    }
                }]
            }
        }
    });
    
    var ctx = document.getElementById("sales").getContext('2d');

    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: storeday,
            datasets: [{
                label: '當日銷售總金額(NT)',
                data: storeallmoney,
                fill: true,
                backgroundColor: '#00FFFF',
                borderColor: '#CE0000',
                borderWidth: 2
            }], 
        },
        
    });
    
	</script>

</body>
</html>