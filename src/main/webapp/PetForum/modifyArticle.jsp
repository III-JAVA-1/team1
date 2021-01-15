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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
    crossorigin="anonymous">
    <title>修改文章</title>
    <link rel="stylesheet" href="../PetForum/css/common.css" /> 
    <link rel="stylesheet" href="../PetForum/css/colorbox.css" />         
  
</head>
<body style="background-image: url(../PetForum/image/modifyArticle.jpg);">

  
<!-- 發送/petforum/modifyPost請求 --> 
   <div class="col-12">
	<div class="col-9 col-sm-9 col-xl-9" id="wrapper">		
<form:form action="modifyPost" method="POST" modelAttribute="articleModel" enctype="multipart/form-data">
	
	<div class="row justify-content-center">
				<div class="form-group row w-50">
					<div class="form-row">
						<div class="form-group col-4">
							<input class="btn btn-secondary" type="button" value="取消" id="cancel" onclick="location.href='<c:url value='/PetForum/forum.jsp'/>'">
						</div>
						<div class="form-group col-4">
					    	<input class="btn btn-secondary" type="button" value="草稿" id="store">
					    </div>
					    <div class="form-group col-4">
					    	<input class="btn btn-secondary" type="button" value="回復" id="back">
					     </div>					     
				   	</div>
			    </div>
			</div>
			<div class="row justify-content-center">    
			    <div class="form-group row w-50">
				    <label class="col-sm-3 col-form-label" for="forumId">選擇子版：</label>
				    <div class="col-xs-4">   
					     <form:select name="forumId" path="forumId" class="form-control" id="forumId">       
					        <form:option value="請選擇子版"></form:option>
					        <form:option value="協尋"></form:option>
					        <form:option value="送養"></form:option>
					        <form:option value="日常"></form:option>
					        <form:option value="聊天"></form:option>        
					        <form:option value="徵友"></form:option>
					        <form:option value="心得"></form:option>       
					    </form:select>
				    </div>
				</div>
			</div>	
				
				<form:hidden name="posterUid" path="posterUid" />
			<div class="row justify-content-center">
				<div class="form-group row w-50">
						<label class="col-sm-3 col-form-label" for="header">文章標題：</label>
					<div class="col-xs-4">
						<form:input class="form-control" id="header" name="header" path="header" size="50" placeholder="請輸入文章標題…" onblur="checkHeader()" />
						<span class="span1" id="headerSp"></span> 
					</div> 
				</div>
			</div> 
				
				<form:hidden name="updatedTime" path="updatedTime" size="115"/>
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<label class="col-sm-3 col-form-label" for="content">文章內容：</label>
					<span class="span1" id="contentSp"></span><br/> 
					<div class="col-xs-4"> 
					    <form:textarea id="content" name="content" path="content" class="form-control" rows="20" cols="120" placeholder="請輸入文章內容…" onblur="checkContent()"></form:textarea>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="form-group row">
		    		<div class="form-group col-6">
						<input class="btn btn-success" type="submit" value="儲存" id="modify" onsubmit=return modify(this)/>
					</div>		    		
				</div>
			</div>
		</form:form>
	</div>	 	
</div>


<!-- This contains the hidden content for inline calls -->
		<div style='display:none'>
			<div id='inline_content' style='padding:10px; height:700px;background:#ccc;overflow: auto;'>
				<!-- 討論區規則 -->
				<p>一、基本板規：</p>
				<p>《１》禁止不符板旨文（轉錄文章亦同）
				違規處份★刪文並記點一次，記點達三次則水桶乙周</p>
				<p>寵物用品事宜請移至AnimalGoods 板面發表
				徵求寵物寄養請移至Pet_boarding板面發表
				其他寵物相關請移至各寵物專門　板面發表</p>
				<p>《２》不得徵求指定品種＋一年內幼犬貓(須兩條件均成立)，請參閱精華區說明
				違規處份★刪文並劣文一則，水桶依情節重大與否處以一個月至永久水桶</p>
				<p>精華區→4.★補充→1.《板務》徵求寵物領養的文章請注意。</p>
				<p>《３》補貼費用請務必於文章內詳加說明用途，最高不得超過三千元新台幣。
				違規處份★視為販賣活體動物，劣文處理並永久水桶。</p>
				<p>精華區→4.★補充→2.《板務》關於送養文的補貼費用說明</p>
				<p>《４》禁止有轉賣、販售、交換、惡意棄養動物行為或徵求配種用途。
				意即禁止徵求未結紮動物。
				違規處份★刪文並劣文一則並永久水桶</p>
				<p>《５》禁止過短（未滿三行）或僅留下個人聯絡資料之回文。
				違規處份★刪文並記點一次，記點達三次則水桶乙周</p>
				<p>《６》禁止假認養名義實為賺取相關嫁妝再蓄意遺棄寵物行為。
				違規處份★刪文且經查證屬實永久水桶</p>
				<p>《７》三天內若重複貼文，請先刪除前文。
				違規處份★刪文並記點一次，記點達三次則水桶乙周</p>
				<p>《８》需留意之送/領養者皆備份並刪文、水桶。</p>
				<p>《９》送養、認領文章一律禁止回文，違者直接刪除不另行通知。
				請直接回原作者站內信箱。</p>
				<p>《10》板上言論相關：
				    1.嚴禁任何粗話、髒話，就算重點字詞消除也算。違者水桶一個月。
				    2.嚴禁誹謗、引戰、鬧板、破壞和諧或
				      針對特定人物、族群進行人身攻擊之文章或推文。違者水桶一個月。
				    3.嚴禁未經推噓文者同意逕行修改或刪除其推噓文；
				      如遇特殊情形請跟板主申請修改推噓文。違者水桶一個月。
				    4.引導他人使之惡言相向、破壞版面和諧者，水桶半年。
				    5.個人恩怨請私下解決，端上板面者水桶半年。</p>
				<p>二、提醒事宜：</p>
				<p>《１》內文聯絡資料請提供兩種以上聯絡方式，如：站上信箱、電話、手機、MAIL等。</p>
				<p>《２》希望認領人的條件請務必填寫清楚，以避免發生糾紛。</p>
				<p>《３》請善用認領切結書，並定期追蹤已送養寵物。格式請參考ｚ→１６→５</p>
			</div>
		</div>	
		
		 
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
   <script type='text/javascript' src='../assets/javascripts/ckeditor/ckeditor.js'></script>
   <script src="../PetForum/js/jquery.colorbox.js"></script> 

  <script>
	CKEDITOR.replace('content',{
		language: 'zh-TW',//改成中文版
	});
	
    //禁止回上一頁
    window.history.forward(1);  
    

    
    $("#modify").click(function modify(form){//按預覽文章     
    	
   	 if($("#forumId").find("option:selected").val() != null){  		
   	    	
   		 if($("#forumId").find("option:selected").val() != "請選擇子版"){
   					
   				var modifyArticle = window.confirm("確定編輯嗎？文章紀錄將儲存！");    			
   			 	if (modifyArticle === false) {
   					 window.alert('=== 跳轉回首頁===');window.location.href='../PetForum/forum.jsp';
   		   			 return false;
   				} 
   	 			else {       			
   				   	return true;//form action請求送出       			
   	 			}
   			
   		 }
   		 else{  			 
   			   Swal.fire({
		  	      		  title: '尚未選擇子版',
		  	      		  icon: 'error',
		  	      		  confirmButtonText: '確定'
		  	      		})
   			 return false;
   			 }
   
   		}else{   	    	
   	    	Swal.fire({
		  	      		  title: '尚未選擇子版',
		  	      		  icon: 'error',
		  	      		  confirmButtonText: '確定'
		  	      		})
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
    
    
    function checkHeader(){
    	
    	//取得header元素
        let headerObj = document.getElementById("header");
         //取得header元素值
        let headerVal = headerObj.value;   

        let sp = document.getElementById("headerSp");
        if(headerVal === ""){
            sp.innerHTML="標題不可空白";
            return false;
        }else{
        	sp.innerHTML="";
        	return true;
        }
        
        
    }
    
    function checkContent(){  	 

        let sp = document.getElementById("contentSp");
        if(editor.getData() === ""){
            sp.innerHTML="內文不可空白";
            return false;
        }else{
        	sp.innerHTML="";
        	return true;
        }
    }
    
   
      $(".inline").colorbox({inline:true, width:"50%"});
      
   
    </script>
</body>
</html>