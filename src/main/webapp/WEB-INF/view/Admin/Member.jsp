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
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">	
<link href="../Admin/css/Adminchart.css" rel="stylesheet">
	<%
	String basePath = request.getScheme()+"://"+
		request.getServerName()+":"+request.getServerPort()+
		request.getContextPath()+"/";
		//這會顯示localhost+port號
	%>
	
<title>AccompanyMe</title>
<style>
body{
    background-color: #F0F0F0;
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
		
		<div class="row mainarea">
		
		<div class="col-5 secondarea">
		<div class="row justify-content-center"><h1>會員男女比例</h1></div>
		<canvas id="boyandgirl" width="100" height="60" ></canvas>
		</div>
		
		<div class="col-5 secondarea">
		<div class="row justify-content-center"><h1>會員年齡比例</h1></div>
		<canvas id="age" width="100" height="60" ></canvas>
		</div>
		
		</div><br>
	
		<div class="col detailtable">
		
		<div class="row justify-content-center">
			<h1 class='display-4'>全部會員資料</h1>
		</div>
		<div class="row justify-content-center">
			<h4 id="count"></h4>
		</div>
		
		<table class="table table-hover table-bordered" id='maintable'>
  		<thead class="h4" style="background-color:#D200D2;">
    		<tr>
      			<th scope="col">編號</th>
      			<th scope="col">大頭貼</th>
      			<th scope="col">姓名</th>
      			<th scope="col">手機</th>
      			<th scope="col">電子郵件</th>
      			<th scope="col">暱稱</th>
      			<th scope="col">地址</th>
      			<th scope="col">停權</th>
    		</tr>
  		</thead>
  		<tbody id="membertable">
   
  		</tbody>
	</table>
		
		<div class="row justify-content-center">
			<h1 id="tip"></h1>
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
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	
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
            },
			success:function(data){
			$.each(data,function(i,n){
				for(let i=0;i<=8;i=i+1){
					if(n[i]==null){
						n[i]=""
					}
				}
				count=data.length;
					if(n[9]=="男"){
						boy=boy+1;
					}
					if(n[9]=="女"){
						girl=girl+1;
					}
					var oldbirth = new Date(n[10]);
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
							+"<td><img src='' id='gimg"+n[0]+"' alt='沒有上傳圖片' style='width:110px; height:90px; margin:auto;' onerror='imgDisplay(this)'></td>"
							+"<td>"+n[1]+"</td>"
							+"<td>"+n[2]+"</td>"
							+"<td>"+n[3]+"</td>"
							+"<td>"+n[4]+"</td>"
							+"<td>"+n[5]+n[6]+n[7]+n[8]+"</td>"
							+"<td style='background-color:#D7FFEE;'><div class='custom-control custom-switch'>"
							  +"<input type='checkbox' class='custom-control-input' onchange='stop("+n[0]+")' id='"+n[0]+"'>"
							  +"<label class='custom-control-label' id='l"+n[0]+"' for='"+n[0]+"'>正常</label>"
							  +"</div></td></tr>"
							//+"<td style='background-color:#D7FFEE;'><input type='checkbox' class='custom-control-input' id='customSwitch1'></td></tr>"
					);
					if(n[11]==1){
						$("#"+n[0]+"").attr("checked",true)
						$("#l"+n[0]+"").html("停權")
					}else{
						$("#"+n[0]+"").attr("checked",false)
						$("#l"+n[0]+"").html("正常")
					}
					if(n[12].indexOf("http")==0){
						$("#gimg"+n[0]+"").attr('src',n[12])
						//console.log(n[12])
					}else{
						$("#gimg"+n[0]+"").attr('src',"<c:url value='/Gusty/getallimg?id="+n[0]+"'/>")
					}
				});
			}
		});
	
	function stop(id){
		if($("#"+id+"").prop("checked")){
			$("#l"+id+"").html("停權")
		}else{
			$("#l"+id+"").html("正常")
		}
			$.ajax({
				url:"../Gusty/memberupdateauthority",
				type:"post",
				dataType:"json",
				async:false,
				data : {   
					"user_id":id,
	            },
				success:function(data){
					
				},error:function(){
					alert("發生錯誤，請稍後再嘗試")
				}
			});	
	}
	
	$('#maintable').DataTable({
		"language": {
	        "processing": "處理中...",
	        "loadingRecords": "載入中...",
	        "lengthMenu": "顯示 _MENU_ 項結果",
	        "zeroRecords": "沒有符合的結果",
	        "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
	        "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
	        "infoFiltered": "(從 _MAX_ 項結果中過濾)",
	        "infoPostFix": "",
	        "search": "搜尋:",
	        "paginate": {
	            "first": "第一頁",
	            "previous": "上一頁",
	            "next": "下一頁",
	            "last": "最後一頁"
	        },
	        "aria": {
	            "sortAscending": ": 升冪排列",
	            "sortDescending": ": 降冪排列"
	        }
	    }
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
    	//console.log(substitle)
    	$(substitle).attr('src', '../Member/image/user.png');
    }
    
	</script>

</body>
</html>