<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
<title>AccompanyMe</title>
<style>

#map { /*google map 要給大小 不然不會顯示*/
	height: 500px;
	width: 100%;
}

#gotop {
		width:65px;
		height:65px;
    	position: fixed;
    	border-radius: 50px;
    	right: 20px;
    	bottom: 30px;
    	padding: 10px 16px;
    	background-repeat: no-repeat;
    	background-size: cover;
    	background-image: url("image/up.png");
    	color: white;
    	cursor: pointer;
    	z-index: 1000;
	}

</style>
</head>
<body>
<jsp:include page="Header.jsp"/>

<div class="container">
	
	<div class="d-flex justify-content-center">
		<div class="display-2">寵物店家</div>
	</div><br>
	
	<div class="row" id="map">
	</div><br>
	
	<div class="row">
		<div class="d-flex justify-content-center">
		<div class="h4">店家名字:&nbsp</div>
		<input type="text" class="form-control" style="width:200px;" id="storename">
		<div class="h4">&nbsp&nbsp&nbsp服務寵物:&nbsp</div>
		<select class="form-select" aria-label="Default select example" id="pettype" style="width:200px;">
  				<option selected value="">請選擇</option>
  				<option value="狗">狗</option>
  				<option value="貓">貓</option>
  				<option value="狗貓">狗貓</option>
		</select>
		<div class="h4">&nbsp&nbsp&nbsp店家分類:&nbsp</div>
		<select class="form-select" aria-label="Default select example" id="shoptype" style="width:200px;">
  				<option selected value="">請選擇</option>
  				<option value="寵物店">寵物店</option>
  				<option value="美容店">美容店</option>
		</select>
		<div>&nbsp&nbsp&nbsp</div>
		<button type="button" class="btn btn-primary" style="width:80px;" onclick="search()">搜尋</button>
		</div>
		
	</div><br>
		
		<div class="d-flex justify-content-center">
		<div class="h4" id="tip"></div>
		</div>
	
		<div class="row justify-content-center" id="shop">
		</div>
	
	<div class="d-flex justify-content-center">
		<div class="btn-group me-2" role="group" aria-label="First group" id="page">
<!--     	<button type="button" class="btn btn-primary">1</button> -->
  	</div></div>

</div>

<div id="gotop"></div>
<br>
<jsp:include page="Footer.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChBlcBS8CVWG0N3smlRpMO678wobs4bdA&callback=initMap"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>
var map, geocoder;
function initMap() {/*要用googleamp的初始參數設定*/
	var uluru = {
		lat : 24.95,
		lng : 121.2
	};/*經緯度 目前大約是台灣*/
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 12,/*放大比例*/
		center : uluru
	});
}

$("#gotop").click(function(){//回最上層JQUERY
    jQuery("html,body").animate({
        scrollTop:0
    },100);
});
$(window).scroll(function() {
    if ( $(this).scrollTop() > 300){
        $('#gotop').fadeIn("fast");
    } else {
        $('#gotop').stop().fadeOut("fast");
    }
});

$.ajax({
	url:"../Henry/allpetshop",
	type:"post",
	dataType:"json",
	success:function(data){
		
		for(let i=0;i<(data.length/12);i=i+1){
			//console.log(i);
			$("#page").append("<button type='button' class='btn btn-primary' onclick='pagechange(this)' value='"+(i+1)+"'>"+(i+1)+"</button>");
		}
		
		$.each(data,function(i,n){
			if(i>=0&&i<12){
				if(n.type=="美容店"){
					$("#shop").append("<div class='card m-3' style='width: 15rem;'>"+
				  			"<img src='"+n.image+"' onerror='imageerror(this)' class='card-img-top' alt='沒有圖片'>"+
				  			"<div class='card-body'>"+
				    		"<h5 class='card-title'>"+n.name+"</h5>"+
				    		"<p class='card-text'>"+n.address+"</p>"+
				    		"<p class='card-text'>服務寵物:&nbsp"+n.pet+"</p>"+
				    		"<p class='card-text'>"+n.phone+"</p><hr>"+
				    		"<a href='Salon_reserv.jsp?storename="+n.name+"' class='btn btn-primary'>預約服務</a>"+
				    		"<button onclick='addressdisplay(this)' value='"+n.address+","+n.name+"' class='btn btn-warning'>地圖顯示</a>"+
				  			"</div></div>");
				}else{
					$("#shop").append("<div class='card m-3' style='width: 15rem;'>"+
				  			"<img src='"+n.image+"' onerror='imageerror(this)' class='card-img-top' alt='沒有圖片'>"+
				  			"<div class='card-body'>"+
				    		"<h5 class='card-title'>"+n.name+"</h5>"+
				    		"<p class='card-text' onclick='addressdisplay(this)' value='"+n.address+"'>"+n.address+"</p>"+
				    		"<p class='card-text'>服務寵物:&nbsp"+n.pet+"</p>"+
				    		"<p class='card-text'>"+n.phone+"</p><hr>"+
				    		"<button onclick='addressdisplay(this)' value='"+n.address+","+n.name+"' class='btn btn-warning'>地圖顯示</a>"+
				  			"</div></div>");
				}
			}
		});
	}
});

function search(){
	$("#tip").html("");
	$("#page").html("");
	$("#shop").html("");
	$.ajax({
		url:"../Henry/allpetshop",
		type:"post",
		dataType:"json",
		data:{
			storename: $("#storename").val(),
			pettype: $("#pettype").val(),
			shoptype: $("#shoptype").val(),
		},
		success:function(data){
			for(let i=0;i<(data.length/12);i=i+1){
				//console.log(i);
				$("#page").append("<button type='button' class='btn btn-primary' onclick='pagechange(this)' value='"+(i+1)+"'>"+(i+1)+"</button>");
			}
			
			$.each(data,function(i,n){
				if(i>=0&&i<12){
					if(n.type=="美容店"){
						$("#shop").append("<div class='card m-3' style='width: 15rem;'>"+
					  			"<img src='"+n.image+"' onerror='imageerror(this)' class='card-img-top' alt='沒有圖片'>"+
					  			"<div class='card-body'>"+
					    		"<h5 class='card-title'>"+n.name+"</h5>"+
					    		"<p class='card-text'>"+n.address+"</p>"+
					    		"<p class='card-text'>服務寵物:&nbsp"+n.pet+"</p>"+
					    		"<p class='card-text'>"+n.phone+"</p><hr>"+
					    		"<a href='Salon_reserv.jsp?storename="+n.name+"' class='btn btn-primary'>預約服務</a>"+
					    		"<button onclick='addressdisplay(this)' value='"+n.address+","+n.name+"' class='btn btn-warning'>地圖顯示</a>"+
					  			"</div></div>");
					}else{
						$("#shop").append("<div class='card m-3' style='width: 15rem;'>"+
					  			"<img src='"+n.image+"' onerror='imageerror(this)' class='card-img-top' alt='沒有圖片'>"+
					  			"<div class='card-body'>"+
					    		"<h5 class='card-title'>"+n.name+"</h5>"+
					    		"<p class='card-text' onclick='addressdisplay(this)' value='"+n.address+"'>"+n.address+"</p>"+
					    		"<p class='card-text'>服務寵物:&nbsp"+n.pet+"</p>"+
					    		"<p class='card-text'>"+n.phone+"</p><hr>"+
					    		"<button onclick='addressdisplay(this)' value='"+n.address+","+n.name+"' class='btn btn-warning'>地圖顯示</a>"+
					  			"</div></div>");
					}
				}
			});
		},
		error:function(){
			$("#tip").html("沒有相關資料");
		}
	});
}

function pagechange(page){
	console.log($(page).val());
	$("#tip").html("");
	$("#page").html("");
	$("#shop").html("");
	$.ajax({
		url:"../Henry/allpetshop",
		type:"post",
		dataType:"json",
		data:{
			storename: $("#storename").val(),
			pettype: $("#pettype").val(),
			shoptype: $("#shoptype").val(),
		},
		success:function(data){
			for(let i=0;i<(data.length/12);i=i+1){
				//console.log(i);
				$("#page").append("<button type='button' class='btn btn-primary' onclick='pagechange(this)' value='"+(i+1)+"'>"+(i+1)+"</button>");
			}
			
			$.each(data,function(i,n){
				if(i+1>=$(page).val()*12-12+1&&i+1<=$(page).val()*12){
					if(n.type=="美容店"){
						$("#shop").append("<div class='card m-3' style='width: 15rem;'>"+
					  			"<img src='"+n.image+"' onerror='imageerror(this)' class='card-img-top' alt='沒有圖片'>"+
					  			"<div class='card-body'>"+
					    		"<h5 class='card-title'>"+n.name+"</h5>"+
					    		"<p class='card-text'>"+n.address+"</p>"+
					    		"<p class='card-text'>服務寵物:&nbsp"+n.pet+"</p>"+
					    		"<p class='card-text'>"+n.phone+"</p><hr>"+
					    		"<a href='Salon_reserv.jsp?storename="+n.name+"' class='btn btn-primary'>預約服務</a>"+
					    		"<button onclick='addressdisplay(this)' value='"+n.address+","+n.name+"' class='btn btn-warning'>地圖顯示</a>"+
					  			"</div></div>");
					}else{
						$("#shop").append("<div class='card m-3' style='width: 15rem;'>"+
					  			"<img src='"+n.image+"' onerror='imageerror(this)' class='card-img-top' alt='沒有圖片'>"+
					  			"<div class='card-body'>"+
					    		"<h5 class='card-title'>"+n.name+"</h5>"+
					    		"<p class='card-text' onclick='addressdisplay(this)' value='"+n.address+"'>"+n.address+"</p>"+
					    		"<p class='card-text'>服務寵物:&nbsp"+n.pet+"</p>"+
					    		"<p class='card-text'>"+n.phone+"</p><hr>"+
					    		"<button onclick='addressdisplay(this)' value='"+n.address+","+n.name+"' class='btn btn-warning'>地圖顯示</a>"+
					  			"</div></div>");
					}
				}
			});
		},
		error:function(){
			$("#tip").html("沒有相關資料");
		}
	});
}

function imageerror(images){
	$(images).attr("src","image/photo.png");
}


function addressdisplay(address) {
	$('html, body').scrollTop(0);
	var uluru = {
			lat : 24.95,
			lng : 121.2
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 12,
			center : uluru
		});
	geocoder = new google.maps.Geocoder();
	 console.log($(address).val().substring(0,$(address).val().indexOf(",")));
	  geocoder.geocode({
	    'address': $(address).val().substring(0,$(address).val().indexOf(","))
	  }, function(results, status) {
	    if (status == 'OK') {
	      map.setCenter(results[0].geometry.location);
	      var marker = new google.maps.Marker({
	        map: map,
	        position: results[0].geometry.location,
	        animation: google.maps.Animation.DROP,
	        title:$(address).val().substring($(address).val().indexOf(",")+1),
	      });
	    } else {
	      console.log(status);
	    }
	  });
}

</script>

</body>
</html>