<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh-Hant-TW">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
    <title>AccompanyMe</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
    
    .qq,.qq2,.qq3{
 
        border: solid 2px black;
        width: 300px;
        height: 200px;
        text-align: center;
        margin: 20px;
        margin-top: 8px;     
        display: inline-block;
         border-radius: 8px;
    }
    .qqq{
        text-align: center;
    }
 
    #ig01, #ig02,#ig03{
     
     border-radius:50%
    }
    .pettop{
        text-align: center
        
    }
    
    #top{
        width: 800px;
        height: 400px;
    }
    .formgroup{
        
        width: 450px;
        margin: auto;
        border: solid 1px;
        margin-bottom: 20px;
        border-radius: 8px;
        margin-top:30px

    }
    .submit{
        text-align: center;
    }

    h3{
       text-align: center;
       margin-top: 10px;
    }
    #gotop{ /*回到top按鈕設計*/
  		position:fixed;
  		right:30px;
  		bottom:31px;
  		width:50px;
  		height:50px;
  		text-align: center;
  		border: none;
  		background-image: url("Images/up.png");
  		background-size: 50px 50px;
		}
		#gotop:hover{/*button滑入不要背景顏色*/
  			background-color: transparent;
		}
    </style>
<script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->
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
                        <a class="nav-link" href="">寵物商城</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="../zseqw123/extar.jsp">寵物保姆</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="">寵物討論區</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="index.jsp">寵物店家</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="../Wu/activitymain.jsp">寵物活動/消息</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link left-margin" href=""><img src="Images/shopping-cart.svg" width="30" height="30"
                                alt=""></a>
                    </li>
                    <li class="nav-item" style="color:white;">
                        <%
                        	if(session.getAttribute("user")==null)
							{
								out.print("<a class='nav-link' href='../Gusty/index.jsp'><img src='../Gusty/Images/user.svg' width='30' height='30' alt=''></a>");
							}
							else{%>
								<%out.print("<a href='../Gr.jsp'>"); %>
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
    
<div class="container">

    <div calss="title">
        <h3>修改訂單</h3>
        



    </div>
    <form class="formgroup"  method="post" action="../Henry/update">
       
        
        <fieldset>
             
           
         <div><label for="exampleFormControlInput1">飼主姓名</label>
            <input type="text" class="form-control" id="name" placeholder="請輸入姓名" name="name" required="required">
         </div>
        <div>
            <label for="">修改時間</label>
            <input type="datetime-local" id="date" name="time" required="required">
         </div>
            
            
            <div class="submit">
                <input type="submit" value="送出"  name="update"> 
               
              	
            </div>
            
        </fieldset>
    </form>
  
</div> 







    <div w3-include-html="footer.html"></div><!--要include 的地方-->
    
    <button type="button" class="btn btn-outline-primary" id="gotop"></button>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>w3.includeHTML();</script><!--include 的下半部分-->
    
    <script>
        $(function(){//會到最上層的jquery
	        $('#gotop').click(function(){ 
		    $('html,body').animate({scrollTop:0}, 333);
	    });
	    $(window).scroll(function() {
		    if ( $(this).scrollTop() > 300 ){
			    $('#gotop').fadeIn(222);
		    } else {
			    $('#gotop').stop().fadeOut(222);
		    }
	        }).scroll();
        });
    </script>
</body>

</html>