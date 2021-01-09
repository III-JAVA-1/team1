<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
	
	<%
    String path = request.getContextPath();
    String basePath = request.getServerName() + ":"
            + request.getServerPort() + path + "/";
    String basePath2 = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
	
<title>AccompanyMe</title>
<style>
	.functioncard{
		background:	#82D900;
		border:5px #FF5809 solid;
		padding:5px;
		margin:5px;
	}
	.functioncard img{
		transform:scale(1,1);transition: all 1s ease-out;
	}
	.functioncard img:hover{
		transform:scale(1.2,1.2);
	}
	
	textarea {
    height: 300px;
    width: 100%;
    resize: none;
    outline: none;
}
 
input[type=button] {
    float: right;
    margin: 5px;
    width: 50px;
    height: 35px;
    border: none;
    color: white;
    font-weight: bold;
    outline: none;
}
 
.clear {
    background: red;
}
 
.send {
    background: green;
}
 
.clear:active {
    background: yellow;
}
 
.send:active {
    background: yellow;
}
 
.msg {
    width: 100%;
    height: 25px;
    outline: none;
}
 
#content {
    border: 1px solid gray;
    width: 100%;
    height: 400px;
    overflow-y: scroll;
}
 
.from {
    background-color: green;
    width: 80%;
    border-radius: 10px;
    height: 30px;
    line-height: 30px;
    margin: 5px;
    float: left;
    color: white;
    padding: 5px;
    font-size: 22px;
}
 
.to {
    background-color: gray;
    width: 80%;
    border-radius: 10px;
    height: 30px;
    line-height: 30px;
    margin: 5px;
    float: right;
    color: white;
    padding: 5px;
    font-size: 22px;
}
 
.name {
    color: gray;
    font-size: 12px;
}
 
.tmsg_text {
    color: white;
    background-color: rgb(47, 47, 47);
    font-size: 18px;
    border-radius: 5px;
    padding: 2px;
}
 
.fmsg_text {
    color: white;
    background-color: rgb(66, 138, 140);
    font-size: 18px;
    border-radius: 5px;
    padding: 2px;
}
 
.sfmsg_text {
    color: white;
    background-color: rgb(148, 16, 16);
    font-size: 18px;
    border-radius: 5px;
    padding: 2px;
}
 
.tmsg {
    clear: both;
    float: right;
    width: 80%;
    text-align: right;
}
 
.fmsg {
    clear: both;
    float: left;
    width: 80%;
}
	
</style>
</head>
<body>
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">後台首頁</p>
    		<div class="d-flex">
      		<a class="nav-link" href="../index.jsp">離開後台</a>
    		</div>
  		</div>
	</nav>

	<br>
	
	<div class="container">
	
		<div class="row">
		
			<div class="col-4">
			<div class="card functioncard ">
			<a href="<c:url value='/Gusty/goadminabality?abality=Member'/>" class="nav-link">
  				<img src="../Admin/image/member.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理會員相關事項</p>
  				</div>
  			</a>	
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard ">
			<a href="<c:url value='/Gusty/goadminabality?abality=Store'/>" class="nav-link">
  				<img src="../Admin/image/shop.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理商品上下架和銷售量顯示</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard ">
			<a href="<c:url value='/Gusty/goadminabality?abality=Article'/>" class="nav-link">
  				<img src="../Admin/image/chat.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理論壇相關事項</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard">
			<a href="<c:url value='/Gusty/goadminabality?abality=Petshop'/>" class="nav-link">
  				<img src="../Admin/image/store.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理實體寵物店面相關事項</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard">
			<a href="<c:url value='/Gusty/goadminabality?abality=Action'/>" class="nav-link">
  				<img src="../Admin/image/activity.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理活動和課程相關事項</p>
  				</div>
  			</a>
			</div>
			</div>
			
			<div class="col-4">
			<div class="card functioncard">
			<a href="<c:url value='/Gusty/goadminabality?abality=Mom'/>" class="nav-link">
  				<img src="../Admin/image/mom.png" class="card-img-top" alt="...">
  				<hr>
  				<div class="card-body h2">
    			<p class="card-text">管理保母相關事項</p>
  				</div>
  			</a>	
			</div>
			</div>
			
		</div>
		
	</div><br>
	
	<div class='row justify-content-center'>
	<div class="col-6" style="border:3px solid #0000C6;">
		<p class="h4">即時聊天客服</p>
    	<div id="content"></div>
    	<input type="text" placeholder="請輸入訊息" id="msg" class="msg" onkeydown="send(event)">
    	<input type="button" value="送出" class="send" onclick="sendMsg()" >
    	<input type="button" value="清空" class="clear" onclick="clearAll()">
    </div>
	</div>
	
	<div id="gotop">
	</div>
	
	<br>

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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
	
	<script>
   	var uid =1
   	<%session.setAttribute("uid",1);%>
    var path = '<%=basePath%>';
    var from=uid; 
    var fromName='Admin';
    var to="0";
    
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
	</script>

</body>
</html>