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
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
                <div class="searchBox">
                    <input class="searchInput"type="text" name="" placeholder="搜尋文章標題....">
                    <button class="searchButton" href="#">
                        <i class="material-icons">
                            <img src="image/icons8-search-24.png">
                        </i>
                    </button>
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
            <li><a href="#">Home</a></li>
            <li><a href="#">2013</a></li>
            <li class="last-post-col active">十一月</li>
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

                <div class="db_line1_message">
				<form action="<c:url value='/petforum/newArticle'/>" method="POST" onsubmit="return loginStatus()">
				    <span class="db_line1_message_span"><button type="submit"  style='background-color:#666;color:white';">我要回覆</button></span>
				</form> 
				</div>

 <!--Member-->               
                
                <div class="db_line1_left_article">
                    <div id="member" class="article_left">
                       <!-- AJAX會員資料顯示在這裡 -->                       
                    </div>

 <!--end of Member-->  
                    <div class="article_right">
                        <div id="article" class="article_main">
                      <!-- AJAX文章資料顯示在這裡 -->
                        </div>                       
                    </div>
                </div>
            
          <form action="<c:url value='/petforum/sendOriginalPost'/>" method="GET">
            <div class="db_line1_release">
            <!-- 獲取StringQuery的posterUid -->
            <input type='hidden' value='<%=request.getParameter("posterUid") %>' name='posterUid'>
           <!-- 發文者才會看到按鈕 --> 
         <%
         if(session.getAttribute("user").toString().equals(request.getParameter("u_Id").toString())){ 
      		out.print("<button type='submit' class='btn btn-secondary' id='ckRelease'>我要修改</button> "); 
         }
         %>             
            </div>
          </form>
         <hr/>    
<!--end of Aticle-->

 <!--Member-->  
<div class="db_line1_left_article">
    <div class="article_left">
        <div class="article_left_img">
        <img src="image/mask_dog.png" width="150px" height="150px" style="border:1px solid #666;border-radius: 15px;">
        </div>
        <div class="article_left_a">
        <a href="#">Author Name</a><br/>
        <span style="border-radius: 8px;background-color: #666;color: white">2F</span>
        </div>                        
    </div>
 <!--end of Member-->  
<!--Message-->
    <div class="article_right">
        <div class="article_main">            
               <div class="article_main_content">
                飼料減半....<br>
                早 / 晚 / 睡前 帶出去遛遛 兼做運動...<br>
                幫不了你<br>           
               </div>
            </div>
            <div>
                <span style="font-size: 10px;">2020-11-24 21:59</span>
            </div>                       
        </div>
    </div>
    <hr/>    
<!--end of Message-->    
<div class="db_line1_message">
<form action="<c:url value='/petforum/newArticle'/>" method="POST" onsubmit="return loginStatus()">
    <span class="db_line1_message_span"><button type="submit"  style='background-color:#666;color:white';">我要回覆</button></span>
</form> 
</div>

</div>
</div> <!--db_line1_left-->

            
            <div class="db_line1_right">
                <div class="db_line1_right_featured">
                    <h5>版主主題討論</h5>                            
                </div>
            <div class="db_line1_right_featured2">
                <div class="imag">
                    <a href="#"><img src="image/featured_img1.jpg"/></a>
                    <br/><a href="#">美麗的寵物</a>
                </div>
                <div class="imag" style="padding: 0px 8px">
                    <a href="#"><img src="image/featured_img2.jpg" /></a>
                    <br/><a href="#">美麗的寵物</a>
                </div>
                <div class="imag">
                    <a href="#"><img src="image/featured_img3.jpg" /></a>
                    <br/><a href="#">美麗的寵物</a>
                </div>       
            </div>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	
	<script>
		
		//網頁ready文檔加載完就做
		//網頁onload全部加載完成才做(音樂、圖片) 				
		
		$.ajax({
			url:"../petforum/viewPost",
			type:"POST",		
			dataType:"json",
			data:{
				"posterUid":<%=request.getParameter("posterUid")%>,				
			},
			success:function(data){	
					console.log(data.member.u_Id);
					console.log(data.content);
					console.log(data.header);
					//console.log(data.member.sname);
					//console.log(data.member.img);
					
					//初始資料沒有會員暱稱
					var memberSname;
					if(data.member.sname === undefined){
						memberSname = "Author Name";
					}
					else{
						memberSname = data.member.sname
					}
					
					
					//顯示會員相關信息(顯示會員圖片發送另一個請求)
					$("#member").append("<div class='article_left_img'>"+
					"<img id='imgshow' src='<c:url value='/petforum/getMemberImg?u_Id="+data.member.u_Id+"'/>'"+
					" style='border: 1px solid #666;border-radius: 15px;width: 150px;height: 150px;'  onerror='imgDisplay(this)'>"+
					"</div>"+
					"<div class='article_left_a'>"+
					"<a href='#'>"+memberSname+"</a><br/>"+
					"<span style='border-radius: 8px;background-color: #666;color: white'>樓主</span>"+
					"</div>");
					
					
					//讀取會員是否有將此文章加入最愛
					if(data.articleFavorites.favoriteId != null){
						$("#fav").css("background-color", "red");
					}
					else{
						$("#fav").css("background-color", "transparent");
					}
					
					//想辦法讓文章顯示時換行
					var content = data.content.replace(/\n/g,'<br/>');
					
					//顯示文章相關信息
					$("#article").append("<h5>"+data.header+"</h5>"+
					"<div class='article_main_span'>"+
					"<span>"+data.updatedTime+"</span>"+
					"<span><img src='image/icons8-eye-50.png'/>&nbsp"+data.viewing+"</span>"+
					" <span id='fav'><a href='#'><img src='image/icons8-favorites-50.png'/></a></span>"+					
					"<hr/>"+
					" <div class='article_main_content'>"+
					"<p>"+content+"</p>"+
					"<img id='petShow' src='<c:url value='/petforum/getPetPic?posterUid="+data.posterUid+"'/>'"+
					" style='width: 600px;'>"+
					"</div>"+
					"</div>");			
			},
			error:function(){
				$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>")
			}			
			
		})
		
		//	若會員沒上傳頭像，則顯示預設圖片
		 function imgDisplay(noUpload) 
		  { 
		 	$(noUpload).attr("src","image/mask_dog.png");
		  } 
		

	</script>
  </body>
</html>