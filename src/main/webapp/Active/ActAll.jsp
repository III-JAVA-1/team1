<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
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
	
	
	<style>
	
	.acstyle{
	border: 1px solid black;
	}
		
	</style>
	

</head>
<jsp:include page="Header.jsp"/>

<body>
<%-- 	<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" --%>
<%-- 	url="jdbc:sqlserver://127.0.0.1:1433;databaseName=PetDB" --%>
<%-- 	user="scott" password="tiger"/> --%>
	
<%-- 	<sql:query dataSource="${ds}" var="rs"> --%>
<!--    			select * from Active2 -->
<%-- 	</sql:query> --%>

<!-- ---------------------------------------------------------------------------------------------------------------------------------------------- -->


<!-- NavBar頭-->
    <nav class="navbar navbar-expand-sm bg-light">

        <!-- Links -->
        <ul class="navbar-nav" style="margin:auto;">

             <li class="nav-item">
                <a class="nav-link" href="ActIndex.jsp">活動首頁</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="ActAll.jsp">活動一覽</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="">活動行事曆</a>
            </li>
            
            <li class="nav-item">
            	<a class="nav-link" href="">確認參與活動</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="ActNew.jsp">新增活動</a>
            </li>
        </ul>

    </nav>

    <!--Nav尾-->
    
    



	<div class="container">
		<table style="border: 2px solid black; margin: auto;width:1000px;">
			
				<tr>
					<td class="acstyle">活動名稱</td>
					<td class="acstyle">活動時間</td>
					<td class="acstyle">活動簡介</td>
					<td class="acstyle">承辦單位</td>
					<td class="acstyle">連絡人</td>
				</tr>
				
			<tbody id="activetable">
			</tbody>

			
		</table>
		
<br><br>

	</div>
	
<script>

$().ready(function(){//ajax活動表格
	$.ajax({
		url:"../Wu/Activity",
		type:"post",
		dataType:"json",
		success : function(data) {
			$.each(data,function(i,n){

				$("#activetable").append(
				"<tr><td class='acstyle'>"+n.act_name+"</td>"
				+"<td class='acstyle'>"+n.starttime+" ~ "+n.endtime+"</td>"
				+"<td class='acstyle'>"+n.act_content+"</td>"
				+"<td class='acstyle'>"+n.act_organize+"</td>"
				+"<td class='acstyle'>"+n.act_orgman+"</td></tr>"
				);				
					});
				}
			});
			   
		});

</script>

</body>

<%-- <jsp:include page="Footer.jsp"/> --%>
</html>