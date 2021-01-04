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
  					<a href="#" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="Petshop.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">訂單查詢</div>
  			</div><br>
  			
  			<div class="col">
  			<table class="table table-hover table-bordered ">
  				<thead class="h5" style="background-color:#FF00FF;">
    				<tr>
      					<th scope="col">訂單編號</th>
      					<th scope="col">結帳日期</th>
      					<th scope="col">總金額</th>
      					<th scope="col">訂單狀態</th>
      					<th scope="col">收貨地址</th>
      					<th scope="col">付款方式</th>
      					<th scope="col">備註</th>
    				</tr>
  				</thead>
  				<tbody id="ordertable" class="h5">
  				</tbody>
  			</table>
  			
			</div>
			
			<div class="row justify-content-center h4" id="tip">
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

    	$.ajax({
    		url:"../Gusty/shoporder",
    		type:"post",
    		//async : false,//要賦值給全域變數要改false
    		dataType:"json",
    		data : { 
    			"userid" : <%=session.getAttribute("user")%>
            },
    		success:function(data){
    			$("#tip").html("");
    			$.each(data,function(i,n){
    				if(i>4){return false;}
    				if(n[6]==0){n[6]="信用卡"}
    				else{n[6]="貨到付款"}
    				if(n[3]==1){n[3]="訂單成立"}
    				if(n[3]==2){n[3]="已出貨"}
    				if(n[3]==-1){n[3]="訂單取消"}
    				if(n[3]==3){n[3]="訂單完成"}
    				$("#ordertable").append("<tr><th scope='row'>"+n[0]+"</th>"+
    			   		"<td>"+n[1]+"</td>"+
    			   		"<td>"+n[2]+"</td>"+
    			   		"<td>"+n[3]+"</td>"+
    			   		"<td>"+n[4]+"</td>"+
    			   		"<td>"+n[6]+"</td>"+
    			   		"<td>"+n[5]+"</td>"+
    			   		"<td><button type='button' onclick='detail("+n[0]+")' class='btn btn-info'>詳細訂單資訊</button></td></tr>");
    			});
    		},
    		error:function(){
    			$("#tip").html("沒有訂單紀錄");
    		}
    	});
    	
    	function detail(oid){
    		//alert(oid);
    		var userid=<%=session.getAttribute("user")%>
    		Swal.fire({
    		  title: '訂單編號:&nbsp'+oid+'詳細訂單',
    		  html:"<a href='<c:url value='../productRate?orderId="+oid+"&memberId="+userid+"'/>'><button type='button' class='btn btn-info'>評價商品</button></a>"+
    			  	'<hr>'+
    				'<table class="table table-hover table-bordered ">'+
    				'<thead class="h5" style="background-color:#53FF53;">'+
				'<tr>'+
					'<th scope="col">商品名稱</th>'+
					'<th scope="col">商品數量</th>'+
					'<th scope="col">商品價格</th>'+
				'</tr>'+
			'</thead>'+
			'<tbody id="detailtable" class="h5">'+
			'</tbody>'+
			'</table>',
			width: '800px',
    		confirmButtonText: '確定'
    		})
    		
    		$.ajax({
        		url:"../Gusty/shoporderdetail",
        		type:"post",
        		dataType:"json",
        		data : { 
        			"orderid" : oid
                },
        		success:function(data){
        			$.each(data,function(i,n){
        				$("#detailtable").append("<tr><th scope='row'><a href='<c:url value='../Store/productDetail?id="+n[0]+"&memberId="+userid+"'/>'>"+n[2]+"</a></th>"+
        			   		"<td>"+n[1]+"</td>"+
        			   		"<td>"+n[3]+"</td></tr>");
        			   		//"<td></td></tr>");
        			});
        		}
        	});
    	}
	
    	var page=4;
    	$(window).scroll(function(){
   	     //最後一頁scrollTop=body-window，50是預留空間
   	     last=$("body").height()-$(window).height()-50
   	     if($(window).scrollTop()>=last){
   	     	//console.log("aaa");
   	    	$.ajax({
   	    		url:"../Gusty/shoporder",
   	    		type:"post",
   	    		//async : false,//要賦值給全域變數要改false
   	    		dataType:"json",
   	    		data : { 
   	    			"userid" : <%=session.getAttribute("user")%>
   	            },
   	    		success:function(data){
   	    			console.log(data.length);
   	    			page=page+5;
   	    			$.each(data,function(i,n){
   	    				if(i>page-5&&i<=page){
   	    					if(n[6]==0){n[6]="信用卡"}
   	     				else{n[6]="貨到付款"}
   	     				if(n[3]==1){n[3]="訂單成立"}
   	     				if(n[3]==2){n[3]="已出貨"}
   	     				if(n[3]==-1){n[3]="訂單取消"}
   	     				if(n[3]==3){n[3]="訂單完成"}
   	     				$("#ordertable").append("<tr><th scope='row'>"+n[0]+"</th>"+
   	     			   		"<td>"+n[1]+"</td>"+
   	     			   		"<td>"+n[2]+"</td>"+
   	     			   		"<td>"+n[3]+"</td>"+
   	     			   		"<td>"+n[4]+"</td>"+
   	     			   		"<td>"+n[6]+"</td>"+
   	     			   		"<td>"+n[5]+"</td>"+
   	     			   		"<td><button type='button' onclick='detail("+n[0]+")' class='btn btn-info'>詳細訂單資訊</button></td></tr>");
   	    				}		
   	    			});
   	    			if(page>data.length){
   						$("#tip").html("已經是最底");
   					}
   	    		},
   	    		error:function(){
   	    			$("#tip").html("沒有訂單紀錄");
   	    		}
   	    	});
   	     }
   	})
	</script>

</body>
</html>