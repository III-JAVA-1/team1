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
  <body>
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
                <a href="/index.html"><img src="image/Home_logo.png"/></a>
                <a style="border-top-color:#ccc" href="#">走失協尋</a>
                <a style="border-top-color:#39C" href="#">汪喵送養</a>
                <a style="border-top-color:#ccc" href="#">汪喵日常</a>
                <a style="border-top-color:#39C" href="#">版主討論</a>
                <a style="border-top-color: #ccc" href="#">輕鬆閒聊</a>
                <a style="border-top-color: #39C" href="#"> 心得分享</a>
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
                    <span class="db_line1_message_span"><a href="#">我要回覆</a></span>
                </div>

 <!--Member-->               
                
                <div class="db_line1_left_article">
                    <div class="article_left">
                        <div class="article_left_img">
                        <img src="image/mask_dog.png" width="150px" height="150px" style="border:1px solid #666;border-radius: 15px;">
                        </div>
                        <div class="article_left_a">
                        <a href="#">Author Name</a><br/>
                        <span style="border-radius: 8px;background-color: #666;color: white">樓主</span>
                        </div>                        
                    </div>

 <!--end of Member-->  
                    <div class="article_right">
                        <div class="article_main">
                            <h5>二哈有夠胖，有推薦什麼方式減重？</h5>
                            <div class="article_main_span">                               
                                <span>2020-11-24 21:59</span>
                                <span><img src="image/icons8-eye-50.png"/>&nbsp0</span>
                                <span><a href="#"><img src="image/icons8-applause-32.png"/></a>&nbsp0</span>
                                <span><a href="#"><img src="image/icons8-favorites-50.png"/></a>&nbsp0</span> 
                               <hr/>
                               <div class="article_main_content">
                                家裡養了一隻很會拆家的二哈<br>
                                活動量雖然頗大<br>
                                但一直胖下去 覺得不能再這樣<br>
                                想問問大家都怎麼幫胖哈減重？<br>                                
                               </div>                              
                            </div>
                        </div>                       
                    </div>
                </div>
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
    <span class="db_line1_message_span"><a href="#">我要回覆</a></span>
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
  </body>
</html>