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

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
	<script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->
	
	
	<style>
	
	.acstyle{
	border: 1px solid black;
	}
		
	</style>
	
	
</head>
<jsp:include page="Header.jsp" />

<body>
 

    <!-- container的開頭-->


    <!-- NavBar頭-->
    <nav class="navbar navbar-expand-sm bg-light">

        <!-- Links -->
        <ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCalender.jsp">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp" onclick="return gogo()">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

    </nav>

    <!--Nav尾-->
    

    <H1 style="text-align: center;">我已參加的活動</H1>	
       
    <table align="center" class="checktable" style="border: 2px solid black;width: 1500px;">
        
        <tbody> 
        	<tr> 	
         		<td class="acstyle" style="width: 500px;">活動名稱</td>
                <td class="acstyle">備註欄</td>
                <td class="acstyle">參加狀況</td>
                <td class="acstyle">變更參加狀態</td>
        	</tr>
		</tbody>
		 
		<tbody id="WhatTable">
        </tbody>  
    </table>
    
    
    <div>        
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
    
<!--     測試用取消參加 -->
<!-- 				<form method='post' action='../Wu/NoJoin'>   -->
<!-- 				<input type='text' name='jid' id='jid' value='1'/> -->
<!-- 				<button type='submit' id='BtnSend' value='cancelbt' onclick='return rusure()'>取消參加</button> -->
<!-- 				</form> -->

</body>
<script>
$().ready(function(){//ajax完整活動資訊
	$.ajax({
		url:"../Wu/WhatJoin",
		type:"post",
		dataType:"json",
		data:{
			"u_Id" : <%=session.getAttribute("user")%>,
		},
		success : function(data) {
			$.each(data,function(i,n){

				$("#WhatTable").append(						
						"<tr>"						
						+"<td class='acstyle'><a href='ActShow.jsp?get="+n[4]+"'/>" + n[0]+ "</td>"
						+"<td class='acstyle'>"+ n[1] +"</td>"
						+"<td class='acstyle'>"+ n[2] +"</td>"						
						+"<td class='acstyle'>"						
						+"<form method='post' action='../Wu/NoJoin'>"
					    +"<input type='hidden' name='jid' id='jid' value='"+n[3]+"'/>"							
						+"<button type='submit' id='BtnSend' value='cancelbt' onclick='return rusure()'>取消參加</button>"
						+"</form>"						
						+"</td>"						
						+"</tr>"						
								);

					});
				}
			});
			   
		});
		
		
		function rusure()
		{
			if(confirm("確定要取消參加嗎?"))
// 			alert("已取消參加");
				return true;
			else
// 			alert("已取消取消操作");
				return false;
		}
		
</script>
<jsp:include page="Footer.jsp" />
</html>