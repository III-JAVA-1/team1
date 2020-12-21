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
    <link href="Styles/index.css" rel="stylesheet">
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

			<li class="nav-item"><a class="nav-link" href="">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

    </nav>

    <!--Nav尾-->

    <H1 style="text-align: center;">我已參加的活動</H1>
		
	
       
    <table align="center" class="checktable" style="border: 2px solid black;width: 1500px;">
        <tbody>
        	<tr>
        	
         		<td class="acstyle" style="width: 500px;">活動名稱</td>
                <td class="acstyle">參加狀況</td>
                <td class="acstyle">變更參加狀態</td>
        	</tr>
        <c:forEach var="row" items="${rs.rows}">
            <tr>
             <form  action="/jsptest/ActNoJoinServlet"  method="POST">
             
             <input type="hidden" name="act_no" id="act_no" value="<c:out value="${row.act_no}" />">
             <input type="hidden" name="U_id" id="U_id" value="<%=session.getAttribute("user")%>">

                <td class="acstyle"><c:out value="${row.act_name}"/></td> 	<!--活動名稱 -->
                <td class="acstyle"><c:out value="${row.join_actnow}"/></td>	<!--參加狀況 -->
                <td class="acstyle"><button type="submit" id="BtnSend" value="cancelbt">取消參加</button></td>
               
             </form>   
            </tr>
         </c:forEach>
        </tbody>  
    </table>
   

    
    
    <!-- container'sfoot -->
    <div>
        <br><br>
    </div>

</body>

</html>