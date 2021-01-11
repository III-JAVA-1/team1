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
  					<a href="Editmom.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="Momorder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="Petshop.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">店家預約服務訂單</div>
  			</div><br>
  			
  			<div class="row justify-content-start" >
			<table class="table table-hover table-bordered " id='maintable'>
  				<thead class="h4" style="background-color:#DCB5FF;">
    				<tr>
      					<th scope="col">預約店家</th>
      					<th scope="col">預約日期</th>
      					<th scope="col">預約姓名</th>
      					<th scope="col">手機</th>
      					<th scope="col">預約服務</th>
      					<th scope="col">地址</th>
      					<th scope="col">備註</th>
      					<th scope="col">操作</th>
    				</tr>
  				</thead>
  				<tbody id="petshoptable" class="h5">
  				</tbody>
  			</table>
			</div>
			
			<div class="d-flex justify-content-center">
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

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
    
    function editorder(oid){
    	//alert(oid)
    	window.location='../Petshop/update.jsp?sid='+oid
    }
    
    function orderdelete(oid){
    	$.ajax({
    		url:"../Gusty/memberpetshopdelete",
    		type:"post",
    		dataType:"json",
    		data : { 
    			"id":oid
            },
    		success:function(data){
    			Swal.fire({
    				title: '訂單刪除成功',
    				icon: 'success',
    				confirmButtonText: '確定'
    			}).then((result) => {
    				if (result.isConfirmed) {
        				window.location.href='Petshop.jsp';
        			}
        		})
    		}
    	});
    }
    
    $.ajax({
		url:"../Gusty/memberpetshop",
		type:"post",
		dataType:"json",
		data : { 
			"user_id" : <%=session.getAttribute("user")%>,
        },
		success:function(data){
			$("#tip").html("");
			$.each(data,function(i,n){
				$("#petshoptable").append("<tr><th scope='row'>"+n[0]+"</th>"+
			   		"<td>"+n[1]+"</td>"+
			   		"<td>"+n[2]+"</td>"+
			   		"<td>"+n[3]+"</td>"+
			   		"<td>"+n[4]+"</td>"+
			   		"<td>"+n[5]+"</td>"+
			   		"<td>"+n[7]+"</td>"+
					"<td><button type='button' class='btn btn-info' onclick='editorder("+n[6]+")'>修改訂單</button>"+
			   		"<button type='button' class='btn btn-danger' onclick='orderdelete("+n[6]+")'>刪除訂單</button></td></tr>");
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
		}
	});
    
	</script>

</body>
</html>