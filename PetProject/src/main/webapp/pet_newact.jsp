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

<body>


	<div class="container">

		<div class="row justify-content-center">
			<H1>新增活動</H1>
		</div>
		
		<form method="post" action="InsertAct">
		
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
							id="act_start" name="act_start"> <br>
						<p>結束:</p>
						<input type="date" class="form-control form-control-lg"
							id="act_end" name="act_end">
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

					<label for="phone"
						class="col-sm-3 col-form-label col-form-label-lg">連絡電話:</label>

					<div class="col-xs-4">
						<input type="text" class="form-control form-control-lg"
							id="act_orgphone" name="act_orgphone">
					</div>

				</div>
			</div>

			<div class="row justify-content-center">
				<div class="form-group row w-50">

					<label for="type" class="col-sm-3 col-form-label col-form-label-lg">活動分類:</label>

					<div class="col-xs-4">
						<!-- 					<input type="text" class="form-control form-control-lg"id="act_name" name="act_name"> -->
						<select name="act_type" id="act_type">
							<option value="exhibition">展覽</option>
							<option value="speach">演講</option>
							<option value="another">其他</option>
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
				<button type="submit" class="btn btn-primary btn-lg ml-3">確認送出</button>
			</div>
			
		</form>

	</div>


</body>

</html>