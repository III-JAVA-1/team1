<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--bootstrap初始規模-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="css/chat.css" rel="stylesheet">
<%
    String path = request.getContextPath();
    String basePath = request.getServerName() + ":"
            + request.getServerPort() + path + "/";
    String basePath2 = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<style>
	
	a{
    	text-decoration:none;
	}
	
	#gotop {
		width:65px;
		height:65px;
    	position: fixed;
    	border-radius: 50px;
    	right: 20px;
    	bottom: 30px;
    	padding: 10px 16px;
    	background-repeat: no-repeat;
    	background-size: cover;
    	background-image: url("image/up.png");
    	color: white;
    	cursor: pointer;
    	z-index: 1000;
	}
	#servicee{
		width:65px;
		height:65px;
    	position: fixed;
    	border-radius: 50px;
    	right: 20px;
    	bottom: 120px;
    	padding: 10px 16px;
    	background-repeat: no-repeat;
    	background-size: cover;
    	background-image: url("image/customer-service.png");
    	color: white;
    	cursor: pointer;
    	z-index: 2000;
	}

</style>

<head>
<title>AccompanyMe</title>

</head>
<body>
	
	<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="font-size:28px;">
            <a class="navbar-brand" href="index.jsp"><img src="image/AccompanyMe.png" style="width:200px; height:80px;" alt=""></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item ">
						<%
							if (session.getAttribute("user") == null || session.getAttribute("user") == "") {
								out.print("<a class=\"nav-link\" href=\"Store/\">毛孩商城</a>");
							} else {
								out.print("<a class=\"nav-link\" href=\"Store/?memberId="
										+ session.getAttribute("user")
										+ "\">毛孩商城</a>");
							}
						%>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<c:url value='mom/extar.jsp'/>">寵物保姆</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<c:url value='PetForum/forum.jsp'/>">汪喵討論區</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Petshop/mainshop.jsp">寵物店家</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Active/ActIndex.jsp">寵物活動/消息</a>
                    </li>
                    <li class="nav-item" style="color:white;">
                        <%
                        	if(session.getAttribute("user")==null||session.getAttribute("user")=="")
							{
								out.print("<a class='nav-link' href='Member/Login.jsp'><img src='image/user.svg' width='30' height='30' alt=''></a>");
							}else{
								 out.print("<a class='nav-link' href='Member/Member.jsp' id='sname'></a>");
							}
						%>
                    </li>
                    <li class="nav-item" style="color:white;">
                    	<%
                    		if(!(session.getAttribute("user")==null)&&!(session.getAttribute("user")=="")){
                    			out.print("<a class='nav-link' onclick='return logout()' href='#'>登出</a>");
                    		}
	                    %>
                    </li>
                </ul>
            </div>
    </nav>
    </header>
	
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></li>
          <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="image/catsay.jpg" class="d-block w-100" alt="" style="width:100%;height:700px;">
            <div class="carousel-caption d-none d-md-block">
                <h3>你聽得懂貓星人說什麼嗎?</h3>
                <p>喵星人你怎麼說？當貓奴遇到了喵星人，其實牠沒有你想像中的...</p>
             </div>
          </div>
          <div class="carousel-item">
            <img src="image/banner-3.jpg" class="d-block w-100" alt="" style="width:100%;height:700px;">
          </div>
          <div class="carousel-item">
            <img src="image/petshop.jpg" class="d-block w-100" alt="" style="width:100%;height:700px;">
          </div>
          <div class="carousel-item">
            <img src="image/forum.jpg" class="d-block w-100" alt="" style="width:100%;height:700px;">
          </div>
          <div class="carousel-item">
            <img src="image/mom.jpg" class="d-block w-100" alt="" style="width:100%;height:700px;">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </a>
        
      </div><br>
	
	<div class="container">
		
		<div class="d-flex justify-content-center">
    		<div class="display-2">精選活動</div>
  		</div>
		
		<div class="row justify-content-center" id='indexactive'>
		</div>
		
		<hr style="height:20px; color:green">
		
		<div class="d-flex justify-content-center" >
    		<div class="display-2">最新商品</div>
  		</div>
  		
  		<div class="row justify-content-center" id="indexshop" >	
		</div>
		
	</div><br>
	
	<div  id="chatroom" class="row justify-content-center" style="display:none;">
	<div class="col-6" style="border:3px solid green;">
		<p class="h4">即時聊天客服</p>
    	<div id="content"></div>
    	<input type="text" placeholder="請輸入要詢問的事情" id="msg" class="msg" onkeydown="send(event)">
    	<input type="button" value="送出" class="send" onclick="sendMsg()" >
    	<input type="button" value="清空" class="clear" onclick="clearAll()">
    </div>
	</div><br>
	
	<div id="gotop">
	</div>
	
	<div id="servicee">
	</div>
	
	<footer class="py-5 bg-dark">
        <p class="m-0 text-center text-white h2">AccompanyMe │ 有你陪伴 &copy Designed by Eva .</p>
    </footer>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>	
	
		
	<script>
	$('#gotop').click(function(){//回最上層JQUERY
        jQuery("html,body").animate({
            scrollTop:0
        },1000);
    });
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 300){
            $('#gotop').fadeIn("fast");           
        } else {
            $('#gotop').stop().fadeOut("fast");
        }
    });
    var chat=0;
    $("#servicee").click(function(){
    	if(chat==0){
    		document.getElementById("chatroom").style.display="";
    		$("html,body").animate({
                scrollTop:1800
            },100);
    		chat=1;
    	}else{
    		document.getElementById("chatroom").style.display="none";
    		chat=0;
    	}

    })
   	var uid =0 
   	<%session.setAttribute("uid",0);%>
    var path = '<%=basePath%>';
    var from=uid; 
    var fromName='Guest';
    var to="1";
    
    var websocket;
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://" + path + "/ws?uid="+uid);
    } else if ('MozWebSocket' in window) {
        websocket = new MozWebSocket("ws://" + path + "/ws"+uid);
    } else {
        websocket = new SockJS("http://" + path + "/ws/sockjs"+uid);
    }
    websocket.onopen = function(event) {
        console.log("WebSocket:已连接");
        console.log(event);
    };
    websocket.onmessage = function(event) {
        var data=JSON.parse(event.data);
        console.log("WebSocket:收到一条消息",data);
        var textCss=data.from==-1?"sfmsg_text":"fmsg_text";
        $("#content").append("<div class='fmsg'><label class='name'>"+data.fromName+" "+data.date+"</label><div class='"+textCss+"'>"+data.text+"</div></div>");
        scrollToBottom();
    };
    websocket.onerror = function(event) {
        console.log("WebSocket:发生错误 ");
        console.log(event);
    };
    websocket.onclose = function(event) {
        console.log("WebSocket:已关闭");
        console.log(event);
    }
        function sendMsg(){
            var v=$("#msg").val();
            if(v==""){
                return;
            }else{
                var data={};
                data["from"]=from;
                data["fromName"]=fromName;
                data["to"]=to;
                data["text"]=v;
                websocket.send(JSON.stringify(data));
                $("#content").append("<div class='tmsg'><label class='name'>我 "+new Date().Format("yyyy-MM-dd hh:mm:ss")+"</label><div class='tmsg_text'>"+data.text+"</div></div>");
                scrollToBottom();
                $("#msg").val("");
            }
        }
         
        function scrollToBottom(){
            var div = document.getElementById('content');
            div.scrollTop = div.scrollHeight;
        }
         
        Date.prototype.Format = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
         
        function send(event){
            var code;
             if(window.event){
                 code = window.event.keyCode; // IE
             }else{
                 code = e.which; // Firefox
             }
            if(code==13){
                sendMsg();           
            }
        }
         
        function clearAll(){
            $("#content").empty();
        }
	
		$.ajax({
			url:"Gusty/headercheck",
			type:"post",
			dataType:"json",
			data : { 
				"user_id" : <%=session.getAttribute("user")%>,                     
            },
			success:function(data){
				$.each(data,function(i,n){
					$("#sname").html(n.sname+"您好");
				});
			}
		});
    
    $.ajax({
		url:"Gusty/indexactive",
		type:"post",
		dataType:"json",
		success:function(data){
			$.each(data,function(i,n){
				$("#indexactive").append("<div class='card m-2' style='width: 16rem;'>"+
	  			"<img src='<c:url value='Gusty/getactiveimg2?act_no="+n[2]+"'/>' class='card-img-top' alt='' style='height:200px;'>"+
	  			"<div class='card-body'>"+
	    			"<h5 class='card-title'>"+n[0]+"</h5>"+
	    			"<p class='card-text h4'>"+n[1].substring(0,10)+"....</p>"+
	    			"<a href='Active/ActAll.jsp' class='btn btn-primary'>看更多活動</a>"+
	  			"</div></div>");
			});
		}
	});
    
    var shopname;
    var xx=0;
    var userid=<%=session.getAttribute("user")%>;//商品顯示最新4筆
    $().ready(function(){
		$.ajax({
			url:"Gusty/indexshop",
			type:"post",
			dataType:"json",
			success:function(data){
				$.each(data,function(i,n){
					if(i==0||shopname!=n[0]){
						shopname=n[0];xx=xx+1;
						if(xx>4){return false;}
						$("#indexshop").append("<div class='card m-2' style='width: 16rem;'>"+
					  			"<img src='"+n[2]+"' class='card-img-top border border-dark border-2'>"+
					  			"<div class='card-body'>"+
					  			"<h2 id='"+n[3]+"'></h2><hr>"+
					    		"<p class='card-text h4'>"+n[1]+"&nbspNT</p>"+
					  			"</div></div>");
						if(userid==null||userid==""){
							$("#"+n[3]+"").append("<a class='card-link' href='<c:url value='Store/productDetail?id="+n[3]+"&memberId='/>'>"+n[0].substring(0,15)+"....</a>");
						}else{
							$("#"+n[3]+"").append("<a class='card-link' href='<c:url value='Store/productDetail?id="+n[3]+"&memberId="+userid+"'/>'>"+n[0].substring(0,15)+"...</a>");
						}
					}
				});
			}
		});
	});
    function logout(){
		window.location.href="<c:url value='/Gusty/logout'/>";
		return false;
	}
	</script>
	
</body>
</html>