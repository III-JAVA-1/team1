<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

</head>

<body>
<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://127.0.0.1:1433;databaseName=PetDB"
	user="scott" password="tiger"/>

	<div class="container">

		<div class="row justify-content-center">
			<H1>所有活動</H1>
		</div>
		
		
			<sql:query dataSource="${ds}" var="rs">
   			select * from Active2
   			</sql:query>
   			
   		<table style="border: 2px solid black;margin: auto;">
   			<tbody>
   				<tr>
   					<td class="acstyle">活動名稱</td>
   					<td class="acstyle">活動時間</td>
   					<td class="acstyle">活動簡介</td>
   					<td class="acstyle">承辦單位</td>
   					<td class="acstyle">連絡人</td>
   				</tr> 
   			<c:forEach var="row" items="${rs.rows}">   			
   				<tr>
   					<td class="acstyle"><c:out value="${row.act_name}" /></td>
   					<td class="acstyle"><c:out value="${row.act_time}" /></td>
   					<td class="acstyle"><c:out value="${row.act_content}" /></td>
   					<td class="acstyle"><c:out value="${row.act_organize}" /></td>
   					<td class="acstyle"><c:out value="${row.act_orgman}" /></td>
   				</tr> 			
   			</c:forEach>
   			
   			</tbody>
   		</table>


	</div>


</body>

</html>