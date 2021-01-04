<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap初始規模-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	
	<style>
	.carousel-item {
  height: 65vh;
  min-height: 300px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
	
	
	</style>
	
</head>
<jsp:include page="Header.jsp"/>
<body>

<!-- NavBar頭-->
    <nav class="navbar navbar-expand-sm bg-light" >

        <!-- Links -->
        <ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item active"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCalender.jsp">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp" onclick="return gogo()">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

    </nav>
    
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>

            </ol>
            <div class="carousel-inner" role="listbox">

                <div class="carousel-item active" style="background-image: url('image/catsay.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>你聽得懂貓星人說什麼嗎?</h3>
                        <p>喵星人你怎麼說？當貓奴遇到了喵星人，其實牠沒有你想像中的...</p>
                    </div>
                </div>
                
                <div class="carousel-item" style="background-image: url('image/friendlly.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>寵物友善城市說明會</h3>
                        <p>「友善動物城市」取決整體環境下人類對動物的態度. 對同伴動...</p>
                    </div>
                </div>
                
                <div class="carousel-item" style="background-image: url('image/art.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>酷酷寵物攝影展</h3>
                        <p>今年雖嚴重受到疫情影響，但攝影節籌備成員仍攜手合作克服...</p>
                    </div>
                </div>
                
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    <!--Nav尾-->



<br><br>

</body>
<script>
// var activity;
// var POL=0;
// $().ready(
// 		function() {//ajax活動表格
// 			$.ajax({
// 				url : "../Wu/Activity",
// 				type : "post",
// 				dataType : "json",
// 				success : function(data) {
// 					$.each(data, function(i, n) {
// 						if(i==0||activity!=n[1]){
// 						activity=n[1];POL=POL+1;
// 						if(POL>3){return false;}
// 						$("#rollbox").append(
// 							"<div class='carousel-item' style='background-image: url('image/art.jpg')'>"
// 			                    +"<div class='carousel-caption d-none d-md-block'>"
// 			                        +"<h3>"+n[1]+"</h3>"
// 			                        +"<p>"+n[4]+"</p>"
// 			                    +"</div>"
// 			                  +"</div>"
										
// 						);

// 					}
// 					});
// 				}
// 			});

// 		});

function gogo()
    	{
    		<%
    			if(session.getAttribute("user")==null)
    			{%>window.alert("請先登入"); return false;
    			<%}else{%>
    			return  true;
    			<%}%>
    				
    				
    		return false;
    	}



function gogo()
    	{
    		<%
    			if(session.getAttribute("user")==null)
    			{%>window.alert("請先登入"); return false;
    			<%}else{%>
    			return  true;
    			<%}%>
    				
    				
    		return false;
    	}
</script>
<jsp:include page="Footer.jsp"/>
</html>


