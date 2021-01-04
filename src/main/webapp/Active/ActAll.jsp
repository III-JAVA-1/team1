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
.acstyle {
	border: 1px solid black;
	text-align: center;
}
</style>


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

	<div>        
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
							$.each(data, function(i, n) {

								$("#good").append(
												"<div class='card m-3' style='width: 17rem;'>"
												+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
									  			+"<div class='card-body'>"
									  			+"<div style='height:80px;'>"
									    		+"<h3 class='card-title'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
									    		+"</div>"
									    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
									    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
									    		+"<div class='card-footer bg-transparent border-success'>"
									    		+"<p class='card-text'>"+n[8]+"</p>"
									  			+"</div></div></div>"							
								
								);

							});
						}
					});

				
		
		
		
	$("#acttype").change(function(){
			$("#tip").html("");
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
					$.each(data, function(i, n) {

						$("#good").append(
								"<div class='card m-3' style='width: 17rem;'>"
								+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' class='card-img-top' style='height:200px;'>"
					  			+"<div class='card-body'>"
					  			+"<div style='height:80px;'>"
					    		+"<h3 class='card-title'><a href='ActShow.jsp?get="+n[0]+"' class='card-title'>"+n[1]+"</a></h3>"
					    		+"</div>"
					    		+"<p class='card-text'>"+n[4].substr(0,20) +"...</p>"
					    		+"<p class='card-text'>"+n[2].substr(0,10) + " ~ "+ n[3].substr(0,10) +"</p>"
					    		+"<div class='card-footer bg-transparent border-success'>"
					    		+"<p class='card-text'>"+n[8]+"</p>"
					  			+"</div></div></div>"
					  													
						);
										
					});
				},
				error:function(){
        			$("#tip").html("查無資料");
        			}
			});
			
		});
		

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

</body>

<jsp:include page="Footer.jsp" />
</html>