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

.tb1 {     
            border: 1px solid	#0080FF;
            border-collapse: collapse;
        }

td,
th {
    border: 1px solid #0080FF;    
}

th{
	color: white;
	background-color: #0080FF;
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
        <a href="lookforPet.jsp?forumId=all" style="color:white;"><img src="Images/petforum.png" width="50"
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
            <li class="nav-item" id="friend">
              <a class="nav-link" href="lookforPet.jsp?forumId=friend" >汪喵徵友</a>
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
        	<form action="lookforPet.jsp" method="POST" onsubmit="return search()">
            <input type="text" placeholder="找文章名稱" name="inputText" id="inputText">
            <button class="btn btn-secondary" type="submit" >搜尋</button>
            </form>   
      </nav>
   <!-- 討論區導覽列 -->
    
    <header>
    <br>
        <div>
        <!--Pagination-->
            <ul class="pagination justify-content-end active">
                <li class="page-item disabled">
                    <a class="page-link" href="#">&laquo;</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                </li>
                <!--我要發表(登入驗證)-->
           <form action="/PetProject/petforum/editArticle.jsp" method="POST" onsubmit="return loginStatus()">              
            <button type="submit" class="btn btn-primary" id="ckRelease">我要發表</button>
          </form>
            </ul>
            
        </div>
         </header>
		
        <!--看板欄-->
        <!-- j s p code -->    
      
    	
    	
    	<div class="container">
    	<div class="col-12">
    	<table class="col-12 tb1">
            <tr class="row-12" style="text-align: center;">
                <th>文章標題</th>
                <th style="width:50px">子版</th>
                <th>文章內容</th>
                <th>發表時間</th>
                <th style="width:40px">瀏覽</th>
                <th style="width:40px">留言</th>
                <th style="width:60px">發文者</th>               
            </tr>
        
	
	<%--接收參數--%>
	<% 	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	
		
		ArticleService service = new ArticleService();
		String hql = "FROM ArticleBean";
	   		
		
			if(request.getParameter("forumId")!=null && request.getParameter("forumId")!=""){
				
				if(request.getParameter("forumId").equals("all")){
					hql = "FROM ArticleBean";
				}
				else if(request.getParameter("forumId").equals("lookfor")){
					
					hql = "FROM ArticleBean a where a.forumId like'%協尋%' ";  
				}
				else if(request.getParameter("forumId").equals("adopt")){
					hql = "FROM ArticleBean a where a.forumId like '%送養%'";
				}
				else if(request.getParameter("forumId").equals("life")){
					hql = "FROM ArticleBean a where a.forumId like '%日常%'";
				}
				else if(request.getParameter("forumId").equals("friend")){
					hql = "FROM ArticleBean a where a.forumId like '%徵友%'";
				}
				else if(request.getParameter("forumId").equals("easyTalk")){
					hql = "FROM ArticleBean a where a.forumId like '%閒聊%'";
				}
				else if(request.getParameter("forumId").equals("share")){
					hql = "FROM ArticleBean a where a.forumId like '%心得%'";
				}
				else if(request.getParameter("forumId").equals("topic")){
					hql = "FROM ArticleBean a where a.forumId like '%主題%'";
				}
				
			}
			else if(request.getParameter("inputText")!=null && request.getParameter("inputText")!="")
			{
				String inputText = "'%"+request.getParameter("inputText").toString()+"%'";
				hql = "FROM ArticleBean a where a.header like" + inputText;
				System.out.print(hql);
			}
			
			System.out.println(hql);
			List<ArticleBean> allArticles = service.getAllArticles(hql);
			
			for(ArticleBean article: allArticles){
				System.out.println(article.getForumId());
		%>				
			 <%
			 	out.print("<tr>");
				out.print("<td>"+article.getHeader());
				out.print("</td>");
				out.print("<td>"+article.getForumId());
				out.print("</td>");
				if(article.getContent().length()>=20){
				out.print("<td>"+article.getContent().substring(0,20));
				}
				
				out.print("<a href='postDetail.jsp?posterUid="+article.getPosterUid()+"'>...繼續閱讀</a>");//click事件
				out.print("</td>");
				out.print("<td>"+article.getUpdatedTime());
				out.print("</td>");
				out.print("<td>"+article.getViewing());
				out.print("</td>");
				out.print("<td>"+article.getReply());
				out.print("</td>");
				out.print("<td>"+article.getMemberId());
				out.print("</td>");
				out.print("</tr>");	
				
				//System.out.println("<a href='postDetail.jsp?posterUid="+rs.getInt("poster_uid")+"'>繼續閱讀</a>");
            }%>
    			
			<% System.out.print(session.getAttribute("user")); %>
    	</table>
    	<br>
    	</div>
        </div><!-- container -->
        
        <%-- System.out.println("<a href='postDetail.jsp?posterUid="+rs.getInt("poster_uid")+"'>繼續閱讀</a>");
        	點擊此超連結轉頁面到postDetail.jsp，觸發傳遞參數過去posterUid=1--%>


    <!--Pagination-->
    <ul class="pagination justify-content-center active">
        <li class="page-item disabled">
            <a class="page-link" href="#">&laquo;</a>
        </li>
        <li class="page-item active">
            <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">4</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">5</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">&raquo;</a>
        </li>
       
    </ul>

   
    <button type="button" class="btn btn-outline-primary" id="gotop"></button>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script>
    	function loginStatus(){
    		<% if(session.getAttribute("user") == null){%>
    		//window.alert("請登入！");
    		return true;//不管有無登入
    		<%}else{%>return true;<%}%>
    	}
		 
    	function search(){
    		if(document.getElementById("inputText").value=="")
    		{
    			window.alert('請輸入搜尋名稱');
    			return false;
    		}
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