<%@page import="petforum.model.MemberBean01"%>
<%@page import="petforum.model.ArticleBean"%>
<%@page import="petforum.service.ArticleService"%>
<%@page import="petforum.model.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!doctype html>
<html lang="zh-Hant-TW">
  <head>   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>AccompanyMe</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <style>
    .img1{
  width:60px; 
  height:30px;

}
.navbar-brand{
  color: white;
}

.navbar-brand:hover{
  color: white;
}

#gotop{ /*回到top按鈕設計*/
  position:fixed;
  right:30px;
  bottom:31px;
  width:50px;
  height:50px;
  text-align: center;
  border: none;
  background-image: url(Images/up.png");
  background-size: 50px 50px;
}
#gotop:hover{/*button滑入不要背景顏色*/
  background-color: transparent;
}
  
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</head>

<body>
   
<jsp:include page="header.jsp"/>
    
 <!-- 討論區導覽列 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">        
        <a href="lookforPet.jsp?subForum=all" style="color:white;"><img src="Images/petforum.png" width="50"
                    alt="">汪喵討論區</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse" id="navbarColor01" style="font-weight: bold">
          <ul class="navbar-nav mr-auto">              
            <li class="nav-item" id="lookfor"><!--超連結到自己的頁面，觸發了傳遞參數的動作forumId=lookfor -->
             <a class="nav-link" href="lookforPet.jsp?forumId=lookfor" >走失協尋</a>
            </li>  
            <li class="nav-item" id="adopt">
             <a class="nav-link" href="lookforPet.jsp?forumId=adopt" >汪喵送養</a>
            </li>
            <li class="nav-item" id="life">
              <a class="nav-link" href="lookforPet.jsp?forumId=life" >汪喵日常</a>
            </li>            
            <li class="nav-item" id="easyTalk">
              <a class="nav-link" href="lookforPet.jsp?forumId=easyTalk" >輕鬆閒聊</a>
            </li>
            <li class="nav-item" id="share">
              <a class="nav-link" href="lookforPet.jsp?forumId=share" >心得分享</a>
            </li>
            <li class="nav-item" id="topic">
              <a class="nav-link" href="lookforPet.jsp?forumId=topic" >汪喵主題聊聊</a>
            </li>              
          </ul>     
          
        </div>
        	<form action="lookforPet.jsp" method="POST">
            <input type="text" placeholder="找文章名稱" name="inputText">
            <button class="btn btn-secondary" type="submit" >搜尋</button>
            </form>   
      </nav>
   <!-- 討論區導覽列 -->
    <hr>
    	<%
    		ArticleService service = new ArticleService();			
    	    		ArticleBean article = service.getArticle(Integer.parseInt(request.getParameter("posterUid")));
    	%> 	
       
    	<%
 	           		System.out.print(session.getAttribute("user"));
 	           	%><!-- 修改文章要驗證會員id是否一致 -->
    	<div class="container">
    	<div class="col-12">
    	<%--接收參數來自lookforPet.jsp --%>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	%><%
		MemberBean01 member = service.getMember(article.getMemberId());
			
			out.print("<div class='media'>");
			out.print("<div class='media-body'>");
			
				//System.out.print("img src='/PetProject/Gusty/image/"+member.getImg()+"'");
				//out.print("<img src='/PetProject/Gusty/image/"+member.getImg()+"' class='align-self-start mr-3' style='width:100px; height:100px;' alt='...'>");	
			
			out.print("<p>"+article.getMemberId());
			//request.getSession(true).setAttribute("memberId", rs.getString("member_id"));
			out.print("	");
			out.print(article.getUpdatedTime()+"</p>");
			out.print("<p>");
			out.print(article.getHeader());
			out.print("</p>");
			out.print("<p>");
			out.print(article.getContent());
			out.print("</p>");
			if(session.getAttribute("user")!=null && session.getAttribute("user").toString().equals(member.getU_Id()))
			{
				out.print("<form action='edit.jsp'>");
				
				out.print("<button type='submit' class='btn btn-primary' name='edit' value='");
				out.print(article.getPosterUid()+"'");
				out.print(">修改文章</button>");
				//out.print("value='rs.getString('member_id')'>修改文章</button>");
				out.print("</form>");
			}
			
			out.print("</div>");
			out.print("</div>");
	%>
           
    			
			
	
    	</div>
        </div>		
   
    <button type="button" class="btn btn-outline-primary" id="gotop"></button>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script>
    	function loginStatus(){
    		<% if(session.getAttribute("user")==null){%>
    		window.alert("請登入！");
    		return false;
    		<%}else{%>return true;<%}%>
    	}
    
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
   
     
    // 首頁js設定
        
      //$("#hitHeader").on("click",function(){
    //	//function test1(){  
        //let viewingCount = 0;//計數 
       //let viewingRecord;//存已瀏覽數
    	 //  console.log('234')
    	   //console.log(document.querySelector("#viewing").innerText);//"0" 已瀏覽數          
           //viewingRecord = parseInt(document.querySelector("#viewing").innerText);          
    	   
           //viewingCount++;
           //viewingRecord += viewingCount;
           //document.querySelector("#viewing").innerText=viewingRecord;
           
           //console.log(document.querySelector("#viewing").innerText);
           //document.querySelector("#viewing").value = viewingRecord;//為了傳到servlet
    	//}   
      //});
       
       
       
     
        
    </script>
</body>

</html>