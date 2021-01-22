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
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">  
    <link rel="stylesheet" type="text/css" href="css/slider.css">     
    
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
                <img class="" src="image/petforum.png" width="60" height="40">
            </div>
            <div class="hd_line1_name">                
                <h2>汪喵討論區</h2>               
            </div>           
        </div>        
        	 <div class="searchBox">
                <input class="searchInput" type="text" id="inputText" placeholder="搜尋文章標題....">
                <button class="searchButton" type="submit" onclick=goAjax()>
                    <i class="material-icons">
                        <img src="image/icons8-search-24.png">
                    </i>
                </button>
            </div>                    
    </div>
    <div class="hd_line2">
           <div class="hd_line2_a">
           <a class="scroll" style="border-color:#39C;" href="#scrollHere" onclick="getForum('全部'); "><img src="image/Home_logo.png"/></a>
           <!-- 按下後呼叫getForum(this)，把this(這個按鈕) 的val傳到function-->
            <a class="scroll" style="border-color:#ccc" href="#scrollHere" onclick="getForum('協尋'); ">走失協尋</a>
            <a class="scroll" style="border-color:#39C;" href="#scrollHere" onclick="getForum('送養');">汪喵送養</a>
            <a class="scroll" style="border-color:#ccc;" href="#scrollHere" onclick="getForum('日常');">汪喵日常</a>
            <a class="scroll" style="border-color:#39C;" href="#scrollHere" onclick="getForum('聊天');">寵物聊天</a>
            <a class="scroll" style="border-color:#ccc;" href="#scrollHere" onclick="getForum('徵友'); ">汪喵徵友</a>
            <a class="scroll" style="border-color:#39C;" href="#scrollHere" onclick="getForum('心得'); ">心得分享</a>
            </div>
            <div class="hd_line2_banner">
                 <img src="image/banner.png" width="100" height="60">                 
                 <img src="image/step.png" width="30" height="30"> 
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
        	<img src="image/broadcast.png"/>
            <marquee direction="right" width="800px" scrollamount="2" behavior="alternate">多了解毛孩一點、給牠最好的，陪我們一起慢慢變老…</marquee>         
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
                        <h5>熱門文章</h5>
                        <hr/>
                        <div class="direction last-post-col">
                        <span><img src="image/petCare.png"/></span>                        
                        </div>                    
                    </div>
                <div class="db_line1_featured2">                
                <!-- slider start -->
                      <div class="slider">
			          <ul id="imgContent" style="display:inline;">
						<!-- AJAX -->
			          </ul>
			        <div class="controller">
			          	<div class="prev-btn btns">
			            <i class="fas fa-angle-left fa-3x"></i>
			          	</div>
			          <div class="indicator">
			            <span id="active"></span>
			            <span></span>
			            <span></span>
			          </div>
			          <div class="next-btn btns">
			            <i class="fas fa-angle-right fa-3x"></i>
			          </div>
			        </div>
			         <div style="margin-top: 10px;" id="articleHeader">
				<!--AJAX -->
              	  	</div>
				  </div>
				      <!-- end of slider -->				     
                </div>
                
<!--end of Featured-->

<!--Selection-->         		
                    
                    
        <div class="db_line1_pagination" style="margin-top:30px;">
            <div class="db_line1_select">
            	<div id="scrollHere" style="display:inline;background-color:#ccc;border-radius:15px;">
				    <a class="scroll" style="border-color:#39C;" href="#table" onclick="getForum('全部'); ">🏠</a>             
					/ <span id="whichForum"style="color:red"></span>
				</div>                
                <select id="selector" style="color: #666;margin-left:30px;" onchange=selectOptions()>
                    <option>最新發佈</option>
                    <option>最新回覆</option>
                </select>	                   
            </div>         
          <!-- 有登入才能看到此按鈕 -->
            <div class="db_line1_release">
				 <form action="<c:url value='/petforum/newArticle'/>" method="POST" onsubmit="return loginStatus()">
				    <span class="db_line1_message_span"><button type="submit"  style='background-color:#666;color:white';">我要發表</button></span>
				</form>
            </div>
       </div>
<!--end of Selection--> 
                
<!--Table-->
            <div id="table" class="db_line1_table"> 
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
                <div id="page" class="pagination" style="margin-bottom:10px;">
				<!-- 自動生成分頁 -->
                </div>
               
            </div> 
            <!-- 有登入才能看到此按鈕 -->		   
            <div class="db_line1_release">
			 <form action="<c:url value='/petforum/newArticle'/>" method="POST" onsubmit="return loginStatus()">
			    <span class="db_line1_message_span"><button type="submit"  style='background-color:#666;color:white';">我要發表</button></span>
			</form>            
            </div>
          
           </div>
            
<!--end of pagination-->


        </div> <!--db_line1_left-->

            
          <div class="db_line1_right">
            <div class="db_line1_right_featured">
                <h5>好文專欄</h5>                            
            </div>
            <div id="randomArticle" class="db_line1_right_featured2">
			<!-- AJAx -->
            </div>
            
            <div style="background-color:#FFD306; border-radius:15px;height:120px;width:280px;padding:10px;text-align:center;">
	            <span>汪喵冷知識，準備好一探究竟了嗎？</span>
	            <button id="enter" type="button" class="btn btn-outline-success" onclick="QandA()">來去瞧瞧</button><br>
	            <img src="image/dog.png">
	            <img src="image/forest.png">
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
	  
	<!-- Bootstrap CSS -->  
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	    
 	<script> 	
let page = 1;
 
function selectAll(){		

	$.ajax({
		url:"../petforum/selectAll",
		type:"POST",		
		dataType:"json",
		data:{
			"forumId":"全部",
			"page":page
		},
		success:function(arr){					
			$("#article").html("");				
			
			showPagination(arr);				
			articleElementAppend(arr);
			
		},
		error:function(){
			$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>")
		}
	})
}	

//load 全部文章(分頁)

selectAll();
getHighestViewing();
randomArticle();
		
//========================================================================	
//只顯示Top1文章
function getHighestViewing(){

	$.ajax({
		url:"../petforum/highestViewing",
		type:"GET",		
		dataType:"json",			
		success:function(data){
			$("#articleHeader").html("");
			$("#imgContent").html("");
			
			let posterUid = data[0][0];
			let u_Id = data[0][1];
			let header = data[0][2];				
			let content;
			
			if(!data[0][3].includes('imgur')){
				content = "image/hidden.png";					
			}
			else{
				content = data[0][3].substring(data[0][3].indexOf('https'), data[0][3].indexOf(".jpg"));
				content = content+".jpg";					
			}			
			
			$("#imgContent").append(
			"<li><img src="+content+" width=416px height=234px /></li>"					
			);
			
			 $("#articleHeader").append(
						"<p><a style='text-decoration:none;' href='http://"+window.location.host+"/PetProject_Final/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+u_Id+"'>"+header+"</a></p>"					
					);	
			
		},
		error:function(){
			$("#imgContent").append("查無資料");				
		}
	})

}
//========================================================================	
//根據切換電視牆顯示前Top3文章	
let lastSlideIndex = 2; 	
let firstSlideIndex = 0;
	
function getHighestViewingHeader(){
	
	$.ajax({
		url:"../petforum/highestViewingHeader",
		type:"GET",		
		dataType:"json",			
		success:function(data){				
			$("#articleHeader").html("");
			$("#imgContent").html("");
			
			let posterUid = data[firstSlideIndex][0];
			let u_Id = data[firstSlideIndex][1];
			let header = data[firstSlideIndex][2];
			let str = data[firstSlideIndex][3];
			let content;
			
			if(!str.includes('imgur')){
				content = "image/hidden.png";						
			}
			else{
				content = str.substring(str.indexOf('https'), str.indexOf(".jpg"));
				content = content+".jpg";				
			}			
			
			$("#imgContent").append(
			"<li><img src="+content+" width=416px height=234px /></li>"					
			);
			
		    $("#articleHeader").append(
				"<p><a style='text-decoration:none;' href='http://"+window.location.host+"/PetProject_Final/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+u_Id+"'>"+header+"</a></p>"					
			);	
			
		},
		error:function(){				
			$("#articleHeader").append("查無資料");
			$("#imgContent").append("查無資料");
		}
	})
}

//電視牆切換	
function show(){
    let move = 0-(416*firstSlideIndex);       
}	

$(".prev-btn").click(function(){
	firstSlideIndex--;//往前一張索引減1
    if(firstSlideIndex<0)firstSlideIndex=lastSlideIndex;//索引不可能有-1，所以當索引小於0就等於最後一張的索引值
    
    show();
    getHighestViewingHeader();
});

$(".next-btn").click(function(){
	firstSlideIndex++;//往後一張索引加1
    if(firstSlideIndex>lastSlideIndex){firstSlideIndex=0;}//索引不可能大於最大索引值，所以當索引大於最大索引值就等於第一張的索引值	   
    
    show();
    getHighestViewingHeader();
})				  
 
	
	
//========================================================================
	
function randomArticle(){
		$.ajax({
			url:"../petforum/randomArticle2",
			type:"post",
			dataType:"json",
			async:false,    //同步
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
					}			
					
					$("#randomArticle").append("<div class='imag'>"+
					"<a href='http://"+window.location.host+"/PetProject_Final/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+u_Id+"'>"+
					"<img src="+content+" width=80px height=80px'/></a><br/>"+
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
	
//===========================================================================
	
function getForum(item){//參數來自button的value	
	
	$.ajax({
		url:"../petforum/selectForum",
		type:"POST",		
		dataType:"json",
		data:{
			"forumId":item,//forumId取得按鈕傳來的值傳到@Controller
			"page":page
		},
		success:function(arr){	
			$("#article").html("");
			$("#page").html("");
			$("#whichForum").html("");
			
			showPagination(arr);
			
			if(item === "全部"){item="*"}
			$("#whichForum").append(item);
			
			articleElementAppend(arr);
		},
		error:function(){
			$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>")
		}
	})
	return false;
}
		
//==================================================================
			
function goAjax(){
	
	let inputText = $("#inputText").val();
	console.log($("#inputText").val());
	
	$.ajax({
		url:"../petforum/selectHeader",
		type:"GET",		
		dataType:"json",
		data:{
			"inputText":inputText,
			"page":page					
		},
		success:function(arr){	
			$("#article").html("");
			$("#page").html("");
			
			showPagination(arr);	
			articleElementAppend(arr);
			
			 Swal.fire({
  	      		  title: "相關標題共"+arr.totalCounts+"筆",
  	      		  icon: 'success',
  	      		  confirmButtonText: '確定'
  	      		});
		},
		error:function(){
			$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>");					
			Swal.fire({
  	      		  title: "查無相關標題",
  	      		  icon: 'warning',
  	      		  confirmButtonText: '確定'
  	      		});
		}
	})
	return false;
}
	
			
//==================================================================
		
function selectOptions(){
	
		if($("#selector").val() === "最新發佈"){
			selectAll();
		}else{
		
		$.ajax({
			url:"../petforum/lastestReply",
			type:"GET",		
			dataType:"json",
			data:{						
				"page":page					
			},
			success:function(arr){	
				$("#article").html("");
				$("#page").html("");
				
				showPagination(arr);	
				articleElementAppend(arr); 
			},
			error:function(){
				$("#article").append("<tr><h2>"+"查無資料"+"</h2></tr>");						
			}
		})
		return false;
	}
 }			
	
//==================================================================
			
//沒登入不能發表	
function loginStatus(){
	<% if(session.getAttribute("user") == null){%>    		
	 Swal.fire({
      		  title: '請登入！',
      		  icon: 'error',
      		  confirmButtonText: '確定'
      		})    		
	return false;
	<%}else{%>return true;<%}%>
}
		
//==================================================================
				
function setPage(nextPage) {
    page = nextPage;
    let tableDiv = document.getElementById("table");
    tableDiv.scrollIntoView();
    selectAll();
}
		 
		 
//==================================================================
		 
function showPagination(arr){

	let totalPages = arr.totalPages;
	// 頁碼元件
    let pageUI = document.getElementById("page");
 	// 要組頁碼的Html
    let previousPage = page === 1 ? 1 : page - 1;
    let nextPage = page === totalPages ? totalPages : page + 1;
    let pageHtml ="<span><a class='page-link' onclick='setPage(" + previousPage + ")' aria-label=\"Previous\">&laquo;</a></span>"
    
    for (let i = 1; i <= totalPages; i++) {
        if (i === page) {
            pageHtml += "<span style='background-color:#3399CC;'><a class='page-link' onclick='setPage(" + i + ")'>" + i + "</a></span>";
        } 
        else {
            pageHtml += "<span><a class='page-link' onclick='setPage(" + i + ")'>" + i + "</a></span>";
        }
    }
    
    pageHtml += "<span><a class='page-link' onclick='setPage(" + nextPage + ")' aria-label=\"Next\">&raquo;</a></span>"+
    "<h4>共"+arr.totalCounts+"筆</h4>";
    
    pageUI.innerHTML = pageHtml;		
}
		 
//=====================================================================
			
function articleElementAppend(arr){
		
$.each(arr.articleList,function(i,val){ 
	
	$("#article").append("<tr>"+
	"<td><h5><a class='table_h5_a' href='postDetail.jsp?posterUid="+val[5]+"&u_Id="+val[6]+"'>"+val[0]+"</a></h5></td>"+
	"<td><div>"+val[1]+"</div></td>"+
	"<td>"+val[2]+"</td>"+
	"<td><div>"+val[3]+"</div>"+
	"<div>"+val[4]+"</div></td>"+
	"</tr>");
	
	//val[0]:header,val[1]:reply,val[2]:viewing,val[3]:sname,val[4]=updatedTime,val[5]:posterUid,val[6]:u_Id	
					
	})
}
			
//=====================================================================

var url="ws://" + window.location.host + "<%=request.getContextPath() %>/webSocket";
//Open the web socket connection to the server
var socketConn = new WebSocket(url);


//Send Message
function send(item) {
	$("#serverMsg").html("");
	socketConn.send(item);
}

// Recive Message
socketConn.onmessage = function(event) {
	$("#serverMsg").append(event.data);
}
				
//===============================================================
		
function QandA(){
	Swal.fire({
 		  	title:"<h2 style='display:inline;'>汪喵冷知識</h2><img style='margin-left:10px;' src='image/Q&A.png'/><hr />",
 		  	html:"<button type='button' style='margin-right:10px' class='btn btn-outline-success' onclick=send('ok')>開始</button>"+
  		   "<button type='button' style='margin-right:10px' class='btn btn-outline-info' onclick=send('n')>下一則</button>"+
	   		"<button type='button' style='margin-right:10px' class='btn btn-outline-info' onclick=send('cat')>貓</button>"+
	   		"<button type='button' style='margin-right:10px' class='btn btn-outline-info' onclick=send('dog')>狗</button>"+
	   		"<button type='button' style='margin-right:10px' class='btn btn-outline-danger' onclick=send('q')>離開</button>"+
	   		"<br>"+		   
	   		"<div id='serverMsg' style='text-align:left; margin-top:10px;'></div>",
  			width: '1000px',
    		confirmButtonText: '確定'
  		})
}

//===============================================================	
		
$(".scroll").click(function(){
   $('html,body').animate({
      scrollTop:$('#scrollHere').offset().top
		}, 1000);
})
				
				
	
 	</script>
  </body>
</html>