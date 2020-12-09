<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!doctype html>
<html lang="zh-Hant-TW">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
<meta charset="UTF-8">
<title>AccompanyMe</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://127.0.0.1:1433;databaseName=PetDB"
	user="scott" password="tiger"/>
	
	<% 	int userid=0;
		if(session.getAttribute("user")!=null)
		{
			userid = Integer.parseInt(session.getAttribute("user").toString());
		}
	%>
	<c:set var="useridd" value="<%=userid%>" />
	<!--<c:out value="${useridd}"/>-->
	
    <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="font-size:28px;">
            <a class="navbar-brand" href="../index.jsp"><img src="../Gusty/Images/AccompanyMe.png" style="width:200px; height:80px;" alt=""></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item ">
                    <%
                    	out.print(" <a class='nav-link' href='http://192.168.196.146:8090/test?memberId="+session.getAttribute("user")+"'>毛孩商城</a>"); 		
                    %>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="extar.jsp">寵物保姆</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="../jsp/lookforPet.jsp">寵物討論區</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="../Henry/index.jsp">寵物店家</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="../Wu/activitymain.jsp">寵物活動/消息</a>
                    </li>
                    <li class="nav-item" style="color:white;">
                        <%
                        	if(session.getAttribute("user")==null)
							{
								out.print("<a class='nav-link' href='../Gusty/index.jsp'><img src='../Gusty/Images/user.svg' width='30' height='30' alt=''></a>");
							}
							else{%>
								<%out.print("<a href='../Gusty/member.jsp'>"); %>
								<c:if test="${useridd > 0}">
								<sql:query dataSource="${ds}" var="rs">
   								select * from Member where U_id = ?
   								<sql:param value="${useridd}" />
   								</sql:query>
   								<c:forEach var="row" items="${rs.rows}">
   								<c:out value="${row.Sname}"/>
   								</c:forEach>
								</c:if>								
							<% out.print("您好</a>"); %>	
						<% 		
							}
						%>
                    </li>
                </ul>
            </div>
    </nav>
    </header>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</body>
</html>