<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="zh-Hant-TW">



<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap初始規模-->
<title>AccompanyMe</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>

<!--sweetAlert-->
>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

article {
	/* border:1px solid gray; */
	border-radius: 15px;
	padding: 30px 80px;
	background-color: #E0E0E0;
}

.h4 {
	/*nav消除間距*/
	margin: 0px;
}

#gotop:hover {
	/*button滑入不要背景顏色*/
	background-color: transparent;
}

input[type="text"] {
	text-align: center;
}

.st1 {
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: solid rgb(194, 193, 193) 1px;
}

.bg {
	background-image: url(Images/无缝的乱画猫和狗lineart背景-123270005\ \(2\).jpg);
}
</style>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<!--要include 的程式 最下面還有-->
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-2 bg"></div>
			<article class="col-md-8">

				<form action="../i19/insertMom" method="POST">
					<b>
						<div style="text-align: center;">
							<h4>
								<b>申請成為寵物保姆</b>
							</h4>
						</div>
					</b> <br> <br> <b>
						<div class="st1">保姆服務內容</div>
					</b> <br> <br>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<label for="idService">服務標題</label> <span class="uppercase">*</span>
						</div>
						<div class="col-md-5">
							<input type="text" class="form-control" id="idService"
								name="title" placeholder="請輸入服務標題" required=" ">
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<label for="idExperience">年資</label> <span class="uppercase">*</span>
						</div>
						<div class="col-md-2">
							<input type="number" class="form-control" id="idExperience"
								name="experience" value="0" min="0" max="99" required=" ">
						</div>
						<div style="line-height: 2.5rem; height: 2.5rem; padding-left: 0;">
							年</div>
					</div>
					<!-- 
					<br>

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<label for="idMount">最大接待數量</label>
							<span class="uppercase">*</span>
						</div>
						<div class="col-md-2">
							<input type="number" class="form-control" id="idMount" name="maxReceive" value="0" min="0"
								max="99" required=" ">
						</div>
						<div style="line-height:2.5rem;height:2.5rem;padding-left:0;">
							隻
						</div>
					</div> -->

					<br>

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<label for="notic">接待注意事項</label> <span class="uppercase">*</span>
						</div>
						<div class="col-md-7">
							<textarea class="form-control" name="notices" id="notic" rows="5"></textarea>
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<label for="serviceRefer">服務介紹</label> <span class="uppercase">*</span>
						</div>
						<div class="col-md-7">
							<textarea class="form-control" name="petContent"
								id="serviceRefer" rows="5"></textarea>
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<label for="serviceRefer">環境照片</label> <span class="uppercase">*</span>
						</div>

						<div class="col-md-7"
							style="height: 150px; border-radius: 5px; background-color: white; border: solid rgb(199, 197, 197) 1px;">
							<div>
								<div style="margin-top: 5px;">
									<input type="file" id="showimg" multiple />
									<div class='row'>
										<div id='previewMultiple'></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<br> <br> <b>
						<div class="st1">服務項目</div>
					</b> <br> <br>

					<div class="col-md-3">
						<label for="serviceRefer">項目與價格</label> <span class="uppercase">*</span>
					</div>


					<div class="input-group mb-3">
						<div class="col-md-4"></div>
						<div>
							<label for="check1">安親托育</label> <span class="uppercase">*</span>
							<input class="form-control inp" type="text" name="proPrice1"
								id="input1" placeholder="到府照顧的價錢">
						</div>
					</div>

					<div class="input-group mb-3">
						<div class="col-md-4"></div>
						<div>
							<label for="check2">寄宿照顧</label> <span class="uppercase">*</span>
							<input class="form-control inp" type="text" name="proPrice2"
								id="input2" placeholder="保姆家過夜的價格">
						</div>
					</div>


					<div class="input-group mb-3">
						<div class="col-md-4"></div>
						<div>
							<label for="check3">到府遛狗</label> <span class="uppercase">*</span>
							<input class="form-control inp" type="text" name="proPrice3"
								id="input3" placeholder="到府帶狗狗散步的價格">
						</div>
					</div>
					<div>

						<div class="col-md-3">
							<label for="serviceRefer">寵物體型</label> <span class="uppercase">*</span>
						</div>

						<div class="input-group mb-3">
							<div class="col-md-4"></div>
							<div>
								<input class="chk" name="bodyType1" type="checkbox" id="check5"
									value="迷你犬(0~4kg)"> <label for="check5"><small
									style="font-size: small;">小型犬(0~10kg)</small></label>
							</div>
						</div>

						<div class="input-group mb-3">
							<div class="col-md-4"></div>
							<div>
								<input class="chk" name="bodyType3" type="checkbox" id="check7"
									value="中型犬(10~24kg)"> <label for="check7"><small
									style="font-size: small;">中型犬(10~24kg)</small></label>
							</div>
						</div>

						<div class="input-group mb-3">
							<div class="col-md-4"></div>
							<div>
								<input class="chk" name="bodyType4" type="checkbox" id="check8"
									value="大型犬(24kg以上)"> <label for="check8"><small
									style="font-size: small;">大型犬(24kg以上)</small></label>
							</div>
						</div>

						<div class="input-group mb-3">
							<div class="col-md-4"></div>
							<div>
								<input class="chk" name="bodyType5" type="checkbox" id="check9"
									value="貓"> <label for="check9"> <small
									style="font-size: small;">貓</small></label>
							</div>
						</div>
					</div>

					<br>

					<div class="form-check" style="text-align: center;">

						<button type="submit" class="btn btn-primary" name="submit">送出</button>
					</div>
				</form>
			</article>
			<div class="col-md-2 bg"></div>
		</div>
	</div>

	<script>
		function isCheck() {
			let inpValue = document.getElementsByClassName("inp");
			let inpCount = 0;
			for (let i = 0; i < inpValue.length; i++) {
				//console.log(inpValue[i].value);
				if (inpValue[i].value > 0) {
					inpCount++;
				}
			}
			console.log(inpCount);
			if (inpCount < 1) {
				window.alert("服務價格 至少輸一個吧大哥");
				return false;
			}

			let chkValue = document.getElementsByClassName("chk");
			let chkCount = 0;
			for (let i = 0; i < chkValue.length; i++) {
				if (chkValue[i].checked == true) {
					chkCount++;
				}

			}
			console.log(chkCount);
			if (chkCount < 1) {
				window.alert("寵物品種 至少輸一個吧大哥");
				return false;
			} else {
				return true;
			}

		}
	</script>

	<script>
		$(document)
				.ready(
						function() {
							$("#showimg").change(function() {
								$("#previewMultiple").html(""); // 清除預覽
								readURL(this);
							});

							function readURL(input) {
								if (input.files && input.files.length >= 0) {
									for (var i = 0; i < input.files.length; i++) {
										var reader = new FileReader();
										reader.onload = function(e) {

											var img = '<div class=col-md-6><div class=thumbnail><img src="' + e.target.result + '"></div></div>';
											$("#previewMultiple").append(img);
										}
										reader.readAsDataURL(input.files[i]);
									}
								} else {
									var noPictures = $("<p>目前沒有圖片</p>");
									$("#previewMultiple").append(noPictures);
								}
							}

						});
	</script>

	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->


	<!-- TWzipcode的js
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	<script>
		$("#twzipcode_ADV").twzipcode({
			zipcodeIntoDistrict : true, // 郵遞區號自動顯示在地區
			css : [ "city form-control", "town form-control", ], // 自訂 "城市"、"地區" class 名稱 
			countyName : "city", // 自訂城市 select 標籤的 name 值
			districtName : "town" // 自訂地區 select 標籤的 name 值
		});
	</script> -->
</body>

</html>