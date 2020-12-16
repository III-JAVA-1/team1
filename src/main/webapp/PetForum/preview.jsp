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
    
   
    <style>
        *{padding: 0px;
            margin: 0px;
        }
    
        .h2{
            /* position:relative; */
            /* top:30px;
            left:30px; */
            margin:10px;
            display: inline;
        }
        .forumId{
            /* position:absolute;*/
            /* top: 80px;
            left:30px; */
            padding: 0.7em;
            margin:10px;              
         
         } 
         .header{
            /* position:absolute;*/
            /* top: 80px;
            left:200px; */
            padding: 0.7em;
            margin:10px;    
         }

         .updatedTime{
            /* top: 80px;
            left:30px; */
            padding: 0.7em;
            margin:10px;      
         }

         .lb{
            padding: 0.7em;
            margin:10px;   
         }

         .content{
            overflow:auto;
            margin: 10px;
         }

         .rightBtn{
             width: 100px;
             height: 40px;
             margin-left: 10px;
         }
         
         .ck{
            margin-left: 10px;
         }         
    </style>
    
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
    <br>                                                                                   

    <p>文章標題：<c:out value="${articleModel.getHeader()}"></c:out></p>
    <form:hidden name="header" path="header"/>    
    <br>
    <p>子版：<c:out value="${articleModel.getForumId()}"></c:out></p>
    <form:hidden name="forumId" path="forumId"/>    
    <br>
    
    <p>更新時間：<c:out value="${articleModel.getUpdatedTime()}"></c:out></p>
    <form:hidden name="updatedTime" path="updatedTime"/>   
    <br>
   
    <p>文章內容：
      <c:out value="${articleModel.getContent()}"></c:out></p>
      <form:hidden name="content" path="content"/>
      <form:hidden name="posterUid" path="posterUid"/>     
    </p><br>
  
  
    <c:choose>
    	<c:when test="${articleModel.getPosterUid() == null}">
    		<input type='submit' class='rightBtn' value='新增'  name='preview'>
    		<input class="rightBtn" type="button" value="取消發布" id="cancel" onclick="location.href='editArticle.jsp'">	
    	</c:when>
    	<c:otherwise>    	  
    		<input type='submit' class='rightBtn' value='確定修改'  name='preview'>
    		<input class="rightBtn" type="button" value="取消發布" id="cancel" onclick="location.href='edit.jsp?posterUid=${articleModel.getPosterUid()}'">
    	</c:otherwise>
    </c:choose>
    
</form:form>
</body>
</html>