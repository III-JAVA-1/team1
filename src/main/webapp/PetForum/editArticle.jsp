<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
        
    <title>發表新文章</title>
    <link rel="stylesheet" type="text/css" href="css/forEditArticle.css">
 <c:url value=''/>   
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>  
  <script type='text/javascript' src='../assets/javascripts/ckeditor/ckeditor.js'></script> 
 
  
</head>
<body>        
 <!-- 發送/petforum/insertPost請求 -->
    <h2 class="h2">發表新文章</h2>   
<form:form action="insertPost" method="POST" modelAttribute="articleModel" enctype="multipart/form-data">
	
	<div class="control">
	<input class="rightBtn" type="button" value="取消" id="cancel" onclick="location.href='<c:url value='/PetForum/forum.jsp'/>'">
    <input class="rightBtn" type="button" value="儲存草稿" id="store">
    <input class="rightBtn" type="button" value="回復到上次儲存" id="back">
    <input class="rightBtn" type="submit" value="預覽" id="preview" onsubmit=return check(this)>   
    </div>
    
    <div class="control">
     <form:select name="forumId" path="forumId" class="forumId" id="forumId">       
        <form:option value="請選擇子版"></form:option>
        <form:option value="協尋"></form:option>
        <form:option value="送養"></form:option>
        <form:option value="日常"></form:option>      
        <form:option value="徵友"></form:option>
        <form:option value="心得"></form:option>       
    </form:select>
	</div>
	
	<form:hidden name="posterUid" path="posterUid" />
	
	<div class="control">
	<form:input name="header" path="header" size="105" placeholder="請輸入文章標題…" />
	</div>
	
	<div class="control">	
	<form:hidden name="updatedTime" path="updatedTime" size="115"/>
	</div>	
	
    <label for="content" class="lb" style="color:red">至少輸入<span id="counter">30</span>字</label><br/>
    <form:textarea id="content" name="content" path="content" rows="20" cols="120" placeholder="請輸入文章內容…" onkeydown='return countChar()' 
	onkeyup='return countChar()'></form:textarea>	

	<div class="control">
	<input class="ck" type="checkbox" id="ckObey">
	<label for="ckObey" class="lb">我已閱讀過並同意遵守討論區規則，
	<button type="button"  onclick="window.open(
			 'forumIntro.html', '_blank')">按這裡檢視討論區規則</button></label>
	</div>
</form:form>  

  <script>
	CKEDITOR.replace('content');	
  
    //禁止回上一頁
    window.history.forward(1);
    
    //即時預覽上傳圖片    
    $("#picUpload").change(function(){
      //當檔案改變後，做一些事 
     readURL(this);   // this代表<input id="picUpload">
   });
    
    function readURL(input){
    	  if(input.files && input.files[0]){
    	    var reader = new FileReader();
    	    reader.onload = function (e) {
    	       $("#preview_img").attr('src', e.target.result);    	       
    	    }
    	    reader.readAsDataURL(input.files[0]);
    	  }
    	}
    
    //計算輸入文章內文字數
    let count;
    function countChar()
    {
    	document.getElementById("counter").innerHTML = 30-document.getElementById("textarea").value.length;
    	 count = parseInt(document.getElementById("counter").innerHTML);
	    if(count <= 0){
	    	$("#counter").css("display","none");
	    }
	    else{
	    	$("#counter").css("display","inline");
	    }
    }
    
    
    $("#preview").click(function check(form){//按預覽文章   	
    	
    	 if($("#ckObey").prop("checked") && $("#forumId").find("option:selected").val() != null){    		 
    		 console.log($("#ckObey").prop("checked"));
    		 console.log($("#forumId").find("option:selected").val() != null);
    		 console.log(count);
    		 
    		 if(count > 0){
    			 window.alert("文章內容不足30個字");
    			 return false; 
    		 }
    	    	
    		 if($("#forumId").find("option:selected").val() != "請選擇子版"){    			
    				
    		var modify = window.confirm("確定修改嗎？文章紀錄將無法復原！");    			
		 	if (modify === false) {
				 window.alert('=== 跳轉回首頁===');window.location.href='../PetForum/forum.jsp';
	   			
	   			 return false;
			} 
  			else {
        		
			   	return true;//form action請求送出				  
  			}
    			
    		 }
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
          forumId = document.querySelector("#forumId").value;          
          header = document.querySelector("#header").value;          
          updatedTime = document.querySelector("#updatedTime").value;          
          content = document.querySelector("#content").value;          
      });
    //回復到上次儲存
      document.querySelector("#back").addEventListener("click", function(){        
          document.querySelector("#forumId").value = forumId;
          document.querySelector("#header").value =  header;
          document.querySelector("#updatedTime").value = updatedTime;
          document.querySelector("#content").value = content;

      });
   
   
    </script>
</body>
</html>