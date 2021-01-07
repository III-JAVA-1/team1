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
		
		<div class="col">
		
		<div class="row justify-content-center">
			<div class='display-4'>全部保母資料</div>
		</div>
		<div class="row justify-content-center">
			<h4 id="count"></h4>
		</div>
		
		<table class="table table-hover table-bordered" id='maintable'>
  		<thead class="h4" style="background-color:#0066CC;">
    		<tr>
      			<th scope="col">編號</th>
      			<th scope="col" style="width:100px;height:50px;">環境照片</th>
      			<th scope="col">名稱</th>
      			<th scope="col">年資</th>
      			<th scope="col">注意事項</th>
      			<th scope="col">服務內容</th>
      			<th scope="row"style="width:150px;">服務項目</th>
      			<th scope="col"style="width:200px;">服務寵物</th>
      			<th scope="col">操作</th>
    		</tr>
  		</thead>
  		<tbody id="momtable">
   
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
    
    $.ajax({
		url:"../Gusty/allmom",
		type:"post",
		dataType:"json",
		async:false,
		data : {                   
        },
		success:function(data){
		$.each(data,function(i,n){
			$("#count").html("保母總數:&nbsp"+data.length);
			for(let i=5;i<8;i=i+1){
				if(n[i]==null){
					n[i]="無"
				}
			}
			for(let i=8;i<12;i=i+1){
				if(n[i]==null){
					n[i]=""
				}
			}
				$("#momtable").append("<tr style='font-size:20px;' ><th scope='row'>"+n[0]+"</th>"
						+"<td><img src='<c:url value='/mom/getPic?momId="+n[0]+"'/>'alt='沒有上傳圖片' style='width:80px; height:80px;'></td>"
						+"<td>"+n[1]+"</td>"
						+"<td>"+n[2]+"</td>"
						+"<td>"+n[3]+"</td>"
						+"<td>"+n[4]+"</td>"
						+"<td>到府遛狗:&nbsp"+n[5]+"<br>安親照顧:&nbsp"+n[6]+"<br>寄宿照顧:&nbsp"+n[7]+"</td>"
						+"<td>"+n[8]+"、<br>"+n[9]+"、<br>"+n[10]+"、<br>"+n[11]+"</td>"
						+"<td><button type='button' class='btn btn-danger' onclick='deletemom("+n[0]+")'>刪除保母</button></td></tr>");
			});
		}
	});
    
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
    
    function deletemom(mid){
    	//alert(mid)
    	let message = window.prompt("請輸入刪除保母的原因");
    	if(message==null||message==""){
    		alert("請輸入原因")
    		return false;
    	}else{
    		$.ajax({
        		url:"../Gusty/deletemom",
        		type:"post",
        		dataType:"json",
        		async:false,
        		data : { 
        			"mid":mid,
        			"message":message,
                },
        		success:function(data){
        			Swal.fire({
        				title: '保母已刪除，已寄信告知留言者',
        				icon: 'success',
        				confirmButtonText: '確定'
        			}).then((result) => {
        				if (result.isConfirmed) {
        				window.location.href='<c:url value='/Gusty/goadminabality?abality=Mom'/>';
        				}
        			})
        		},error:function(){
        			alert("發生錯誤，請稍後再嘗試操作");
        		}
        	});
    	}
    }
    
	</script>

</body>
</html>