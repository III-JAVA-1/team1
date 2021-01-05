<%@page import="java.sql.Date"%>
<%@page import="com.google.api.client.util.DateTime"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.sql.Timestamp"%>
<!doctype html>
<html lang="zh-Hant-TW">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--bootstrap初始規模-->
    <title>AccompanyMe</title>
    <meta name="author" content="Gusty">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
<!--     <link href="../Styles/index.css" rel="stylesheet"> -->
<script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->


	<style>
	
	.acstyle{
	border: 1px solid black;
	text-align: center;
	}
		
		
	.js-social-share {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    padding-left: 0;
    line-height: 1;
    list-style: none;
  }
  .js-social-share li {
    padding-right: 1rem;
    height: 22px;
  }	
  .passtext{
  font-size:20px;
  }
	
		
		
		
	</style>



</head>
<jsp:include page="Header.jsp"/>
<body style="background-color:#F0F0F0;">

    <!-- NavBar頭-->
    <nav class="navbar navbar-expand-sm bg-light">

        <!-- Links -->
        <ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCalender.jsp">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp" onclick="return gogo()">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

    </nav>

    <!--Nav尾-->
    
<div style="width: 1100px;background-color:#FFFFFF;margin: auto;">
   		<div id="fb-root"></div>
     		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v9.0" nonce="bZUjiJpf"></script>
			<script src="https://d.line-scdn.net/r/web/social-plugin/js/thirdparty/loader.min.js" async="async" defer="defer"></script>

			<%String getact=request.getParameter("get");%>
			<br>
		<div style="text-align:center;">
<%--    			<img src="<c:url value='/Gusty/getallimg?id=<%=getact %>'>" style="with=800px;">       --%>
   			<img id="img" style="width:800px;" src="image/tantanEX.jpg" >
		</div>
		<br>   			
   		<table style="width: 1000px; border: 2px solid black;margin: auto;">
   			
   				<tr>
   					<td class="acstyle">活動名稱</td>
   					<td class="acstyle">活動時間</td>
					<td class="acstyle">活動類別</td>
   				</tr> 
		
   				<tr>
   					<td class="acstyle" id="act_name"></td>
   					<td class="acstyle" id="act_time"></td>
   					<td class="acstyle" id="act_type"></td>
   				</tr> 			

   			
   			
   		</table>
   		<br>
   		<table style="width: 1000px; border: 2px solid black;margin: auto;">
   			
   				<tr>
   					<td class="acstyle">承辦單位</td>
   					<td class="acstyle">連絡人</td>
   					<td class="acstyle">連絡電話</td>
   					<td class="acstyle">活動地點</td>
   					
   				</tr> 
		
   				<tr>		
   					<td class="acstyle" id="act_org"></td>
   					<td class="acstyle" id="act_orgman"></td>
   					<td class="acstyle" id="act_phone"></td>
   					<td class="acstyle" id="act_where"></td>
   					
   				</tr> 			
				
   			
   			
   		</table>
   		<br>
   		<table style="width: 1000px; border: 2px solid black;margin: auto;">
   				<tr>
					<td class="acstyle">活動簡介</td>
   				</tr>
				<tr>
					<td class="acstyle" id="act_content"></td>
   				</tr>
   		
   		</table>
   		
   		<br>
   		
        <input type="hidden" name="starttime" id="starttime"/>    
        <input type="hidden" name="endtime" id="endtime"/>    
        <input type="hidden" name="now" id="now" value="<%= new Date(new java.util.Date().getTime())%>" />    
   		
   		<div id="baomin" style="text-align: center;">
<!--    		<form name="gojoin"  action="JoinPage.jsp" method="post" onsubmit="return gogo()"> -->
<%--         <input type="hidden" name="name" value="<%=getact %>" size="30" />     --%>
<!--         <input type="submit" name="send" id="joinbut"  value="點我報名" /> -->
        </form>
   		</div>	
		<div style="text-align: center;">
   		<br>
   		<div id="google">
<!--    		<a href="http://www.google.com/calendar/event?action=TEMPLATE&text=你聽得懂貓星人說什麼嗎?   -->
<!--    		&dates=20200810T183000/20200810T235900 -->
<!--    		&details=喵星人你怎麼說？當貓奴遇到了喵星人，其實牠沒有你想像中的難搞！歡迎聆聽寵物專家陳貓貓的詳細講解。  -->
<!--    		&location=新北市林口區信義路99號  -->
<!--    		&trp=false">加入日曆<a/> -->
   		</div>
   		<br>
   		<div id="ispass">
<!--    		<p class ='passtext'>(活動已結束)</p> -->
   		</div>
   		<br>
   		
   		
   		<div class="fb-like" data-href="http://localhost:8080/PetProject_Final/Active/ActShow.jsp?get=1" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="true"></div>  		
 		<div class="line-it-button" data-lang="zh_Hant" data-type="share-a" data-ver="3" data-url="http://localhost:8080/PetProject_Final/Active/ActShow.jsp?get=1" data-color="default" data-size="small" data-count="true" style="display: none;">
 		</div>
   		</div>
 			
 		
</div>

    
    <!-- container'sfoot -->
        <div>
        <br><br>
        </div>
    <!-- /.container結尾 -->


    <script>

    	
    	$().ready(function(){//ajax完整活動資訊
    		$.ajax({
    			url:"../Wu/ActDetail",
    			type:"post",
    			dataType:"json",
    			data:{
    				"act_no":<%=getact%>
    			},
    			success : function(data) {

    				
    				$.each(data,function(i,n){
    					$("#img").attr("src","<c:url value='../Wu/getimg?act_no="+n.act_no+"'/>");
    					$("#act_name").html(n.act_name);
    					$("#act_time").html(n.starttime.substr(0,10)+" ~ "+n.endtime.substr(0,10));
    					$("#act_content").html(n.act_content);
    					$("#act_org").html(n.act_organize);
    					$("#act_orgman").html(n.act_orgman);
    					$("#act_phone").html(n.act_orgphone);
    					$("#act_type").html(n.act_type);
    					$("#act_where").html(n.act_where);
    					$("#starttime").val(n.starttime.substr(0,10));
    					$("#endtime").val(n.endtime.substr(0,10));
    				
    				$("#google").append(
    						"<a href='http://www.google.com/calendar/event?action=TEMPLATE"
    							+"&text="+n.act_name
    							+"&dates="+n.starttime.substr(0,10).replace(/\-/g, "")+"T000000/"+n.endtime.substr(0,10).replace(/\-/g, "")+"T000000"
    							+"&details="+n.act_content
    							+"&location="+n.act_where 
    							+"&trp=false' target='_blank'><input type='button' class='btn btn-secondary btn-sm' value='加入日曆'/><a/>"
    							
    				
    				)
    							if (Date.parse(starttime.value) > Date.parse(now.value)){
    								$("#baomin").append(
    										"<form name='gojoin'  action='JoinPage.jsp' method='post' onsubmit='return gogo()'>"
    								        +"<input type='hidden' name='name' value='"+n.act_no+"' size='30' />"    
    								        +"<input type='submit' class='btn btn-primary btn-sm' name='send' id='joinbut'  value='點我報名' />"    			    							
    			    				
    			    				)
    					        	
    							}
    							if(Date.parse(endtime.value) < Date.parse(now.value)){
    								$("#act_name").html(n.act_name+"(活動已結束)");
    							  
    							}
				
    						});
    					}
    				});
    				   
    			});
         	
 
    	

    	
    	
    	
    </script>
    
</body>
<jsp:include page="Footer.jsp"/>
</html>