<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
    
    <jsp:useBean id="article" class="petforum.model.ArticleBean" scope="session"></jsp:useBean>
    <title>ACcompanyMe</title><!--顯示文章標題--> 
    
    <title>發表新文章</title>
    <style>
        *{padding: 0px;
            margin: 0px;
        }
    
        .h2{
            /* position:relative; */
            /* top:30px;
            left:30px; */
            margin:10px;
            display: inline;
        }
        .selForumId{
            /* position:absolute;*/
            /* top: 80px;
            left:30px; */
            padding: 0.7em;
            margin:10px;              
         
         } 
         .header{
            /* position:absolute;*/
            /* top: 80px;
            left:200px; */
            padding: 0.7em;
            margin:10px;    
         }

         .updatedTime{
            /* top: 80px;
            left:30px; */
            padding: 0.7em;
            margin:10px;      
         }

         .lb{
            padding: 0.7em;
            margin:10px;   
         }

         .content{
            overflow:auto;
            margin: 10px;
         }

         .rightBtn{
             width: 100px;
             height: 40px;
             margin-left: 10px;
         }
         
         .ck{
            margin-left: 10px;
         }         
    </style>
    
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</head>

<body>
	<input type="hidden" name="posterUid" id="posterUid" value="0" style="display:none;" /><!-- 自動編號 -->
        <input type="hidden" name="mode" id="mode" value="" style="display:none;" /><!-- user操作取消,草稿,預覽,發佈....修改mode -->
        <input type="hidden" name="forumId" id="forumId" value="0" style="display:none;" />
        <input type="hidden" name="token" id="token" value="d1e451a6f2dd560bffba6ba231a573d8" style="display:none;" />

    <h2 class="h2">發表新文章</h2>
<form action="preview.jsp" id="form_post" method="post" accept-charset="utf-8">
    <input class="rightBtn" type="button" value="取消回首頁"  onclick="location.href='lookforPet.jsp'">
    <input class="rightBtn" type="button" value="儲存草稿" id="store">
    <input class="rightBtn" type="button" value="回復到上次儲存" id="back">
    <input class="rightBtn" type="submit" value="預覽" id="preview" onsubmit=return check(this)>
   
    <br><br>
    
    <select name="selForumId" class="selForumId" id="selForumId"> 
        <option>請選擇子版</option>
        <option value="協尋">走失協尋</option>
        <option value="送養">汪喵送養</option>
        <option value="日常">汪喵日常</option>
        <option value="閒聊">輕鬆閒聊</option>
        <option value="徵友">汪喵徵友</option>
        <option value="心得">心得分享</option>
    </select>
    
    
    <input class="header" type="text" size="105" placeholder="請輸入文章標題…" name="header" id="header" value=""><br>
    <label for="" class="lb">時間：</label>
    <input class="updatedTime" type="text" size="115" name="updatedTime" id="updatedTime" value=""><br>
    <label for="image" class="lb">請選擇要上傳的圖片:</label>
    <input type="file" id="image" name="image" accept="image/png, image/jpeg"><br>
    
	<label for="" class="lb" style="color:red">至少輸入<span id="counter">25</span>字</label><br/>   
	 	
	<textarea id="content" class="content" name="content" rows="20" cols="120" placeholder="請輸入文章內容…" onkeydown='return countChar()' 
	onkeyup='return countChar()'></textarea></span> 
    <br>
    <input class="ck" type="checkbox" id="ckObey">
    <input type="hidden" name="poster_uid" value="0"><!-- 發表新文章value=0 -->
    <label for="ckObey" class="lb">我已閱讀過並同意遵守討論區規則，<button type="button"  onclick="window.open('/jsptest/html/forumIntro.html', '_blank')">按這裡檢視討論區規則</button></label>
    
</form>

    <script>   
    let count;
    function countChar()
    {
    	document.getElementById("counter").innerHTML = 25-document.getElementById("content").value.length;
    	 count = parseInt(document.getElementById("counter").innerHTML);
	    if(count <= 0){
	    	$("#counter").css("display","none");
	    }
	    else{
	    	$("#counter").css("display","inline");
	    }
    }
    
    
    $("#preview").click(function check(form){//按預覽文章 
    	 if($("#ckObey").prop("checked") && $("#selForumId").find("option:selected").val() != null){    		 
    		 console.log($("#ckObey").prop("checked"));
    		 console.log($("#selForumId").find("option:selected").val() != null);
    		 console.log(count);
    		 
    		 if(count > 0){
    			 window.alert("文章內容不足25個字");
    			 return false; 
    		 }
    	    	
    		 if($("#selForumId").find("option:selected").val() != "請選擇子版")return true; //代表未選擇
    		 else{ 
    			 window.alert("尚未選擇子版 或 尚未同意討論區規則！");
    			 return false;
    			 }
    
    		}else{
    	    	window.alert("尚未選擇子版 或 尚未同意討論區規則！");
    	    	return false;
    	    	}
    });
   
    	    
        let now = new Date();//取得當前時間，此時間格式無法順利轉成timeStamp型態
        let date = getTimeStamp(now);//透過function處理轉換成可以順利轉型成timeStamp的時間字串 

        let headerObj = document.getElementById("header");
        headerObj.addEventListener("click",function(){
            document.getElementById("updatedTime").value = date;
        });
       

      function getTimeStamp(now) {
    return (now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + (now.getDate())  + " " + 
    now.getHours() + ':' + ((now.getMinutes() < 10) ? ("0" + now.getMinutes()) : (now.getMinutes())) + ':' +
     ((now.getSeconds() < 10) ? ("0" + now.getSeconds()) : (now.getSeconds())));
    
    }

      let forumId;
      let header;
      let updatedTime;
      let content;
    //儲存草稿
      document.querySelector("#store").addEventListener("click", function(){        
          forumId = document.querySelector("#selForumId").value;          
          header = document.querySelector("#header").value;          
          updatedTime = document.querySelector("#updatedTime").value;          
          content = document.querySelector("#content").value;          
      });
    //回復到上次儲存
      document.querySelector("#back").addEventListener("click", function(){        
          document.querySelector("#selForumId").value = forumId;
          document.querySelector("#header").value =  header;
          document.querySelector("#updatedTime").value = updatedTime;
          document.querySelector("#content").value = content;

      });
   
   
    </script>
</body>
</html>