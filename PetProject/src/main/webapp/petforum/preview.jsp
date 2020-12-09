<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
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
        .selForumId{
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
<form action="/PetProject/ReleaseArticleServlet"  method="post" accept-charset="utf-8"> 
    <br>                                                                                   

    <p>文章標題:<%=request.getParameter("header")%></p>
    <input type="hidden" name="header" value="<%=request.getParameter("header")%>">
    <br>
    <p>子版:<%=request.getParameter("selForumId")%></p>
    <input type="hidden" name="selForumId" value="<%=request.getParameter("selForumId")%>">
    <br>
    
    <p>更新時間<%=request.getParameter("updatedTime")%></p>
    <input type="hidden" name="updatedTime" value="<%=request.getParameter("updatedTime")%>">
    <br>
   
    <p>文章內容
      <%=request.getParameter("content")%>
      <input type="hidden" name="content" value="<%=request.getParameter("content")%>">
       <input type="hidden" name="poster_uid" value="<%=request.getParameter("poster_uid")%>">
    </p><br>
    <%	
    	if(request.getParameter("poster_uid").toString().equals("0"))
    	{
    		out.print("<input class='rightBtn' type='submit' value='新增'  name='preview'>");
    %>	
    		<input class="rightBtn" type="button" value="取消發布" id="cancel" onclick="location.href='editArticle.jsp'">	
    <%	}
    	else{
    		out.print("<input class='rightBtn' type='submit' value='確定修改'  name='preview'>");
    %>		
     <input class="rightBtn" type="button" value="取消發布" id="cancel" onclick="location.href='edit.jsp?edit=<%=request.getParameter("edit")%>'">
    <%	}
    %> 
    
    
    
</form>
</body>
</html>