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
    <link rel="stylesheet" href="../PetForum/css/common.css" /> 
    
</head>
<body style="background-image: url(../PetForum/image/editArticle_bg.jpg);">


 <!-- 發送/petforum/insertPost請求 -->
<div class="col-12">
	<div class="col-9 col-sm-9 col-xl-9" id="wrapper">		
		<form:form action="insertPost" method="POST" modelAttribute="articleModel" enctype="multipart/form-data">
			
			<div class="row justify-content-center">
				<div class="form-group row w-50">
					<div class="form-row">
						<div class="form-group col-3">
							<input class="btn btn-secondary" type="button" value="取消" id="cancel" onclick="location.href='<c:url value='/PetForum/forum.jsp'/>'">
						</div>
						<div class="form-group col-3">
					    	<input class="btn btn-secondary" type="button" value="草稿" id="store">
					    </div>
					    <div class="form-group col-3">
					    	<input class="btn btn-secondary" type="button" value="回復" id="back">
					     </div>
					      <div class="form-group col-3">
					    	<input class="btn btn-success" type="submit" value="新增" id="newArticle" onsubmit=return check(this)/>
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
						<input class="btn btn-outline-success" type="button" value="一鍵輸入" id="pressInput"/> 
					</div> 
				</div>
			</div> 
				
				<form:hidden name="updatedTime" path="updatedTime" id="updatedTime" size="115"/>
			
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
					<input class="form-check-input" type="checkbox" id="ckObey">											
					<label class="col-sm-3 col-form-label" for="ckObey" class="form-check-label">我已閱讀過並同意遵守討論區規則，<a class='inline' href="#inline_content">按這裡檢視討論區規則</a></label>					
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
		
		 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
    crossorigin="anonymous">   
    
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   <script type='text/javascript' src='../assets/javascripts/ckeditor/ckeditor.js'></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
   <link rel="stylesheet" href="../PetForum/css/colorbox.css" />   
   <script src="../PetForum/js/jquery.colorbox.js"></script> 
		
  <script>
  
  var editor = CKEDITOR.replace('content',{
		language: 'zh-TW',//改成中文版
	});
  
    //禁止回上一頁
    window.history.forward(1);
    
    $("#newArticle").click(function check(form){//按預覽文章   	
    	
   	 if($("#ckObey").prop("checked") && $("#forumId").find("option:selected").val() != null){    		 
   		
   	    	
   		 if($("#forumId").find("option:selected").val() != "請選擇子版"){
   			 
   			if(checkHeader() && checkContent()){   				
   				var newArticle = window.confirm("確定新增嗎？文章紀錄將儲存！");    			
   			 	if (newArticle === false) {
   					 window.alert('=== 跳轉回首頁===');window.location.href='../PetForum/forum.jsp';
   		   			
   		   			 return false;
   				} 
   	 			else {       			
   				   	return true;//form action請求送出       			
   	 			}
   			 }
   			else{//內容或標題為空
   				return false;
   			}
   			
   		 }
   		 else{   			 
   			 Swal.fire({
		  	      		  title: '尚未選擇子版 或 尚未同意討論區規則！',
		  	      		  icon: 'error',
		  	      		  confirmButtonText: '確定'
		  	      		})
   			 return false;
   			 }
   
   		}else{
	   		 Swal.fire({
		      		  title: '尚未選擇子版 或 尚未同意討論區規則！',
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
    
    
    $("#pressInput").click(function pressInput(){
    	$("#forumId").val("心得");//設定心得
    	$("#header").val("寵物溝通心得分享");
    	$("#updatedTime").val(date);
    	let html = "<p>這篇基本上是跟「相信寵物溝通」＆「不知道是不是真的但想了解」的人分享<br />"+
    	"打從心底覺得「寵物溝通是騙人的」＆「真是一群好騙的白痴」的人，建議可以直接離開了喔<br />"+
    	"^_^<br />"+
    	"***<br />"+
    	"前兩天跟朋友聊到彼此找寵物溝通師的經驗（後半部有我自己的經驗分享）<br />"+
    	"順便問了一些學寵物溝通的FAQ<br />"+
    	"我覺得滿有趣的～想跟大家分享<br />"+
    	"1 .寵物溝通是可以用學的？<br />"+
    	"對，但還是要看天份。<br />"+
    	"2 .所以跟通靈需要「那種體質」不一樣？<br />"+
    	"對。<br />"+
    	"3 .什麼叫天份？<br />"+
    	"有些人是視覺比較強，動物傳達的圖像畫質比較高，像Leslie就是，可以達到FHD跟彩色的程度，比較弱的人可能就只能接收到360P而且只有黑白，大概是這個概念。<br />"+
    	"有些人是聽覺比較強，動物傳達的聲音可以聽得很清楚，也是音質跟聲音大小的差別。有些人可能就真的學不會XDDD<br />"+
    	"***<br />"+
    	"朋友還說他們在課堂上會拿自家寵物的照片跟其他同學交換練習，結果有一個學生完全無法連上任何動物，老師請學生回去擲筊問祖先是不是不同意，結果還真的！<br />"+
    	"還有一個滿好笑的例子是，曾經有溝通師在跟寵物溝通的時候，寵物把主人裸體的影像傳給溝通師了...溝通師居然還說得出來主人的身體特徵（主人心裡應該在暗罵死小孩）<br />"+
    	"***<br />"+
    	"之前我把找寵物溝通的東西PO在我FB後，有幾個半信半疑但也滿想找溝通師的朋友，問我一些溝通師到底怎麼溝通的，順便節錄一小段Leslie的新手FAQ讓有興趣的人了解一下：<br />"+
    	"原文出處<br />"+
    	"Leslie talks to Animals:<br />"+
    	"動物溝通就是直覺感知<br />"+
    	"我一直很想好好解釋清楚什麼是動物溝通，但我想經過今天高雄的簽書分享會，我終於整理出一套清楚的邏輯思緒跟你們分享。<br />"+
    	"我定義動物溝通為『直覺感知』的本能。<br />"+
    	"這也是為什麼，有授課的動物溝通老師都強調：『動物溝通是人人與生俱來的本能，人人可以學習。』<br />"+
    	"因為人本來就有直覺。<br />"+
    	"例.. .1 .除了照片與動物名字，其他都不需要知道。<br />"+
    	"因為除了照片與名字以外，其他的資訊都可能主觀引導動物溝通直覺感知。<br />"+
    	"例如<br />"+
    	"王小明領養一隻流浪狗來福<br />"+
    	"這句話其實就可以推敲出很多東西<br />"+
    	"來福身體不好，尤其是皮膚。(大部分流浪狗都這樣囉)來福吃東西很快。(流浪狗通症)來福沒有安全感，人離開身邊就會不安(終於有人疼愛怕失去)或是相反<br />"+
    	"來福很不親近人，很怕生，要花很多時間才能信任人(以前與人類有不好經驗)來福怕人手舉高，即使要摸頭也怕是要被打(被打過)來福睡覺是蜷曲睡姿或是睡覺警戒心很高很容易醒。(流浪狗都很戒慎恐懼的生活)然後王小明可能是個體貼能夠承擔責任現階段生活不虞匱乏，也許怕寂寞或是剛與女友分手所以領養一隻狗。<br />"+
    	"所以為了避免直覺感知被過多資訊騷擾引導，溝通前只需要知道照片跟名字。<br />"+
    	"這是第一道防護柵門。<br />"+
    	"2 .生活細節的身份確認。<br />"+
    	"一定會在溝通前，先用直覺感知，溝通出許多動物的生活細節與照護人驗證。<br />"+
    	"個性、與照護人相處細節、家庭格局、最近吃什麼、和家中其他人其他動物的互動。(通常都會講一些很關鍵的細節，例如切確的位置形狀顏色或習慣)這些都對應無誤，再往下讓照護人發問。<br />"+
    	"這是第二道防護柵門。<br />"+
    	"但是，如果照護人持續刻意給錯誤資訊，那就像拿錯的電話號碼撥號、拿錯的身份證字號查信用卡資訊。<br />"+
    	"開頭錯就全錯。<br />"+
    	"因為直覺容易跟著主觀走。<br />"+
    	"這也是為什麼許多溝通師會被記者挖坑跳的原因，因為直覺被錯誤資訊引領牽著走。<br />"+
    	"***<br />"+
    	"以下分享我自己的溝通經驗～<br />"+
    	"5年前因為好奇，自己找過2位動物溝通師<br />"+
    	"但是說實在我覺得沒有很準<br />"+
    	"因為溝通師都沒講到一些我覺得很關鍵的東西<br />"+
    	"只會講說「我很喜歡馬麻啊，跟馬麻在一起都好」<br />"+
    	"去年因為有新舊貓相處上的問題<br />"+
    	"忍不住還是請有做過寵物溝通的朋友A介紹溝通師給我<br />"+
    	"因為朋友A其實也找過很多溝通師<br />"+
    	"除了最有名(但超難約)的Leslie之外<br />"+
    	"她覺得另一個比較不有名溝通師也滿準的<br />"+
    	"因為我有急需，就約了比較不有名的那位溝通師<br />"+
    	"溝通時就真的只要拿照片過去就好<br />"+
    	"那次溝通有幾個我覺得「驚!!!好神奇!!!」的點是：<br />"+
    	"1 .貓咪個性<br />"+
    	"可以精準描述出我家三隻貓的個性，一隻是屁孩，一隻是傲嬌公主，一隻是拍到丁（最後再附圖）<br />"+
    	"2 .打架狀況<br />"+
    	"溝通師說只有屁孩會跟傲嬌公主打架，拍到丁不會跟另外兩隻打架<br />"+
    	"3 .身體特徵<br />"+
    	"溝通師還主動問了拍到丁為什麼不跟他們打架？<br />"+
    	"拍到丁說：「因為我跑很慢」<br />"+
    	"這個真的是超級大驚!!!<br />"+
    	"因為拍到丁不跟他們打架的原因真的是因為她只有三隻腳跑很慢，但是我從頭到尾沒有提到拍到丁只有三隻腳...照片上也看不出來<br />"+
    	"4 .講出了我不知道的事情<br />"+
    	"一開始在確認身份的時候，溝通師說屁孩喜歡用右邊的臉去蹭，所以右臉的毛很容易打結，我當下其實很疑惑，因為我不覺得右邊的毛有特別容易打結啊，而且屁孩的臉毛很少打結，結果我回家之後檢查屁孩的臉，e04!!!!真的只有右臉的毛打結了!!!!<br />"+
    	"雖然當天溝通完沒有結論（屁孩還是屁孩，傲嬌公主還是討厭屁孩，無法相安無事），但我還是覺得很神奇。<br />"+
    	"然後在上個月，傲嬌公主真的被屁孩咬傷，而且很嚴重（雖然是長輩造成的，我還是很自責），帶去看醫生回來之後，傲嬌公主都不吃不喝也不吃藥，整個超虛弱一直睡覺，我超怕她就這樣走了😭<br />"+
    	"於是又聯繫了朋友A請他幫我問一下溝通師現在能不能幫忙連一下傲嬌公主，幫我勸她乖乖吃藥，朋友A說好<br />"+
    	"她會去處理，結果過了大概1小時，傲嬌公主原本一直在沙發上睡覺，突然起身跳下沙發(還跌倒），搖搖晃晃的慢慢走到吃飯的地方，我趕緊把肉肉放到她面前，我放了兩碗，一碗有加藥，一碗沒加藥，結果她兩碗都聞一聞，居然吃了有加藥的那碗!!!（我瞬間淚崩😭<br />"+
    	"我馬上敲朋友A：「溝通師是不是連上了？」<br />"+
    	"朋友A大驚：「!!!!」<br />"+
    	"她說在我敲她前2分鐘溝通師才剛連上線正在聊，想說我在照顧貓咪不要吵我，等他們聊完再跟我說，結果我就先敲她了!!!（我當下真的雞皮疙瘩都站起來了）<br />"+
    	"最後溝通師有主動聯絡我，他說傲嬌公主在賭氣，氣我們為什麼害她被咬，叫我們要好好的哄哄她。<br />"+
    	"這三張是我提供給溝通師的照片</p>"+

    	"<div class='gMfYxq v361i1-0'>"+
    	"<div class='hByQDX sc-2xcoxb-0'><img alt='' src='https://imgur.dcard.tw/zgcs3Q3h.jpg' /></div>"+
    	"</div>"+

    	"<div class='gMfYxq v361i1-0'>"+
    	"<div class='hByQDX sc-2xcoxb-0'><img alt='' src='https://imgur.dcard.tw/8nykSC1h.jpg' /></div>"+
    	"</div>"+

    	"<div class='gMfYxq v361i1-0'>"+
    	"<div class='hByQDX sc-2xcoxb-0'><img alt='' src='https://imgur.dcard.tw/SlusR1oh.jpg' /></div>"+
    	"</div>"+

    	"<p>大家覺得誰是屁孩、傲嬌公主跟拍到丁？ 答案是</p>"+

    	"<div class='gMfYxq v361i1-0'>"+
    	"<div class='hByQDX sc-2xcoxb-0'><img alt='' src='https://imgur.dcard.tw/dLyjbmWh.jpg' /></div>"+
    	"</div>"+

    	"<p>然後這是傲嬌公主吃了有藥那碗肉肉的照片</p>"+

    	"<div class='gMfYxq v361i1-0'>"+
    	"<div class='hByQDX sc-2xcoxb-0'><img alt='' src='https://imgur.dcard.tw/Acvkjawh.jpg' /></div>"+
    	"</div>"+

    	"<p>因為一開始我很不會餵膠囊💊 隔天要餵藥的時候 想說一樣加到肉肉裡面給她吃就好了 結果她吃了一口就乾嘔，應該是真的很苦😭 所以我後來認真學會用針筒餵膠囊 就不用讓她吃苦苦的藥粉了</p>"

    	
    		editor.setData(html);
    });
    
      $(".inline").colorbox({inline:true, width:"50%"});
      
   
      
    </script>
</body>
</html>