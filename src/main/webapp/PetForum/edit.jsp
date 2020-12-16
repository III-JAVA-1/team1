<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
    
    
    <title>AccompanyMe</title><!--顯示文章標題-->  
    
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
        .forumId{
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
    <input type="hidden" name="mode" id="mode" value="" style="display:none;" /><!-- user操作取消,草稿,預覽,發佈....修改mode -->
        
    <h2 class="h2">修改文章</h2>
    <!-- 發送/petforum/previewPost/{posterUid}請求 -->

<form:form action="previewPost/${articleModel.getPosterUid()}" method="POST" modelAttribute="articleModel">
	<input class="rightBtn" type="button" value="取消" id="cancel" onclick="location.href='lookforPet.jsp'">
    <input class="rightBtn" type="button" value="儲存草稿" id="store">
    <input class="rightBtn" type="button" value="回復到上次儲存" id="back">
    <input class="rightBtn" type="submit" value="預覽" id="preview" onsubmit=return check(this)>   
    <br>
    
       <form:select name="forumId" path="forumId" class="forumId" id="forumId">       
        <form:option value="請選擇子版"></form:option>
        <form:option value="協尋"></form:option>
        <form:option value="送養"></form:option>
        <form:option value="日常"></form:option>
        <form:option value="閒聊"></form:option>
        <form:option value="徵友"></form:option>
        <form:option value="心得"></form:option>       
    </form:select>	
	
	<form:hidden name="posterUid" path="posterUid" />
	<form:input name="header" path="header" size="98" placeholder="請輸入文章標題…" /><br/>
	<label for="" class="lb">時間：</label>
	<form:input name="updatedTime" path="updatedTime" size="104"/><br/>
	<label for="image" class="lb">請選擇要上傳的圖片:</label>
	<input type="file" id="image" name="image" accept="image/png, image/jpeg"><br/>
	<form:textarea name="content" path="content" rows="20" cols="120" placeholder="請輸入文章內容…"/><br/>
	<input class="ck" type="checkbox" id="ckObey">
	 <label for="ckObey" class="lb">我已閱讀過並同意遵守討論區規則，
	 <button type="button"  onclick="window.open('forumIntro.html', '_blank')">按這裡檢視討論區規則</button></label>
</form:form>    

    <script>
    
    $("#preview").click(function check(form){//按預覽文章 
    	 if($("#ckObey").prop("checked") && $("#forumId").find("option:selected").val() != null){    		 
    		 console.log($("#ckObey").prop("checked"));
    		 console.log($("#forumId").find("option:selected").val() != null);    	    
    	    	
    		 if($("#forumId").find("option:selected").val() != "請選擇子版")return true; 
    		 else{ 
    			 window.alert("尚未選擇子版 或 尚未同意討論區規則！");
    			 return false;
    			 }
    
    		}else{
    	    	window.alert("尚未選擇子版 或 尚未同意討論區規則！");
    	    	return false;
    	    	}
    });
   
    	    
        let now = new Date();
        let date = getTimeStamp(now);  

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
          document.querySelector("#mode").value = "store";
          forumId = document.querySelector("#forumId").value;          
          header = document.querySelector("#header").value;          
          updatedTime = document.querySelector("#updatedTime").value;          
          content = document.querySelector("#content").value;          
      });
    //回復到上次儲存
      document.querySelector("#back").addEventListener("click", function(){
          document.querySelector("#mode").value = "back";
          document.querySelector("#forumId").value = forumId;
          document.querySelector("#header").value =  header;
          document.querySelector("#updatedTime").value = updatedTime;
          document.querySelector("#content").value = content;

      });
    //預覽
      document.querySelector("#preview").addEventListener("click", function(){
          document.querySelector("#mode").value = "preview";
      });    

    //將下拉式選單選擇結果儲存到隱藏控件
      document.querySelector("#forumId").addEventListener("blur", function(){
          document.querySelector("#forumId").value = document.querySelector("#forumId").value;
      });
    </script>
</body>
</html>