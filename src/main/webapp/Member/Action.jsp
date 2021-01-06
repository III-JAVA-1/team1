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
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="Petshop.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">活動/課程紀錄</div>
  			</div><br>
  			
  			<div class="row justify-content-center">
    			<div class="h4">更改活動參加狀態請前往<a href="../Active/ActIndex.jsp">活動首頁</a></div>
  			</div><br>
  			
  			<div class="row justify-content-center h4">
    			<ul class="nav nav-pills nav-fill">
  					<li class="nav-item">
    					<a class="nav-link active" aria-current="page" id="action" href="#" onclick="return actionchange('活動')">活動</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="#" id="join" onclick="return actionchange('參加')">參加</a>
  					</li>
				</ul>
  			</div><br>
  			
			<table class="table table-hover table-bordered " id="maintable">	
  			</table>
  			
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
    
    $("#maintable").append("<thead class='h4' style='background-color:#FF60AF;'><tr>"+
			"<th scope='col'>活動名稱</th>"+
			"<th scope='col'>活動內容</th>"+
			"<th scope='col'>活動時間</th>"+
			"<th scope='col'>活動地址</th>"+
			"<th scope='col'>操作</th></tr>"+
	"</thead>"+
	"<tbody id='actiontable' class='h5'></tbody>");
    
    var userid=<%=session.getAttribute("user")%>
    
    $.ajax({
		url:"../Gusty/memberaction",
		type:"post",
		//async : false,//要賦值給全域變數要改false
		dataType:"json",
		data : { 
			"user_id" : <%=session.getAttribute("user")%>,
        },
		success:function(data){
			$('#maintable').DataTable().destroy()
			$.each(data,function(i,n){
				$("#actiontable").append("<tr><th scope='row'><a href='../Active/ActShow.jsp?get="+n[5]+"'>"+n[0]+"</a></th>"+
						"<td>"+n[1].substring(0,20)+".....</td>"+
			   			"<td>"+n[2].substring(0,10)+"~"+n[3].substring(0,10)+"</td>"+
			   			"<td>"+n[4]+"</td>"+
			   			"<td><button type='button' class='btn btn-info' onclick='joinpeople("+n[5]+")' >目前參加人數"+n[6]+"</button></td></tr>");
			});
			$('#maintable').DataTable({
		        "language": {
		            "paginate": {
		                "previous": "上一頁",
		                "next": "下一頁"
		            }
		        },
		  })
		},
		error:function(){
			$("#tip").html("沒有新增活動");
		}
	});
    
    
    function actionchange(title){
    	if(title=='參加'){
    		$('#maintable').DataTable().destroy()
    		$("#action").removeClass("active");
    		$("#join").addClass("active");
    		$("#maintable").html("");
    		$("#maintable").append("<thead class='h4' style='background-color:#FFFF93;'><tr>"+
    				"<th scope='col'>活動名稱</th>"+
    				"<th scope='col'>備註</th>"+
    				"<th scope='col'>參加狀態</th>"+
    				"<th scope='col'>攜帶寵物數量</th></tr>"+
    		"</thead>"+
    		"<tbody id='actiontable' class='h5'></tbody>");
    		
    		$.ajax({
    			url:"../Gusty/memberjoin",
    			type:"post",
    			//async : false,//要賦值給全域變數要改false
    			dataType:"json",
    			data : { 
    				"user_id" : <%=session.getAttribute("user")%>,
    	        },
    			success:function(data){
    				$.each(data,function(i,n){
    					$("#actiontable").append("<tr><th scope='row'><a href='../Active/ActShow.jsp?get="+n[5]+"'>"+n[0]+"</a></th>"+
    							"<td>"+n[1]+"</td>"+
    				   			"<td>"+n[2]+"</td>"+
    				   			"<td>"+n[3]+"&nbsp&nbsp數量:&nbsp"+n[4]+"</td></tr>");
    				});
    				$('#maintable').DataTable({
    			        "language": {
    			            "paginate": {
    			                "previous": "上一頁",
    			                "next": "下一頁"
    			            }
    			        },
    			  })
    			},
    			error:function(){
    				$("#tip").html("沒有參加活動");
    			}
    		});
    		return false;
    	}else{
    		$('#maintable').DataTable().destroy()
    		$("#join").removeClass("active");
    		$("#action").addClass("active");
    		$("#maintable").html("");
    		$("#maintable").append("<thead class='h4' style='background-color:#FF60AF;'><tr>"+
				"<th scope='col'>活動名稱</th>"+
				"<th scope='col'>活動內容</th>"+
				"<th scope='col'>活動時間</th>"+
				"<th scope='col'>活動地址</th>"+
				"<th scope='col'>操作</th></tr>"+
		"</thead>"+
		"<tbody id='actiontable' class='h5'></tbody>");
    		$.ajax({
    			url:"../Gusty/memberaction",
    			type:"post",
    			dataType:"json",
    			data : { 
    				"user_id" : <%=session.getAttribute("user")%>,
    	        },
    			success:function(data){
    				$.each(data,function(i,n){
    					$("#actiontable").append("<tr><th scope='row'><a href='../Active/ActShow.jsp?get="+n[5]+"'>"+n[0]+"</a></th>"+
    				   			"<td>"+n[1].substring(0,20)+".....</td>"+
    				   			"<td>"+n[2].substring(0,10)+"~"+n[3].substring(0,10)+"</td>"+
    				   			"<td>"+n[4]+"</td>"+
    				   			"<td><button type='button' class='btn btn-info' onclick='joinpeople("+n[5]+")' >目前參加人數"+n[6]+"</button></td></tr>");
    				});
    				$('#maintable').DataTable({
    			        "language": {
    			            "paginate": {
    			                "previous": "上一頁",
    			                "next": "下一頁"
    			            }
    			        },
    			  })
    			},
    			error:function(){
    				$("#tip").html("沒有新增活動");
    			}
    		});
    	}
    	return false;
    }
    	
    	function joinpeople(aid){
    		//alert(aid)
    		Swal.fire({
      		  	title: '活動名稱:<div id="mainname"></div>&nbsp參加人員',
      		  	html:"<table class='table table-hover table-bordered h4'>"+
      			"<thead style='background-color:#FFD2D2'>"+
        		"<tr><th scope='col'>名字</th>"+
          			"<th scope='col'>電郵</th>"+
          			"<th scope='col'>地址</th>"+
          			"<th scope='col'>攜帶寵物&數量</th>"+
          			"<th scope='col'>參加狀態</th>"+
          			"<th scope='col'>備註</th></tr>"+
      			"</thead>"+
      			"<tbody id='alljoinactive1'>"+
      			"</tbody>"+
    			"</table>",
    			width: '1000px',
      		confirmButtonText: '確定'
      		})
      		$.ajax({
      			url:"../Gusty/memberalljoin",
      			type:"post",
      			dataType:"json",
      			async:false,
      			data : { 
      				"aid":aid,
      	        },
      			success:function(data){
      				$.each(data,function(i,n){	
      					if(i==0){$("#mainname").html(n[9])}
      					$("#alljoinactive1").append("<tr><th scope='row'>"+n[0]+"</th>"+
      						"<td>"+n[1]+"</td>"+
      						"<td>"+n[2]+n[3]+n[4]+"</td>"+
      						"<td>"+n[5]+"&nbsp&nbsp"+n[6]+"隻</td>"+
      						"<td>"+n[7]+"</td>"+
      						"<td>"+n[8]+"</td></tr>");
      				});
      			}
      		});
    	}
    
	</script>

</body>
</html>