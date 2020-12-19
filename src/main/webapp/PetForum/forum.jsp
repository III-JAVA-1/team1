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
    
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   
  </head>
  <body style="background-image: url(image/bg.jpg);">
<%--   <jsp:include page="Header.jsp"/> --%>
  
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
           <a style="border-color:#39C;" href="#" onclick="getForum('全部'); return false"><img src="image/Home_logo.png"/></a>
           <!-- 按下後呼叫getForum(this)，把this(這個按鈕) 的val傳到function(固定用this取)-->
            <a style="border-color:#ccc" href="#" onclick="getForum('協尋'); return false">走失協尋</a>
            <a style="border-color:#39C;" href="#" onclick="getForum('送養');">汪喵送養</a>
            <a style="border-color:#ccc;" href="#" onclick="getForum('日常'); return false">汪喵日常</a>
            <a style="border-color:#39C;" href="#" onclick="getForum('主題'); return false">版主討論</a>
            <a style="border-color:#ccc;" href="#" onclick="getForum('徵友'); return false">汪喵徵友</a>
            <a style="border-color:#39C;" href="#" onclick="getForum('心得'); return false">心得分享</a>
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


<!--Featured-->
<div>
    <div class="row">
    <div class="col-10 col-sm-9 col-xl-9 forum-col" id="main_wrapper">
        <div id="body">
            <div class="db_line1">
                <div class="db_line1_left ">
                    <div class="db_line1_featured">
                        <h5>精選文章</h5>
                        <hr/>
                        <div class="direction last-post-col">
                        <span><a href="#"><</a></span>
                        <span><a href="#">></a></span>
                        </div>                    
                    </div>
                <div class="db_line1_featured2">
                    <div class="imag">
                        <a href="#"><img src="image/featured_img1.jpg" /></a>
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
<!--end of Featured-->

<!--Selection-->              
               
                    <div class="db_line1_select">
                        <select style="color: #666">
                            <option>最新回覆</option>
                            <option>最新發佈</option>
                        </select>
                    </div>
                    <div class="db_line1_pagination">
                        <div class="pagination">
                            <span><a href="#">&laquo;</a></span>
                            <span><a href="#">1</a></span>
                            <span><a href="#">2</a></span>
                            <span><a href="#">3</a></span>
                            <span><a href="#">4</a></span>
                            <span><a href="#">5</a></span>
                            <span><a href="#">&laquo;</a></span>
                            <span><a href="#">20</a></span> 
                        </div>
                    </div> 
                
<!--end of Selection--> 
                
<!--Table-->
                <div class="db_line1_table"> 
                        <table class="tb1"> 
                            <thead>                           
                            <tr>
                                <th>主題</th>
                                <th style="width:10%">回應</th>
                                <th style="width: 10%;">瀏覽</th>
                                <th style="width: 20%;">發佈時間</th>
                            </tr> 
                            </thead>
                            <tbody id="article" >
							<!-- AJAX -->
                            </tbody>                            
                        </table>
                    </div>
<!--end of Table-->
<!--pagination-->
            <div class="db_line1_pagination">
                <div class="pagination">
                    <span><a href="#">&laquo;</a></span>
                    <span><a href="#">1</a></span>
                    <span><a href="#">2</a></span>
                    <span><a href="#">3</a></span>
                    <span><a href="#">4</a></span>
                    <span><a href="#">5</a></span>
                    <span><a href="#">&laquo;</a></span>
                    <span><a href="#">20</a></span> 
                </div>
            </div> 

            <div class="db_line1_release">
                <span class="db_line1_release_span"><a href="#">我要發佈</a></span>
            </div>
<!--end of pagination-->


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
<button type="button" class="btn btn-outline-primary" id="gotop"></button>
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
 	
	$().ready(function(){
		//網頁ready文檔加載完就做
		//網頁onload全部加載完成才做(音樂、圖片) 				
	
		$.ajax({
			url:"../petforum/selectAll",
			type:"post",		
			dataType:"json",
			data:{
				"forumId":"全部"
			},
			success:function(data){					
				$("#article").html("");
				$.each(data,function(i,n){
					
					$("#article").append("<tr>"+
					"<td><h5><a class='table_h5_a' href='postDetail.jsp?posterUid="+n[5]+"'>"+n[0]+"</a></h5></td>"+
					"<td><div>"+n[1]+"</div></td>"+
					"<td>"+n[2]+"</td>"+
					"<td><div><a class='table_h5_a' href=''>"+n[3]+"</a></div>"+
					"<div>"+n[4]+"</div></td>"+
					"</tr>");
				})
			},
			error:function(){
				$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>")
			}
		})
	});	
 	
//========================================================================
		function getForum(item){//參數來自button的value(固定用item接)			
		$("#article").html("");
		//console.log(item);
		$.ajax({
			url:"../petforum/selectForum",
			type:"post",		
			dataType:"json",
			data:{
				"forumId":item,//forumId取得按鈕傳來的值傳到@Controller
			},
			success:function(data){	
				$("#article").html("");
			
				$.each(data,function(i,n){
					
					$("#article").append("<tr>"+
					"<td><h5><a class='table_h5_a' href='postDetail.jsp?posterUid="+n[5]+"'>"+n[0]+"</a></h5></td>"+
					"<td><div>"+n[1]+"</div></td>"+
					"<td>"+n[2]+"</td>"+
					"<td><div><a class='table_h5_a' href=''>"+n[3]+"</a></div>"+
					"<div>"+n[4]+"</div></td>"+
					"</tr>");
				})
			},
			error:function(){
				$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>")
			}
		})
		return false;
	}
		
		//==================================================================
			
		
 	</script>
  </body>
</html>