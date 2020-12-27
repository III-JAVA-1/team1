<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
    <title>AccompanyMe</title><!--顯示文章標題-->  
  <link rel="stylesheet" type="text/css" href="../PetForum/css/colorbox.css">
    <link rel="stylesheet" href="../PetForum/css/common.css" />  
  <script type='text/javascript' src='../PetForum/js/jquery.colorbox.js'></script>
  
</head>

<body style="background-image: url(../PetForum/image/preview.jpg);">
			
<% request.setCharacterEncoding("UTF-8"); %>

<div class="col-12">	
	<div class="row justify-content-center">
    	<h2 class="h2">文章預覽</h2>
    </div>
    <!-- 發送petforum/commitEdit請求 -->    
<form:form action="commitEdit"  method="POST" modelAttribute="articleModel">
	<div class="row justify-content-center">
		<div id="display" style='display:none'>
			<div id='inline_content' style='padding:10px; width:500px;height:500px;border-radius:15px;background:#ccc;overflow: auto;'>
				<!-- AJAX -->
			</div>
		</div>
	</div>
	
    <form:hidden name="header" path="header"/>
    <form:hidden name="forumId" path="forumId"/>
    <form:hidden name="updatedTime" path="updatedTime"/> 
    <form:hidden name="content" path="content"/>
    <form:hidden name="posterUid" path="posterUid"/> 
   
	<div class="row justify-content-center">   		
	   	<c:if test="${editStatus.equals('新增')}">	   		
  			<input class="btn btn-secondary" type='submit' value='新增'  name='preview'>  		
  			<input style="margin-left: 10px;" class="btn btn-secondary" type='submit' value="取消發佈" name='preview'>	   		
	   	</c:if>
   		</div>	
	</div>
</div>
</form:form>
</div>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
   crossorigin="anonymous">  

<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<script>
		
		//網頁ready文檔加載完就做
		//網頁onload全部加載完成才做(音樂、圖片) 
	 $.ajax({
		url:"../petforum/showAtPreview",//此請求回傳的資料不會用到
		type:"POST",		
		dataType:"json",
		data:{
			"posterUid":"${articleModel.getPosterUid()}",				
		},
		success:function(data){
			$("#inline_content").html("");
			$("#display").css("display","block");
			$.each(data,function(i,n){
	 		console.log(n[6]);
			
				$("#inline_content").append(
				"<p>"+n[2]+"</p>"+
				"<p>"+n[3]+"</p>"+
				"<p>"+n[5]+"</p>");
			})
		},
		error:function(){
			$("#inline_content").append("<h2>"+"無法預覽文章"+"</h2>")
		}
	})	
		
	</script>



</body>
</html>