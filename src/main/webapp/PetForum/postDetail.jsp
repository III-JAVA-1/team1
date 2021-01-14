<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <title>汪喵討論區</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/article.css">
    <link rel="stylesheet" type="text/css" href="css/messageBoard.css">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	 <style>
      	html {
		    scroll-behavior: smooth
		}
      </style>
  </head>
  <body style="background-image: url(image/bg.jpg);">
  <jsp:include page="Header.jsp"/>
  
  
<!--Navbar-->
<div class="row">
    <div class="col-9 col-sm-9 col-xl-9" id="wrapper">
        <div id="header">
            <div class="hd_line1">
                <div class="hd_line1_logo">
                    <img src="image/petforum.png" width="60" height="40">
                </div>
                <div class="hd_line1_name">                
                    <h2 >汪喵討論區</h2>               
                </div>
               
            </div>            
        </div>
        <div class="hd_line2">
           <div class="hd_line2_a">
            <a style="border-color:#39C;" href="forum.jsp"><img src="image/Home_logo.png"/></a>
           <!-- 按下後呼叫getForum(this)，把this(這個按鈕) 的val傳到function(固定用this取)-->
          
            </div>
            <div class="hd_line2_banner"></div>
                   <img src="image/banner.png" width="100" height="60">
                   <img src="image/step.png" width="30" height="30">
                   <img src="image/step.png" width="30" height="30">                              
                   <img src="image/step01.png" width="30" height="30">
                   <img src="image/step.png" width="30" height="30">
                   <img src="image/step01.png" width="30" height="30">
            </div>
    </div>
    </div>
    </div>
    <!--end of Navbar-->

<!-- Breadcrumb Nav -->
<div class="row">
    <div class="col-9 col-sm-9 col-xl-9 forum-col" id="bread_wrapper">
    
        <ol class="breadcrumb">
            <li>
            <img src="image/broadcast.png"/>
            <marquee direction="right" width="800px" scrollamount="2" behavior="alternate">多了解毛孩一點、給牠最好的，陪我們一起慢慢變老…</marquee>
            </li>  
        </ol>
   
</div>
</div>        
<!---End of Breadcrumb Navbar-->


<!--Aticle-->
<div>
    <div class="row">
    	<div class="col-9 col-sm-9 col-xl-9 forum-col" id="main_wrapper">
        	<div id="body">
            	<div class="db_line1">
                	<div class="db_line1_left">
                	<!-- 	有登入才能看到此按鈕，假定訪客的u_Id=0 -->
					<%if(session.getAttribute("user") != null) {%>
					 <div class="db_line1_message">				
					    <span class="db_line1_message_span"><button type="button"  onclick="editComment();location.href='#editCommentInfo'" style='background-color:#666;color:white';">我要回覆</button></span>				
					</div>
					<%}%>
					
				<!-- 這邊一定要發GET請求才不會出trouble -->
			  <form action="<c:url value='/petforum/sendOriginalPost'/>" method="GET">
		           <div class="db_line1_release">
		           <!-- 獲取StringQuery的posterUid -->
		           <input type='hidden' value='<%=request.getParameter("posterUid") %>' name='posterUid'>
		           <!-- 獲取StringQuery的viewing -->
		           <input type='hidden' value='<%=request.getParameter("viewing") %>' name='viewing'>
		          <!-- 發文者才會看到按鈕 --> 
		         <%  
		         	if(session.getAttribute("user")!=null && session.getAttribute("user")!=""){
		        	 	if(session.getAttribute("user").toString().equals(request.getParameter("u_Id").toString())){ 
		           			out.print("<span class='db_line1_message_span'><button type='submit' style='background-color:#666;color:white';>修改文章</button></span>"); 
		               	}
		         	}
		          %>               
		          </div>
		        </form>
				
              
			          <!-- Article -->
			          <div id="article" class="db_line1_left_article">
			              <!-- AJAX整個文章資料顯示在這裡 --> 
			          </div>
			          <!-- end of Article -->
                
		          
         <hr/>    
<!--end of Aticle-->

<!--Message-->
 <div id="comment">
     <!-- AJAX整個留言資料顯示在這裡 --> 
 </div>
<!--end of Message-->    

<!-- 有登入才能看到此按鈕 -->
<%if(session.getAttribute("user") != null) {%>
 <div class="db_line1_message">				
    <span class="db_line1_message_span"><button type="button"  onclick='editComment()' style='background-color:#666;color:white';">我要回覆</button></span>				
</div>
<%}%>
	

<!-- editComment UI -->
<div id='editCommentInfo' style='display:none;'>
    <div class="bubbleContainer">		
	        <div class="bubbleBody">	                          
			 <form id="message" action="<c:out value="../petforum/commitComment"/>" method="POST">
			 	<div class="divForm">
				 	<input type="hidden" id="commentUpdatedtime" name="commentUpdatedtime"/>
				 	<input type="hidden" name="posterUid" value="<%=request.getParameter("posterUid")%>"/>
				 	<input type="hidden" name="u_Id" value="<%=request.getParameter("u_Id")%>"/>
		            <textarea id="commentContent" name="commentContent" placeholder="在這裡輸入...."></textarea>
	            </div>
				<button class="btnSendMessage" id="sendMessage" type="submit" form="message" onsubmit=return checkCommentContent(this)>送出留言</button>
	         </form>
	       </div>
 	</div>
</div>
<!-- end of editComment UI -->
</div>
</div> <!--db_line1_left-->

           
	           <div class="db_line1_right">
                <div class="db_line1_right_featured">
                    <h5 style="color:#666;text-align:left">好文專欄</h5>                            
                </div>
            <div id="randomArticle" class="db_line1_right_featured2">
			<!-- AJAx -->
            </div>
   
			</div>
		</div>	   
	</div>
</div>
    <!--Footer-->
<footer class="small bg-info">
    <div class="container">
    <ul class="list-inline mb-0">
        <li class="list-inline-item text-light">&copy; 2020 汪喵討論區</li>
        <li class="list-inline-item"><a href="#" class="text-light">Privacy Policy</a></li>
        </ul>
    </div>
</footer>
</div>
<button id="myBtn"><a href="#top" ><img src="image/icons8-upward-arrow-24.png"></a></button>
      
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->	  
	<!-- Bootstrap CSS -->  
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>  
	
	<script>		
//網頁ready文檔加載完就做
//網頁onload全部加載完成才做(音樂、圖片) 
loadArticle();//加載文章信息
loadComment();//加載留言信息
randomArticle();
		
function loadComment(){	
		$.ajax({
	url:"../petforum/viewComment",
	type:"POST",		
	dataType:"json",
	data:{
		"posterUid":<%=request.getParameter("posterUid")%>,
	},
	success:function(data){	
		$("#comment").html("");
		$.each(data,function(i,n){						
			console.log(n[0]);//u_Id				
			console.log(n[1]);//sname
		
			//初始資料沒有會員暱稱
			var memberSname;
			if(n[1] === undefined){
				memberSname = "Author Name";
			}
			else{
				memberSname = n[1];
			}
			
			//2F....
			var floor = (i+1)+1;
			//想辦法讓留言顯示時換行
			var comment = n[2].replace(/\n/g,'<br/>');
			
			//Member.u_Id,Member.sname,Comment.commentContent,Comment.commentUpdatedtime
			//顯示會員相關信息(顯示會員圖片發送另一個請求)+顯示留言相關信息					
			$("#comment").append("<div class='db_line1_left_article'>"+
			"<div id='member' class='article_left'>"+
			"<div class='article_left_img'>"+
			"<img id='imgshow' src='<c:url value='/petforum/getMemberImg?u_Id="+n[0]+"'/>'"+
			" style='border: 1px solid #666;border-radius: 15px;width: 120px;height: 120px;'  onerror='imgDisplay(this)'>"+
			"</div>"+
			"<div class='article_left_a'>"+
			"<a href='#'>"+memberSname+"</a><br/>"+
			"<span style='border-radius: 8px;background-color: #666;color: white'>"+floor+"F</span>"+
			"</div>"+
			"</div>"+
			"<div class='article_right'>"+
			"<div id='article' class='article_main'>"+
			"<div class='article_main'>"+
			"<div class='article_main_content'>"+comment+
			"</div>"+
			"</div>"+					
			"<div>"+
			"<span style='font-size: 10px;'>"+n[3]+"</span>"+
			"</div>"+
			"</div>"+
			"</div>"+
			"</div>"+
			"<hr/>");				
			
		}) 
		
	},
		error:function(){
			$("#comment").append("<h2>"+"查無留言資料"+"</h2>")
		}
	})
}		
	
//=============================================================================================	
function loadArticle(){
 		$.ajax({
 			url:"../petforum/viewPost",
 			type:"POST",		
 			dataType:"json",
 			data:{
 				"posterUid":<%=request.getParameter("posterUid")%>,	
 				"u_Id":<%=request.getParameter("u_Id")%>//發文者u_Id    			
 			},
 			success:function(data){    				
 				$("#article").html("");			
 				$.each(data,function(i,n){	
 					console.log(n[0]);//u_Id
 					console.log(n[5]);//content
 					console.log(n[2]);//header					
 					
 					//初始資料沒有會員暱稱
 					let memberSname;
 					if(n[1] === undefined){
 						memberSname = "Author Name";
 					}
 					else{
 						memberSname = n[1];
 					}
 					
 					
 					//想辦法讓文章顯示時換行
 					let content = n[5].replace(/\n/g,'<br/>');
 					
 					//Member.u_Id,Member.sname,Article.header,Article.updatedTime,Article.viewing,Article.content,Article.posterUid,ArticleFavorite.favoriteId
 					//顯示會員相關信息(顯示會員圖片發送另一個請求)+顯示文章相關信息
 					$("#article").append("<div class='article_left'>"+
 					"<div class='article_left_img'>"+
 					"<img id='imgshow' src='<c:url value='/petforum/getMemberImg?u_Id="+n[0]+"'/>'"+
 					" style='border: 1px solid #666;border-radius: 15px;width: 120px;height: 120px;'  onerror='imgDisplay(this)'>"+
 					"</div>"+
 					"<div class='article_left_a'>"+
 					"<a href='#'>"+memberSname+"</a><br/>"+
 					"<span style='border-radius: 8px;background-color: #666;color: white'>樓主</span>"+
 					"</div>"+
 					"</div>"+
 					" <div class='article_right'>"+
 					" <div class='article_main'>"+
 					"<h5 style='color:#666;'>"+n[2]+"</h5>"+
 					"<div class='article_main_span'>"+
 					"<span>"+n[3]+"</span>"+
 					"<span><img src='image/icons8-eye-50.png'/>&nbsp"+n[4]+"</span>"+
 					"<span><a id='ahref' onclick='favorites("+n[6]+"); return false;' href='#'><img id='fav' src='image/favorites_1.png'/></a></span>"+					
 					"<hr/>"+
 					" <div class='article_main_content'>"+
 					"<p>"+content+"</p>"+    					
 					"</div>"+
 					"</div>"+
 					"</div>"+
 					"</div>"+
 					"</div>"+
 					"<hr/>"); 
 					
 					if(n[7] != null){
 						$("#fav").attr("src","image/favorites_2.png");
 					}
 				})
 			},
 			error:function(){
 				$("#article").append("<h2>"+"查無文章資料"+"</h2>")
 			}
 		});
 	}
    	
 //==================================================================
    		
 function randomArticle(){
		$.ajax({
			url:"../petforum/randomArticle",
			type:"post",
			dataType:"json",
			success:function(data){
				$("#randomArticle").html("");
				$.each(data,function(i,n){
					
					let content;
					let posterUid = n[0];
					let u_Id = n[1];
					let header = n[2];
					if(header.length < 15){
						header = header.padEnd(15, ' ');
					}
					
					if(!n[3].includes('imgur')){
						content = "image/hidden.png";					
					}
					else{
						content = n[3].substring(n[3].indexOf('https'), n[3].indexOf(".jpg"));
						content = content+".jpg";
						console.log("456"+content);
					}			
					
					$("#randomArticle").append("<div class='imag'>"+
					"<a href='http://"+window.location.host+"/PetProject_Final/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+u_Id+"'>"+
					"<img src="+content+" width=80px height=80px/></a><br/>"+
					"<a href='http://"+window.location.host+"/PetProject_Final/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+u_Id+"'>"+header.substring(0,14)+"</a>"+
					"</div>");
		            
					//a.posterUid, a.u_Id, a.header, a.content
				});			
			},
			error:function(){				
				$("#randomArticle").append("查無資料");				
		}
	});
}
    	
//============================================================================

let now = new Date();//取得當前時間，此時間格式無法順利轉成timeStamp型態
let date = getTimeStamp(now);//透過function處理轉換成可以順利轉型成timeStamp的時間字串 

let commentContentObj = document.getElementById("commentContent");
   commentContentObj.addEventListener("click",function(){
       document.getElementById("commentUpdatedtime").value = date;
   });
    

   function getTimeStamp(now) {
   return (now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + (now.getDate())  + " " + 
   now.getHours() + ':' + ((now.getMinutes() < 10) ? ("0" + now.getMinutes()) : (now.getMinutes())) + ':' +
   ((now.getSeconds() < 10) ? ("0" + now.getSeconds()) : (now.getSeconds())));
 
 }
		
		
//	若會員沒上傳頭像，則顯示預設圖片
 function imgDisplay(noUpload) 
  { 
 	$(noUpload).attr("src","image/mask_dog.png");
  }		
		
//	顯示編輯留言的介面
let editCommentDisplay = 0;
  	function editComment(){
  	
  	if(editCommentDisplay == 0){
  		$("#editCommentInfo").css("display","");editCommentDisplay = 1;
  	}else{
  		$("#editCommentInfo").css("display","none");editCommentDisplay = 0;
  	}    	
  }
  	
 
  	
//留言內容不可為空
 $("#sendMessage").click(function checkCommentContent(form){
 		
 	if($("#commentContent").val() != ""){ 
 		return true;//傳送form
	 }	 
	else{		
	 Swal.fire({
  	      		  title: '留言內容不可為空！',
  	      		  icon: 'error',
  	      		  confirmButtonText: '確定'
  	      		})
	 return false;
	 }  		
 })  	
    	
//=========================================================================== 	
   

//讀取會員是否有將此文章加入最愛	
function favorites(item){
	
	<%if(session.getAttribute("user") == null){%>
		Swal.fire({
      		  title: '請登入！',
      		  icon: 'error',
      		  confirmButtonText: '確定'
      		})
		return;
	<%}%>
			
			$.ajax({
  			url:"../petforum/searchFavoriteRecord",
  			type:"POST",		
  			dataType:"json",
  			data:{
  				"posterUid":item,				
  			},
  			success:function(data){   				 					
  			console.log("isFavorite="+data);
  			
   			if(data){
   				$("#fav").attr("src", "image/favorites_2.png");
   			}
   			else{
   				$("#fav").attr("src", "image/favorites_1.png");
   			}
  			},
  			error:function(){    				
  				 Swal.fire({
 	      		  title: '查無收藏紀錄！',
 	      		  icon: 'oops',
 	      		  confirmButtonText: '確定'
 	      	})
  		}
	});	
} 	        
	   
	</script>
  </body>
</html>