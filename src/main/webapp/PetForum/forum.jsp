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
            <a href="forum.jsp"><img src="image/Home_logo.png"/></a>
            <a style="border-top-color:#ccc" href="forum.jsp?forumKey=lookfor">走失協尋</a>
            <a style="border-top-color:#39C" href="forum.jsp?forumKey=adopt">汪喵送養</a>
            <a style="border-top-color:#ccc" href="forum.jsp?forumKey=life">汪喵日常</a>
            <a style="border-top-color:#39C" href="forum.jsp?forumKey=discuss">版主討論</a>
            <a style="border-top-color: #ccc" href="forum.jsp?forumKey=friend">汪喵徵友</a>
            <a style="border-top-color: #39C" href="forum.jsp?forumKey=share"> 心得分享</a>
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
                            <tbody>
                            <tr>
                                <td>
                                <h5><a class="table_h5_a" href="#">文章標題</a></h3>                                  
                                </td>
                                <td>
                                    <div>8</div>
                                </td>
                                <td>30</td>
                                <td>                                        
                                    <div><a class="table_h5_a" href="#">Author Name</a></div>
                                    <div> 11 Nov 2019, 16:11</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <h5><a class="table_h5_a" href="#">文章標題</a></h3>                                  
                                    </td>
                                    <td>
                                        <div>8</div>
                                    </td>
                                    <td>30</td>
                                    <td>                                        
                                        <div><a class="table_h5_a" href="#">Author Name</a></div>
                                        <div> 11 Nov 2019, 16:11</div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                <h5><a class="table_h5_a" href="#">文章標題</a></h3>                                  
                                    </td>
                                    <td>
                                        <div>8</div>
                                    </td>
                                    <td>30</td>
                                    <td>                                        
                                        <div><a class="table_h5_a" href="#">Author Name</a></div>
                                        <div> 11 Nov 2019, 16:11</div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                <h5><a class="table_h5_a" href="#">文章標題</a></h3>                                  
                                    </td>
                                    <td>
                                        <div>8</div>
                                    </td>
                                    <td>30</td>
                                    <td>                                        
                                        <div><a class="table_h5_a" href="#">Author Name</a></div>
                                        <div> 11 Nov 2019, 16:11</div>
                                    </td>
                                </tr>
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
 
  </body>
</html>