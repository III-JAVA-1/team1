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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
	
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
	
</style>
</head>
<body>
	
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">會員後台</p>
    		<div class="d-flex">
      		<a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
    		</div>
  		</div>
	</nav>

	<br>
	
	<div class="container">
		
		<div class="row" style="box-shadow:8px 8px 9px 10px #cccccc;">
		
		<div class="col-6" style="border:5px black solid;padding:20px;background-color:	#84C1FF;">
		<div class="row justify-content-center">
		<h1>會員男女比例</h1>
		</div>
		<canvas id="boyandgirl" >
		</canvas>
		</div>
		
		<div class="col-6" style="border:5px black solid;padding:20px;background-color:yellow;">
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
		<div class="row justify-content-center">
			<h4 id="count"></h4>
		</div>
		
		<table class="table table-hover table-bordered" id='maintable'>
  		<thead class="h4" style="background-color:#D200D2;">
    		<tr>
      			<th scope="col">編號</th>
      			<th scope="col" style="width:100px;height:50px;">大頭貼</th>
      			<th scope="col">姓名</th>
      			<th scope="col">手機</th>
      			<th scope="col">電子郵件</th>
      			<th scope="col">暱稱</th>
      			<th scope="col">地址</th>
    		</tr>
  		</thead>
  		<tbody id="membertable">
   
  		</tbody>
	</table>
		
		<div class="row justify-content-center">
			<h1 id="tip"></h1>
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
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
	
	<script>
	var boy=0;
	var girl=0;
	var nowdate=new Date();
	var age1=0;
	var age2=0;
	var age3=0;
	var count=0;

		$.ajax({
			url:"../Gusty/adminmembernamesearch",
			type:"post",
			dataType:"json",
			async:false,
			data : { 
				"user_name" :null,                     
            },
			success:function(data){
			$.each(data,function(i,n){
				count=data.length;
					if(n[10]=="男"){
						boy=boy+1;
					}
					if(n[10]=="女"){
						girl=girl+1;
					}
					var oldbirth = new Date(n[11]);
					if((nowdate.getYear() - oldbirth.getYear())<=30){
						age1++;
					}
					if((nowdate.getYear() - oldbirth.getYear())<=50&&(nowdate.getYear() - oldbirth.getYear())>=31){
						age2++;
					}
					if((nowdate.getYear() - oldbirth.getYear())>=51){
						age3++;
					}
					$("#membertable").append("<tr style='font-size:20px;' ><th scope='row'>"+n[0]+"</th>"
							+"<td><img src='<c:url value='/Gusty/getallimg?id="+n[0]+"'/>'alt='沒有上傳圖片' style='width:80px; height:80px;' onerror='imgDisplay(this)'></td>"
							+"<td>"+n[1]+"</td>"
							+"<td>"+n[2]+"</td>"
							+"<td>"+n[3]+"</td>"
							+"<td>"+n[4]+"</td>"
							+"<td>"+n[5]+n[6]+n[7]+n[8]+"</td></tr>"
					);
				});
			}
		});
	
	
	$('#maintable').DataTable({
		"language": {
            "paginate": {
                "previous": "上一頁",
                "next": "下一頁"
            }
        },
	})
	$("#count").html("會員總數:"+count);
	
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
    
    function imgDisplay(substitle){
    	$(substitle).attr('src', '../Member/image/user.png');
    }
    
	</script>

</body>
</html>