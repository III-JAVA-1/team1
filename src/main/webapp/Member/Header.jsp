<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
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
<head>
<title>AccompanyME</title>

</head>
<body>

    <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="font-size:28px;">
            <a class="navbar-brand" href="../index.jsp"><img src="../image/AccompanyMe.png" style="width:200px; height:80px;" alt=""></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item ">
                    	<a class="nav-link" href="#">毛孩商城</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">寵物保姆</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<c:url value='../PetForum/lookforPet.jsp'/>">寵物討論區</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">寵物店家</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">寵物活動/消息</a>
                    </li>
                    <li class="nav-item" style="color:white;">
                        <%
                        	if(session.getAttribute("user")==null||session.getAttribute("user")=="")
							{
								out.print("<a class='nav-link' href='Login.jsp'><img src='../image/user.svg' width='30' height='30' alt=''></a>");
							}else{
								 out.print("<a class='nav-link' href='Member.jsp' id='headersname'></a>");
							}
						%>
                    </li>
                </ul>
            </div>
    </nav>
    </header>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
		
		<script>
		
		$().ready(function(){
			$.ajax({
				url:"../Gusty/headercheck",
				type:"post",
				dataType:"json",
				data : { 
					"user_id" : <%=session.getAttribute("user")%>,                     
                },
				success:function(data){
					$.each(data,function(i,n){
						$("#headersname").html(n.sname+"您好");
					});
				}
			});
		});
		</script>
</body>
</html>