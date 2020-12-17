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
	
	.hhr{/*hr塞字*/
  			height: 5px;
  			text-align:center; 
  			line-height:0px; 
  			background:#F9F900;
		}
	.hhr:after{ 
  			content:"我是分隔線"; 
  			color:	#006000;
  			font-weight:bold;
  			font-size:20px; 
  			background:white; z-index:2;
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
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="#" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="shoporder.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >收藏商品/文章</a>
  					<a href="#" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4 "><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">訂單查詢</div>
  			</div><br>
  			
  			<div class="row justify-content-start">
  			<div class="col">
  				<p class="h4">排序方式:
  				<select class="form-select" aria-label="Default select example" id="queue">
  					<option selected>請選擇排序方式</option>
  					<option value="old">時間:舊-->新</option>
  					<option value="new">時間:新-->舊</option>
  					<option value="high">總金額:高-->低</option>
  					<option value="low">總金額:低-->高</option>
				</select>
  				</p>
  			</div>
    			
  			</div>
  			
  			<div class="col" id="ordertable">
  			
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
    
    var test;
    $.ajax({
		url:"../Gusty/shoporder",
		type:"post",
		//async : false,//要賦值給全域變數要改false
		dataType:"json",
		data : { 
			"user_id" : <%=session.getAttribute("user")%>,
			"queue":$("#queue").val(),
        },
		success:function(data){
			$.each(data,function(i,n){
				if(i==0||n[0]!=test){
					test=n[0];
					$("#ordertable").append("<table class='table table-hover table-bordered' id='"+test+"'>"+
			 				"<thead class='h4' style='background-color:#EA7500;'>"+
			 				"<tr>"+
			       			"<th scope='col'>訂單編號</th>"+
			       			"<th scope='col'>結帳日期</th>"+
			       			"<th scope='col'>總金額</th>"+
			       			"<th scope='col'>收貨地址</th>"+
			       			"<th scope='col'>備註</th>"+
			       			"</tr>"+
			   			"</thead>"+
			   			"<tbody>"+
			   				"<tr class='h4'><th scope='row'>"+n[0]+"</th>"+
			    				"<td>"+n[1]+"</td>"+
			    				"<td>"+n[2]+"&nbspNT</td>"+
			    				"<td>"+n[3]+"</td>"+
			    				"<td>"+n[4]+"</td></tr>"+
			    					"<thead class='h4' style='background-color:	#EA7500;''>"+
			     					"<tr>"+
			       					"<th scope='col' colspan='3'>商品名稱</th>"+
			       					"<th scope='col'>商品單價</th>"+
			       					"<th scope='col' >數量</th>"+
			   					"</thead></tbody></table>");
					$("#ordertable").append("<hr class='hhr'/>");
				}
				if(n[0]==test){
					$("#"+test+"").append("<tbody>"+
			   				"<tr class='h4'><th scope='row' colspan='3'><a href='shop.jsp?product="+n[8]+"'>"+n[5]+"</a></th>"+
			    				"<td>"+n[6]+"</td>"+
			    				"<td>"+n[7]+"</td></tr></tbody></table>");
				}
			});
		},
		error:function(){
			$("#ordertable").append("<div class='row justify-content-center h3'>沒有訂單紀錄</div>");
		}
	});
    
    $("#queue").change(function(){
    	$("#ordertable").html("");
    	console.log("aaaa");
    	$.ajax({
    		url:"../Gusty/shoporder",
    		type:"post",
    		//async : false,//要賦值給全域變數要改false
    		dataType:"json",
    		data : { 
    			"user_id" : <%=session.getAttribute("user")%>,
    			"queue":$("#queue").val(),
            },
    		success:function(data){
    			$.each(data,function(i,n){
    				if(i==0||n[0]!=test){
    					test=n[0];
    					$("#ordertable").append("<table class='table table-hover table-bordered' id='"+test+"'>"+
    			 				"<thead class='h4' style='background-color:#EA7500;'>"+
    			 				"<tr>"+
    			       			"<th scope='col'>訂單編號</th>"+
    			       			"<th scope='col'>結帳日期</th>"+
    			       			"<th scope='col'>總金額</th>"+
    			       			"<th scope='col'>收貨地址</th>"+
    			       			"<th scope='col'>備註</th>"+
    			       			"</tr>"+
    			   			"</thead>"+
    			   			"<tbody>"+
    			   				"<tr class='h4'><th scope='row'>"+n[0]+"</th>"+
    			    				"<td>"+n[1]+"</td>"+
    			    				"<td>"+n[2]+"&nbspNT</td>"+
    			    				"<td>"+n[3]+"</td>"+
    			    				"<td>"+n[4]+"</td></tr>"+
    			    					"<thead class='h4' style='background-color:#EA7500;''>"+
    			     					"<tr>"+
    			       					"<th scope='col' colspan='3'>商品名稱</th>"+
    			       					"<th scope='col'>商品單價</th>"+
    			       					"<th scope='col' >數量</th>"+
    			   					"</thead></tbody></table>");
    					$("#ordertable").append("<hr class='hhr'/>");
    				}
    				if(n[0]==test){
    					$("#"+test+"").append("<tbody>"+
    			   				"<tr class='h4'><th scope='row' colspan='3'><a href='shop.jsp?product="+n[8]+"'>"+n[5]+"</a></th>"+
    			    				"<td>"+n[6]+"</td>"+
    			    				"<td>"+n[7]+"</td></tr></tbody></table>");
    				}
    			});
    		},
    		error:function(){
    			$("#ordertable").append("<div class='row justify-content-center h3'>沒有訂單紀錄</div>");
    		}
    	});
    });
    
	</script>

</body>
</html>