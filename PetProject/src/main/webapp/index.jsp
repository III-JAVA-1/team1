<%@page import="petforum.service.ArticleService"%>
<%@page import="petforum.model.MemberBean01"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!doctype html>
<html lang="zh-Hant-TW">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
    <title>AccompanyMe</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->
    <style>
    	hr{/*hr塞字*/
  			height: 5px;
  			text-align:center; 
  			line-height:0px; 
  			background:blue;
		}
		hr:after{ 
  			content:"快速登入"; 
  			font-weight:bold;
  			font-size:30px; 
  			background:white; z-index:2;
		}
		#rg1{/*動畫移動*/
  			animation: amos 15s infinite alternate;
		}

		#rg2{/*動畫移動*/
  			animation: amos2 15s infinite alternate;
		}

		@keyframes amos{/*動畫移動*/
    	0%{
      		transform: translateX(0);
    	}
    	100%{
      		transform: translateX(80vw);
    	}	
		}

		@keyframes amos2{/*動畫移動*/
  		0%{
    		transform: translateX(0);
  		}
  		100%{
    		transform: translateX(-80vw);
  		}
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
</head>

<body>

	 <jsp:include page="/petforum/header.jsp"/>
    
   
    
    <%	
		if(request.getParameter("todo")!=null)
		{
			if(request.getParameter("todo").equals("login"))
			{
				
				ArticleService service = new ArticleService();
				String hql = "FROM MemberBean where Email="+request.getParameter("email")+"and Password="+request.getParameter("email");
				List<MemberBean01> members = service.getAllMembers(hql);
					
					if(members != null){
						for(MemberBean01 member: members){							
						
							request.getSession(true).setAttribute("user", member.getU_Id());
						}
						
						response.sendRedirect("/PetProject/Gusty/Login.jsp");					
					}
					else{
						out.print("<script>window.alert('帳號或密碼錯誤，登入失敗')</script>");
					}						
			}
		}
	%>
	
    <div class="container">
        <h1 style="text-align: center; margin-top: 20px;">會員登入</h1>
        <form action="index.jsp" id="gform" style="width: 400px; margin: auto;" method="POST">
            <div class="form-group h4" style="display: inline;">
              <label for="exampleInputEmail1">電子郵件</label>
              <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email"> 
              <small class="form-text text-muted">我們不會任意分享您的電子郵件帳號</small>
            </div>
            <div class="form-group h4" style="margin-top: 10px;">
              <label for="exampleInputPassword1">密碼</label>
              <input type="password" class="form-control" id="password" name="password" maxlength="12" minlength="6" >
            </div>
            
            <center>
                <div style="margin: 10px" class="g-recaptcha" data-sitekey="6LdHyOEZAAAAANYuY52Ay1Y7-Ap-hyngsaspk-X6"></div>
                <button type="submit" class="btn btn-primary" style="width: 80px; height: 40px; margin: 10px;" value="login" name="todo">登入</button>
                <button type="button" class="btn btn-success" style="width: 80px; height: 40px; margin: 10px;" onclick="location.href='register.jsp'">註冊</button>
                <hr>
                <button type="button" class="btn btn-danger" style="width: 80px; height: 40px; margin: 10px;">FB</button>
                <button type="button" class="btn btn-danger" style="width: 80px; height: 40px; margin: 10px;">GOOGLE</button>
            </center>
          </form>
    </div>
    <div style="margin-top: 20px;">
        <img src="Images/login/register1.png" id="rg1" style="width: 200px; height: 200px;">
        <img src="Images/login/register2.png" id="rg2" style="width: 200px; height: 200px; float: right;">
    </div>

    <button type="button" class="btn btn-outline-primary" id="gotop"></button>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--bootstrap的東西-->
    
    <script src='https://www.google.com/recaptcha/api.js'></script><!--GOOGLE認證API-->

    <script>w3.includeHTML();</script><!--include 的下半部分-->

    <script>

    	document.getElementById("gform").addEventListener("submit",function(evt)
    	{
    	     var response = grecaptcha.getResponse();
    	     if(response.length == 0) 
    	     { 
    	         //reCaptcha not verified
    	         alert("你是機器人"); 
    	         evt.preventDefault();//停止動作
    	         return false;
    	      }
    	   	//captcha verified
   	      	//do the rest of your validations here
   	      	else if(document.getElementById("email").value==""||document.getElementById("password").value=="")
    	   		{
    	    	 alert("帳號或密碼不可為空，請輸入完整"); 
    	    	 evt.preventDefault();
    	    	 return false;
    	   	}
   	      	else{
   	      		return true;
   	      	}
    	
    	});	
    	

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