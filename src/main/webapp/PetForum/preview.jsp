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
    
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</head>

<body>
			
<% request.setCharacterEncoding("UTF-8"); %>
    <h2 class="h2">文章預覽</h2>
    <!-- 發送petforum/commitEdit請求 -->
<form:form action="commitEdit"  method="POST" modelAttribute="articleModel"> 
                                                                                 
	<div id="article">
    <p>文章標題：<c:out value="${articleModel.getHeader()}"/></p>
    <form:hidden name="header" path="header"/>    
    </div>
    <div>
    <p>子版：<c:out value="${articleModel.getForumId()}"></c:out></p>
    <form:hidden name="forumId" path="forumId"/>    
    </div>
    <div>
    <p>更新時間：<c:out value="${articleModel.getUpdatedTime()}"></c:out></p>
    <form:hidden name="updatedTime" path="updatedTime"/>   
    </div>
    <div>
    <p>文章內容：
      <c:out value="${articleModel.getContent()}"></c:out></p>
      <form:hidden name="content" path="content"/>
      <form:hidden name="posterUid" path="posterUid"/>     
    </p></div>
  
 
    <c:choose>
    	<c:when test="${editStatus.equals('新增')}">
    		<input type='submit' class='rightBtn' value='新增'  name='preview'>
    		<input class="rightBtn" type='submit' value="取消發佈" name='preview'>	
    	</c:when>
    	<c:otherwise>    	  
    		<input type='submit' class='rightBtn' value='確定修改'  name='preview'>
    		<input class="rightBtn" type='submit' value="取消修改" name='preview' onclick="location.href='edit.jsp?posterUid=${articleModel.getPosterUid()}'">
    	</c:otherwise>
    </c:choose>  
</form:form>

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
				console.log(data.posterUid);
					$("#article").append(
							"<img id='imgshow' src='<c:url value='/petforum/getPetPic?posterUid="+data.posterUid+"'/>'"+
							" style='width: 600px'  onerror='imgDisplay(this)'>");
			},
			error:function(){
				$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>")
			}
		})
		
		 function imgDisplay(noUpload) 
		  { 
		 	$(noUpload).attr("src","image/mask_dog.png");
		  } 
		
		
	</script>



</body>
</html>