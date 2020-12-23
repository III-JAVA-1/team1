<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

</head>

<jsp:include page="Header.jsp"/>

<body>
<!-- NavBar頭-->
    <nav class="navbar navbar-expand-sm bg-light">

        <!-- Links -->
        <ul class="navbar-nav" style="margin: auto;">

			<li class="nav-item"><a class="nav-link" href="ActIndex.jsp">活動首頁</a></li>

			<li class="nav-item"><a class="nav-link" href="ActAll.jsp">活動一覽</a></li>

			<li class="nav-item"><a class="nav-link" href="">活動行事曆</a></li>

			<li class="nav-item"><a class="nav-link" href="ActCheck.jsp" onclick="return gogo()">確認參與活動</a></li>

			<li class="nav-item"><a class="nav-link" href="ActNew.jsp" onclick="return gogo()">新增活動</a></li>
			
		</ul>

    </nav>

    <!--Nav尾-->





	<div class="container">

		<div class="row justify-content-center">
			<H1>新增活動</H1>
		</div>

		<form name="reg" method="post" action="../Wu/insertActService">

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="name" class="col-sm-3 col-form-label col-form-label-lg">活動名稱:</label>

					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg"
							id="act_name" name="act_name">
					</div>

				</div>
			</div>

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="time" class="col-sm-3 col-form-label col-form-label-lg">活動時間:</label>

					<div class="col-xs-4">
						<p>開始:</p>
						<input type="date" class="form-control form-control-lg"
							id="act_start" name="starttime"> <br>
						<p>結束:</p>
						<input type="date" class="form-control form-control-lg"
							id="act_end" name="endtime">
					</div>

				</div>
			</div>



			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="organize"
						class="col-sm-3 col-form-label col-form-label-lg">承辦單位:</label>

					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg"
							id="act_organize" name="act_organize">
					</div>

				</div>
			</div>

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="orgman"
						class="col-sm-3 col-form-label col-form-label-lg">負責人:</label>

					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg"
							id="act_orgmane" name="act_orgman">
					</div>

				</div>
			</div>

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="act_where"
						class="col-sm-3 col-form-label col-form-label-lg">活動地點:</label>

					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg"
							id="act_where" name="act_where">
					</div>

				</div>
			</div>


			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="phone"
						class="col-sm-3 col-form-label col-form-label-lg">連絡電話:</label>

					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg"
							id="act_orgphone" name="act_orgphone" maxLength="10"
							oninput="value=value.replace(/[^\d]/g,'')" 
							placeholder="請輸入純數字">							
							<!-- oninput="value=value.replace(/[^\d]/g,'')"  -->
					</div>
					
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="type" class="col-sm-3 col-form-label col-form-label-lg">活動分類:</label>

					<div class="col-xs-4">
<!-- <input type="text" class="form-control form-control-lg"id="act_name" name="act_name"> -->
						<select name="act_type" id="act_type">
							<option>展覽</option>
							<option>演講</option>
							<option>比賽</option>
							<option>課程</option>
							<option>其他</option>
						</select>
					</div>

				</div>
			</div>

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="content"
						class="col-sm-3 col-form-label col-form-label-lg">活動簡介:</label>

					<div class="col-xs-4">
						<textarea style="resize: none; width: 500px; height: 130px;"
							id="act_content" name="act_content"></textarea>
					</div>

				</div>
			</div>

			<div class="row justify-content-center">
			
				<input type="hidden" id="NewActNow" name="NewActNow"  value="<%= new Timestamp(new java.util.Date().getTime())%>" />
				<input type="hidden" id="viableNumber" name="viableNumber"  value="1">
				<button type="button" class="btn btn-primary btn-lg ml-3" onClick="check()">確認送出</button>
				<button type="button" class="btn btn-primary btn-lg ml-3" onclick="history.back()">取消</button>
			</div>

		</form>

	</div>
<br><br>

<script>


function check(){
	if(reg.act_name.value == ""||reg.starttime.value == ""||reg.endtime.value == ""||reg.act_organize.value == ""
			||reg.act_orgman.value == ""||reg.act_orgphone.value == ""||reg.act_content.value == ""||reg.act_where.value == "") 
    {
            alert("所有欄位皆須填寫");
    }else if
    	(Date.parse(reg.endtime.value) < Date.parse(reg.starttime.value)){ 
    		alert("請確認開始結束日期是否錯誤"); 
    		} 
    
	else reg.submit();
}


</script>

</body>
<jsp:include page="Footer.jsp"/>
</html>