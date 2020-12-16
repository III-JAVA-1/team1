<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
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
   
<jsp:include page="Header.jsp"/>
    
 <!-- 討論區導覽列 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">        
        <a href="<c:url value='/petforum/selectForum/all'/>" style="color:white;"><img src="<c:url value='/images/petforum.png'/>" width="50"
                    alt="">汪喵討論區</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor01" style="font-weight: bold">
          <ul class="navbar-nav mr-auto">              
            <li class="nav-item" id="lookfor"><!--超連結到自己的頁面，觸發了傳遞參數的動作forumId=lookfor -->
             <a class="nav-link" href="<c:url value='/petforum/selectForum/lookfor'/>" >走失協尋</a>
            </li>  
            <li class="nav-item" id="adopt">
             <a class="nav-link" href="<c:url value='/petforum/selectForum/adopt'/>" >汪喵送養</a>
            </li>
            <li class="nav-item" id="life">
              <a class="nav-link" href="<c:url value='/petforum//selectForum/life'/>" >汪喵日常</a>
            </li> 
            <li class="nav-item" id="friend">
              <a class="nav-link" href="<c:url value='/petforum/selectForum/friend'/>" >汪喵徵友</a>
            </li>                       
            <li class="nav-item" id="easyTalk">
              <a class="nav-link" href="<c:url value='/petforum/selectForum/easyTalk'/>" >輕鬆閒聊</a>
            </li>
            <li class="nav-item" id="share">
              <a class="nav-link" href="<c:url value='/petforum/selectForum/share'/>" >心得分享</a>
            </li>
            <li class="nav-item" id="topic">
              <a class="nav-link" href="<c:url value='/petforum/selectForum/topic'/>" >汪喵主題聊聊</a>
            </li>              
          </ul>     
          
        </div>
        	<form action="<c:url value='/petforum/selectHeader'/>" method="POST" onsubmit="return search()">
            <input type="text" placeholder="找文章名稱" name="inputText" id="inputText">
            <button class="btn btn-secondary" type="submit" >搜尋</button>
            </form>   
      </nav>
   <!-- 討論區導覽列 -->
    <hr>    	
       
    	<!-- 修改文章要驗證會員id是否一致 -->
    	<div class="container">
    	<div class="col-12">
    	<%--接收參數來自lookforPet.jsp --%>

				<div class='media'>
				<div class='media-body'>
					<img src="<c:out value='${article.getMember().getImg()}'></c:out>" class='align-self-start mr-3' style='width:100px; height:100px;' alt='...'>
					<p><c:out value="${article.getMember().getU_Id()}"></c:out>
					<c:out value=" "></c:out>
					<c:out value="${article.getUpdatedTime()}"></c:out></p>
					<p><c:out value="${article.getHeader()}"></c:out></p>
					<p><c:out value="${article.getContent()}"></c:out></p>
					
					<c:set var="sessionUid" scope="request" value="${session.getAttribute('user').toString()}"></c:set>	
					<c:set var="uid" scope="request" value="${article.getMember().getU_Id().toString()}"></c:set>	
					<c:if test="${sessionUid != null && sessionUid.equals(uid)}">
						<!-- 發送/petform/edit/{posterUid} 請求-->
						<form action="<c:url value='/petforum/edit/${article.getPosterUid()}'></c:url>">
							<button type='submit' class='btn btn-primary' value='修改文章'></button>
						</form>
					</c:if> 
				</div>
				</div>
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
   
     
   
    </script>
</body>

</html>