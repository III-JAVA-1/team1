<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="zh-Hant-TW">

<head>
<title>活動一覽</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap初始規模-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">




</head>
<jsp:include page="Header.jsp" />

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

		<div class="d-flex justify-content-center">
		<select class="custom-select mr-sm-2" aria-label="Default select example" id="acttype" name="acttype" style="width:200px;">
  				<option selected value="">分類</option>
  				<option value="展覽">展覽</option>
				<option value="演講">演講</option>
				<option value="比賽">比賽</option>
				<option value="課程">課程</option>
				<option value="其他">其他</option>
		</select>		
		</div>
		
		<br>

	<div class="container">

			<div class="h4" id="tip" style="text-align: center;">
			</div>

			<div id="good" class="row justify-content-center">
			</div>
			
			<div class="d-flex justify-content-center">
		<div class="btn-group me-2" role="group" aria-label="First group" id="page">
<!--     	<button type="button" class="btn btn-primary">1</button> -->
  	</div></div>

	<div>        
    <br><br>
    	<input type='hidden' name='now' id='now' value='<%= new Date(new java.util.Date().getTime())%>' /> 
    </div>

	</div>

	</div>
	<script>		
				//ajax活動表格
					$.ajax({
						url : "../Wu/Activity",
						type : "post",
						dataType : "json",
						success : function(data) {
							
							for(let i=0;i<(data.length/6);i=i+1){
								//console.log(i);
								$("#page").append("<button type='button' class='btn btn-primary' onclick='pagechange(this)' value='"+(i+1)+"'>"+(i+1)+"</button>");
							}
							
							$.each(data, function(i, n) {
							if(i>=0&&i<6){
								if(Date.parse(n[3].substr(0,10)) < Date.parse(now.value)){
									$("#good").append(
											"<div class='card m-3' style='width: 17rem;'>"
											+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
								  			+"<div class='card-body'>"
								  			+"<div style='height:140px;'>"
								    		+"<h3 class='card-title' name='act_name'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
								    		+"<p>(活動已結束)</p>"
								    		+"</div>"
								    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
								    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
								    		+"<div class='card-footer bg-transparent border-success'>"
								    		+"<p class='card-text'>"+n[8]+"</p>"
								  			+"</div></div></div>");  
    							}else{
    								$("#good").append(
											"<div class='card m-3' style='width: 17rem;'>"
											+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
								  			+"<div class='card-body'>"
								  			+"<div style='height:140px;'>"
								    		+"<h3 class='card-title' name='act_name'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
								    		+"</div>"
								    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
								    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
								    		+"<div class='card-footer bg-transparent border-success'>"
								    		+"<p class='card-text'>"+n[8]+"</p>"
								  			+"</div></div></div>");		
    							}
							}
							});
						}
					});

				
		
		
		//查詢分類
	$("#acttype").change(function(){
			$("#tip").html("");
			$("#page").html("");
			$("#good").html("");
			$.ajax({
				url : "../Wu/Activity",
				type : "post",
				async : false,
				dataType : "json",
				data:{
					"acttype": $("#acttype").val()
				},
				success:function(data){
					
					for(let i=0;i<(data.length/6);i=i+1){
						//console.log(i);
						$("#page").append("<button type='button' class='btn btn-primary' onclick='pagechange(this)' value='"+(i+1)+"'>"+(i+1)+"</button>");
					}
					
					$.each(data, function(i, n) {
						
						if(i>=0&&i<6){
							if(Date.parse(n[3].substr(0,10)) < Date.parse(now.value)){
								$("#good").append(
										"<div class='card m-3' style='width: 17rem;'>"
										+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
							  			+"<div class='card-body'>"
							  			+"<div style='height:140px;'>"
							    		+"<h3 class='card-title' name='act_name'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
							    		+"<p>(活動已結束)</p>"
							    		+"</div>"
							    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
							    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
							    		+"<div class='card-footer bg-transparent border-success'>"
							    		+"<p class='card-text'>"+n[8]+"</p>"
							  			+"</div></div></div>");  
							}else{
								$("#good").append(
										"<div class='card m-3' style='width: 17rem;'>"
										+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
							  			+"<div class='card-body'>"
							  			+"<div style='height:140px;'>"
							    		+"<h3 class='card-title' name='act_name'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
							    		+"</div>"
							    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
							    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
							    		+"<div class='card-footer bg-transparent border-success'>"
							    		+"<p class='card-text'>"+n[8]+"</p>"
							  			+"</div></div></div>");	
						
						}			
					}});
				},
				error:function(){
        			$("#tip").html("查無資料<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
        			
        			}
			});
			
		});
		
	//換頁
	function pagechange(page){
		console.log($(page).val());
		$("#tip").html("");
		$("#page").html("");
		$("#good").html("");
		$.ajax({
			url : "../Wu/Activity",
			type : "post",
			async : false,
			dataType : "json",
			data:{
				"acttype": $("#acttype").val()
			},
			success:function(data){
				for(let i=0;i<(data.length/6);i=i+1){
					//console.log(i);
					$("#page").append("<button type='button' class='btn btn-primary' onclick='pagechange(this)' value='"+(i+1)+"'>"+(i+1)+"</button>");
				}
				
				$.each(data,function(i,n){
					if(i+1>=$(page).val()*6-6+1&&i+1<=$(page).val()*6){
						if(Date.parse(n[3].substr(0,10)) < Date.parse(now.value)){
							$("#good").append(
									"<div class='card m-3' style='width: 17rem;'>"
									+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
						  			+"<div class='card-body'>"
						  			+"<div style='height:140px;'>"
						    		+"<h3 class='card-title' name='act_name'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
						    		+"<p>(活動已結束)</p>"
						    		+"</div>"
						    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
						    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
						    		+"<div class='card-footer bg-transparent border-success'>"
						    		+"<p class='card-text'>"+n[8]+"</p>"
						  			+"</div></div></div>");  
						}else{
							$("#good").append(
									"<div class='card m-3' style='width: 17rem;'>"
									+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
						  			+"<div class='card-body'>"
						  			+"<div style='height:140px;'>"
						    		+"<h3 class='card-title' name='act_name'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
						    		+"</div>"
						    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
						    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
						    		+"<div class='card-footer bg-transparent border-success'>"
						    		+"<p class='card-text'>"+n[8]+"</p>"
						  			+"</div></div></div>");	
			}
						}
					});
			},
			error:function(){
    			$("#tip").html("查無資料<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
    			}
			});
		
	}
		
		
	</script>

</body>

<jsp:include page="Footer.jsp" />
</html>