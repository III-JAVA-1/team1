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
    <title>確認參與活動</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
	<script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->



<link rel="stylesheet" href="css/content.css">	
</head>
<jsp:include page="Header.jsp" />

<body style="background-color:#F0F0F0;">
 

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
       
    <table align="center" class="checktable" style="">
        
        <tbody> 
        	<tr> 	
         		<td class="acstyle" >活動名稱</td>
                <td class="acstyle" style="width: 500px;">備註欄</td>
                <td class="acstyle">參加狀況</td>
                <td class="acstyle">變更參加狀態</td>
        	</tr>
		</tbody>
		 
		<tbody id="WhatTable">
        </tbody>  
    </table>

  	<hr>
  	<h3 style="text-align:center;">其他活動</h3>		
    <br><br>
    <div class="row justify-content-center" id="indexactive">        
    <br>
    </div>
    


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
				if(n[2] == "已參加"){
					$("#WhatTable").append(						
							"<tr>"						
							+"<td class='acstyle'><a href='ActShow.jsp?get="+n[4]+"'/>" + n[0]+ "</td>"
							+"<td class='acstyle'>"+ n[1] +"</td>"
							+"<td class='acstyle'>"+ n[2] +"</td>"						
							+"<td class='acstyle'>"						
							+"<form method='post' action='../Wu/NoJoin'>"
						    +"<input type='hidden' name='jid' id='jid' value='"+n[3]+"'/>"							
							+"<button type='submit' id='BtnSend' class='btn btn-primary btn-sm' value='cancelbt'  onclick='return rusure()'>取消參加</button>"
							+"</form>"						
							+"</td>"						
							+"</tr>"
									);					
				}else{
					$("#WhatTable").append(						
							"<tr>"						
							+"<td class='acstyle'><a href='ActShow.jsp?get="+n[4]+"'/>" + n[0]+ "</td>"
							+"<td class='acstyle'>"+ n[1] +"</td>"
							+"<td class='acstyle'>"+ n[2] +"</td>"						
							+"<td class='acstyle'>"											
							+"</td>"						
							+"</tr>"
									);
				}
				


					});
				}
			});
			   
		});
		
		

		
	    $.ajax({
			url:"../Gusty/indexactive",
			type:"post",
			dataType:"json",
			success:function(data){
				$.each(data,function(i,n){
					$("#indexactive").append("<div class='card m-2' style='width: 15rem;height:350px;'>"+
		  			"<img src='<c:url value='../Gusty/getactiveimg2?act_no="+n[2]+"'/>' class='card-img-top' alt='' style='height:200px;'>"+
		  			"<div class='card-body'>"+
		    			"<h5 class='card-title'><a href='ActShow.jsp?get="+n[2]+"' class='card-title'>"+n[0]+"</a></h5>"+
		    			"<p class='card-text h4'>"+n[1].substring(0,10)+"....</p>"+
		  			"</div></div>");
				});
			}
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