<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!doctype html>
<html lang="zh-Hant-TW">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--bootstrap初始規模-->
    <title>AccompanyMe</title>
    <meta name="author" content="Gusty">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="../Styles/index.css" rel="stylesheet">
<script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->


	<style>
	
	.acstyle{
	border: 1px solid black;
	text-align: center;
	}
		
	</style>



</head>
<jsp:include page="Header.jsp"/>
<body>

    <!-- NavBar頭-->
    <nav class="navbar navbar-expand-sm bg-light">

        <!-- Links -->
        <ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

    </nav>

    <!--Nav尾-->
    
<div>
			<%String getact=request.getParameter("get");%>

   			
   			
   		<table style="width: 1000px; border: 2px solid black;margin: auto;">
   			<tbody>
   				<tr>
   					<td class="acstyle">活動名稱</td>
   					<td class="acstyle">活動時間</td>
					<td class="acstyle">活動類別</td>
   				</tr> 
		
   				<tr>
   					<td class="acstyle" id="act_name"></td>
   					<td class="acstyle" id="act_time"></td>
   					<td class="acstyle" id="act_type"></td>
   				</tr> 			

   			
   			</tbody>
   		</table>
   		<br>
   		<table style="width: 1000px; border: 2px solid black;margin: auto;">
   			<tbody>
   				<tr>
   					<td class="acstyle">承辦單位</td>
   					<td class="acstyle">連絡人</td>
   					<td class="acstyle">連絡電話</td>
   					
   				</tr> 
		
   				<tr>		
   					<td class="acstyle" id="act_org"></td>
   					<td class="acstyle" id="act_orgman"></td>
   					<td class="acstyle" id="act_phone"></td>
   					
   				</tr> 			
				
   			</tbody>
   			
   		</table>
   		<br>
   		<table style="width: 1000px; border: 2px solid black;margin: auto;">
   				<tr>
					<td class="acstyle">活動簡介</td>
   				</tr>
				<tr>
					<td class="acstyle" id="act_content"></td>
   				</tr>
   		
   		</table>
   		
   		<br>
   		
   		
   		<div style="text-align: center;">
   		<form name=""  action="JoinPage.jsp" method="post" onsubmit="return gogo()">
        <input type="hidden" name="name" value="<%=getact %>" size="30" />    
        <input type="submit" name="send" id="joinbut"  value="點我報名" />
        </form>
   		</div>	
</div>

    
    <!-- container'sfoot -->
        <div>
        <br><br>
        </div>
    <!-- /.container結尾 -->


    <script>
//     	function gogo()
//     	{
<%--     		<% --%>
//     			if(session.getAttribute("user")==null)
<%--     			{%>window.alert("請先登入"); return false; --%>
<%--     			<%}else{%> --%>
//     			return  true;
<%--     			<%}%> --%>
    				
    				
//     		return false;
//     	}

    	
    	$().ready(function(){//ajax完整活動資訊
    		$.ajax({
    			url:"../Wu/ActDetail",
    			type:"post",
    			dataType:"json",
    			data:{
    				"act_no":<%=getact %>
    			},
    			success : function(data) {
    				$.each(data,function(i,n){
    					
    					$("#act_name").html(n.act_name);
    					$("#act_time").html(n.starttime+" ~ "+n.endtime);
    					$("#act_content").html(n.act_content);
    					$("#act_org").html(n.act_organize);
    					$("#act_orgman").html(n.act_orgman);
    					$("#act_phone").html(n.act_orgphone);
    					$("#act_type").html(n.act_type);
    					
				
    						});
    					}
    				});
    				   
    			});
         	
    </script>
    
</body>
<jsp:include page="Footer.jsp"/>
</html>