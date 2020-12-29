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

<body>


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



		<div class="d-flex justify-content-center">
		<select class="form-select" aria-label="Default select example" id="acttype" name="acttype" style="width:200px;">
  				<option selected value="">請選擇</option>
  				<option value="展覽">展覽</option>
				<option value="演講">演講</option>
				<option value="比賽">比賽</option>
				<option value="課程">課程</option>
				<option value="其他">其他</option>
		</select>		
<!-- 		<button type="button" class="btn btn-primary" style="width:80px;" onclick="search()">搜尋</button> -->
		</div>
		<br>

	<div class="container">
		<table style="border: 2px solid black; margin: auto; width: 1000px;">

			<tr>
				<td class="acstyle">活動名稱</td>
				<td class="acstyle">活動時間</td>
				<td class="acstyle">活動簡介</td>
				<td class="acstyle">承辦單位</td>
				<td class="acstyle">連絡人</td>
				<td class="acstyle">活動類別</td>
			</tr>

			<tbody id="activetable">
			</tbody>
			<div class="h4" id="tip" style="text-align: center;">
			</div>
		</table>
			
		<!-- 		<div style="text-align:center;"> -->
		<!-- 		<input type="button" id="firstPage" value="首頁" /> -->
		<!-- 		<input type="button" id="previous" value="上一頁" /> -->
		<!-- 		<input type="button" id="next" value="下一頁" /> -->
		<!-- 		<input type="button" id="last"  value="最後頁" /> -->
		<!-- 		</div> -->

		<br>
		<br>
		<br>
		<br>

	</div>

	<script>


		
				//ajax活動表格
					$.ajax({
						url : "../Wu/Activity",
						type : "post",
						dataType : "json",
						success : function(data) {
							$.each(data, function(i, n) {

								$("#activetable").append(
										"<tr>"
												
												+"<td class='' style='border: 1px solid black; padding:5px'><a href='ActShow.jsp?get="
												+ n[0] + "'/>"
												+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' style='width:80px; height:80px;' onerror='imgDisplay(this)'>"
												+ n[1].substr(0,19)
												+ "</td>"
												+ "<td class='acstyle'>"
												+ n[2].substr(0,10) + " ~ "
												+ n[3].substr(0,10) + "</td>"
												+ "<td class='acstyle'>"
												+ n[4].substr(0,10) + "...</td>"
												+ "<td class='acstyle'>"
												+ n[5].substr(0,10) + "</td>"
												+ "<td class='acstyle'>"
												+ n[6].substr(0,10) + "</td>"
												+ "<td class='acstyle'>"
												+ n[8].substr(0,10) + "</td></tr>");
												
								

							});
						}
					});

				
		
		
		
	$("#acttype").change(function(){
			$("#tip").html("");
			$("#activetable").html("");
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

						$("#activetable").append(
								"<tr>"	
								+"<td class='' style='border: 1px solid black; padding:5px'><a href='ActShow.jsp?get="
								+ n[0] + "'/>"
								+"<img src='<c:url value='../Wu/getimg?act_no="+n[0]+"'/>'alt='沒有上傳圖片' style='width:80px; height:80px;' onerror='imgDisplay(this)'>"
								+ n[1].substr(0,19)
								+ "</td>"
								+ "<td class='acstyle'>"
								+ n[2].substr(0,10) + " ~ "
								+ n[3].substr(0,10) + "</td>"
								+ "<td class='acstyle'>"
								+ n[4].substr(0,10) + "...</td>"
								+ "<td class='acstyle'>"
								+ n[5].substr(0,10) + "</td>"
								+ "<td class='acstyle'>"
								+ n[6].substr(0,10) + "</td>"
								+ "<td class='acstyle'>"
								+ n[8].substr(0,10) + "</td></tr>"
										
						);
										
					});
				},
				error:function(){
        			$("#tip").html("查無資料");
        			}
			});
			
		});
		
		
		
	</script>

</body>

<jsp:include page="Footer.jsp" />
</html>