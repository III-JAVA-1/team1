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

			<li class="nav-item"><a class="nav-link" href="">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

	</nav>

	<!--Nav尾-->





	<div class="container">
		<table style="border: 2px solid black; margin: auto; width: 1000px;">

			<tr>
				<td class="acstyle">活動名稱</td>
				<td class="acstyle">活動時間</td>
				<td class="acstyle">活動簡介</td>
				<td class="acstyle">承辦單位</td>
				<td class="acstyle">連絡人</td>
			</tr>

			<tbody id="activetable">
			</tbody>
		</table>

		<!-- 		<div style="text-align:center;"> -->
		<!-- 		<input type="button" id="firstPage" value="首頁" /> -->
		<!-- 		<input type="button" id="previous" value="上一頁" /> -->
		<!-- 		<input type="button" id="next" value="下一頁" /> -->
		<!-- 		<input type="button" id="last"  value="最後頁" /> -->
		<!-- 		</div> -->

		<br>
		<br>

	</div>

	<script>
		// var pageSize = "6";//每页行数 
		// var currentPage = "1";//当前页 
		// var totalPage = "0";//总页数 
		// var rowCount = "0";//总条数 
		// var params="";//参数
// 		var url="../Wu/Activity.action"; 
		// $(document).ready(function(){//jquery代码随着document加载完毕而加载 
		// 	 //分页查询 
		// 	 function queryForPages()
		// 	 { 
		// 	  $.ajax({ 
		// 	   url:url, 
		// 	   type:'post', 
		// 	   dataType:'json', 
		// 	   data:"qo.currentPage="+currentPage+"&qo.pageSize="+pageSize+params, 
		// 	   success:function callbackFun(data)
		// 	   { 
		// 	    //解析json 
		// 	    var info = eval("("+data+")"); 
		// 	    //清空数据 
		// 	    clearDate(); 
		// 	    fillTable(info); 
		// 	   } 
		// 	  }); 
		// 	 } 
		// 	 //填充数据 
		// 	 function fillTable(info)
		// 	 { 
		// 	  if(info.length>1)
		// 	  { 
		// 	   totalPage=info[info.length-1].totalPage; 
		// 	   var tbody_content="";//不初始化字符串"",会默认"undefined" 
		// 	   for(var i=0;i<info.length-1;i++)
		// 	   { 
		// 	    tbody_content +="<tr><td class='acstyle'><a href='ActShow.jsp?get="+n.act_no+"'/>"+n.act_name+"</td>"
		// 						+"<td class='acstyle'>"+n.starttime+" ~ "+n.endtime+"</td>"
		// 						+"<td class='acstyle'>"+n.act_content+"</td>"
		// 						+"<td class='acstyle'>"+n.act_organize+"</td>"
		// 						+"<td class='acstyle'>"+n.act_orgman+"</td></tr>"
		// 						$("#activetable").html(tbody_content); 
		// 						   }
		// 	 		}
		// 	  		else
		// 	  { 
		// 	   $("#t_head").html(""); 
		// 	   $("#activetable").html("<div style='height: 200px;width: 700px;padding-top: 100px;' align='center'>"+info.msg+"</div>"); 
		// 	  } 
		// 	 } 
		// 	 //清空数据 
		// 	 function clearDate()
		// 	 { 
		// 	  $("#activetable").html(""); 
		// 	 }
		// 	 //搜索活动 
		// 	 $("#searchActivity").click(function(){ 
		// 	  queryForPages();
		// 	 }); 
		// 	 //首页 
		// 	 $("#firstPage").click(function(){ 
		// 	  currentPage="1"; 
		// 	  queryForPages(); 
		// 	 }); 
		// 	 //上一页 
		// 	 $("#previous").click(function(){ 
		// 	  if(currentPage>1)
		// 	  { 
		// 	   currentPage-- ; 
		// 	  } 
		// 	  queryForPages(); 
		// 	 }); 
		// 	 //下一页 
		// 	 $("#next").click(function(){ 
		// 	  if(currentPage<totalPage)
		// 	  { 
		// 	   currentPage++ ; 
		// 	  } 
		// 	  queryForPages(); 
		// 	 }); 
		// 	 //尾页 
		// 	 $("#last").click(function(){ 
		// 	  currentPage = totalPage; 
		// 	  queryForPages(); 
		// 	 }); 
		// 	});

		$().ready(
				function() {//ajax活動表格
					$.ajax({
						url : "../Wu/Activity",
						type : "post",
						dataType : "json",
						success : function(data) {
							$.each(data, function(i, n) {

								$("#activetable").append(
										"<tr><td class='acstyle'><a href='ActShow.jsp?get="
												+ n.act_no + "'/>" + n.act_name
												+ "</td>"
												+ "<td class='acstyle'>"
												+ n.starttime + " ~ "
												+ n.endtime + "</td>"
												+ "<td class='acstyle'>"
												+ n.act_content + "</td>"
												+ "<td class='acstyle'>"
												+ n.act_organize + "</td>"
												+ "<td class='acstyle'>"
												+ n.act_orgman + "</td></tr>");

							});
						}
					});

				});
	</script>

</body>

<jsp:include page="Footer.jsp" />
</html>