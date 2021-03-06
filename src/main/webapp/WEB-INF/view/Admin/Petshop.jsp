<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
<link href="../Admin/css/style.css" rel="stylesheet" media="screen">
<link href="../Admin/css/mobile-style.css" rel="stylesheet" media="screen">
<link href="../Admin/css/Adminchart.css" rel="stylesheet">
<title>AccompanyMe</title>

</head>
<body>
	
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">店家管理</p>
    		<div class="d-flex">
      		<a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
    		</div>
  		</div>
	</nav><br>
		
		<div class="row mainarea">
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">本月店面預約熱度<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="petshophot" width="100" height="60"></canvas>
		</div>
		
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">本月預約店家Top3<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="petshoptop3" width="100" height="60"></canvas>
		</div>
	 	</div><br>
	 	
	 <div class="detailtable">
		
		<div class='col collapse' id='addshop' style='border: 5px #B766AD ridge;'>
		
		<div class="row justify-content-center display-4">新增商店</div><br>
		
		<form action="../Gusty/petshopadd" method="post">
		<div class="row justify-content-center h4">
		<div class="input-group mb-3 col-6">
  		<span class="input-group-text" id="basic-addon1">商店名稱</span>
  		<input type="text" class="form-control" name='name' id='name' placeholder="請輸入商店名稱" required="required" aria-label="Username" aria-describedby="basic-addon1">
		</div></div>
		
		<div class="row justify-content-center h4">
		<div class="input-group mb-3 col-6">
  		<span class="input-group-text" id="basic-addon1">商店地址</span>
  		<input type="text" class="form-control" name='address' id='address' placeholder="請輸入商店地址" required="required" aria-label="Username" aria-describedby="basic-addon1">
		</div></div>
		
		<div class="row justify-content-center h4">
		<div class="input-group mb-3 col-6">
  		<span class="input-group-text" id="basic-addon1">聯絡手機</span>
  		<input type="text" class="form-control" name='phone' id='phone' placeholder="請輸入商店手機" required="required" maxlength="10" aria-label="Username" aria-describedby="basic-addon1">
		</div></div>
		
		<div class="row justify-content-center h4">
		<div class="form-check form-check-inline">商店類型:&nbsp&nbsp
  		<input class="form-check-input" type="radio" id="beautiful" value="美容店" required="required" name="type">
  		<label class="form-check-label" for="beautiful">美容店</label></div>
		<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" id="pet" value="寵物店" required="required" name="type">
  		<label class="form-check-label" for="pet">寵物店</label></div>
		<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" id="other" value="其他" required="required" name="type">
  		<label class="form-check-label" for="other">其他</label>
		</div></div>
		
		<div class="row justify-content-center h4">
		<div class="form-check form-check-inline">服務寵物:&nbsp&nbsp
  		<input class="form-check-input" type="radio" id="dog" value="狗" name="pet" required="required">
  		<label class="form-check-label" for="dog">狗&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></div>
		<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" id="cat" value="貓" name="pet" required="required">
  		<label class="form-check-label" for="cat">貓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></div>
		<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" id="dogcat" value="狗貓" name="pet" required="required">
  		<label class="form-check-label" for="dogcat">都有</label>
		</div></div><br>
		
		<div class="dropzone">
        <div class="info"></div>
    	</div><br>
		
		<div class="row justify-content-center h1">
		<button type="submit" class="btn btn-primary m-3">送出</button>
		<button type="button" class="btn btn-info m-3" onclick='autogogo()'>一鍵</button>
		</div>
		
		</form>
		</div><br>

		<div class="row justify-content-center display-4">
			店家總覽
		</div><br>
	
		<div class="row justify-content-center h4">
		<button type="button" onclick='addshow()' class="btn btn-info" style='height:40px;' data-toggle="collapse" data-target="#addshop" aria-expanded="false" aria-controls="addshop">新增店家</button>
		&nbsp&nbsp店家名稱關鍵字搜尋&nbsp&nbsp<input type="text" class = 'form-group' name="search" id="search">
		<p id='petshopcount'></p>
		</div>
		
		<div class='row justify-content-center' id='allstore'>
		</div>
		
		<div class="row justify-content-center h2" id='tip'>
		</div>
		
		<div class="row justify-content-center">
		<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
  		<div class="btn-group me-2" role="group" aria-label="First group" id='pagecount'>
<!--     		<button type="button" class="btn btn-primary">1</button> -->
  		</div></div>
		</div>
		
	</div>
	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">修改店家</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <img src='' onerror='findimg(this)' style='width:100%;height:250px;' id='previewedit'/>
<!--       <img src='' onerror='findimg(this)' style='width:100%;height:250px;' id='newimg' alt='無法預覽，尚未上傳圖片'> -->
        <form action="../Gusty/editpetshopgo" method="post" enctype="multipart/form-data">
        	<input type="hidden" class="form-control" id='editid' name='id'>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">圖片:</label>
            <input type="file" class="form-control" id='editimg' name='imgg'>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">店家名稱:</label>
            <input type="text" class="form-control" required="required" id='editname' name='name'>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">地址:</label>
            <input type="text" class="form-control" required="required" id='editaddress' name='address'>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">手機:</label>
            <input type="text" class="form-control" required="required" id='editphone' name='phone'>
          </div>
          <div class="form-group">
            <div class="form-check form-check-inline">商店類型:&nbsp&nbsp
  			<input class="form-check-input edittype" type="radio" id="editbeautiful" value="美容店" required="required" name="type">
  			<label class="form-check-label" for="beautiful">美容店</label></div>
			<div class="form-check form-check-inline">
  			<input class="form-check-input edittype" type="radio" id="editpet" value="寵物店" required="required" name="type">
  			<label class="form-check-label" for="pet">寵物店</label></div>
			<div class="form-check form-check-inline">
  			<input class="form-check-input edittype" type="radio" id="editother" value="其他" required="required" name="type">
  			<label class="form-check-label" for="other">其他</label></div>
          </div>
          <div class="form-group">
            <div class="form-check form-check-inline">服務寵物:&nbsp&nbsp
  			<input class="form-check-input editpet" type="radio" id="editdog" value="狗" name="pet" required="required">
  			<label class="form-check-label" for="dog">狗&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></div>
			<div class="form-check form-check-inline">
  			<input class="form-check-input editpet" type="radio" id="editcat" value="貓" name="pet" required="required">
  			<label class="form-check-label" for="cat">貓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></div>
			<div class="form-check form-check-inline">
  			<input class="form-check-input editpet" type="radio" id="editdogcat" value="狗貓" name="pet" required="required">
  			<label class="form-check-label" for="dogcat">都有</label></div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">確定修改</button>
      </div>
      </form>
    </div>
  </div>
</div>

	<div id="gotop">
	</div><br>

	<script type="text/javascript" src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.js"></script>
	<script type="text/javascript" src="../Admin/Js/chartscheenshot.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript" src="../Admin/Js/imgur.js"></script>
    <script type="text/javascript" src="../Admin/Js/upload.js"></script>
	
	<script>
	
	$("#gotop").click(function(){//回最上層JQUERY
        jQuery("html,body").animate({
            scrollTop:0
        },1000);
    });
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 300){
            $('#gotop').fadeIn("fast");
        } else {
            $('#gotop').stop().fadeOut("fast");
        }
    });
    
    function autogogo(){
    	$("#name").val("魚中魚貓狗水族大賣場")
    	$("#address").val("新北市板橋區中山路一段248號")
    	$("#phone").val("02-29546690")
    	$("input[name=type][value=其他]").attr('checked',true);
    	$("input[name=pet][value=其他]").attr('checked',true);
    }
    
    $("#search").change(function(){
    	let pagee
    	if($("#search").val()==null||$("#search").val()==""){
    		pagee=1;
    	}
    	$("#tip").html("");
    	$("#allstore").html("");
    	$.ajax({
    		url:"../Gusty/petshopall",
    		type:"post",
    		dataType:"json",
    		async:false,
    		data : { 
    			"search":$("#search").val(),
    			"page":pagee,
            },
    		success:function(data){
    			$.each(data,function(i,n){
    				$("#allstore").append("<div class='card m-3' style='width: 16rem;'>"+
    	  			"<img src='"+n[6]+"' id='photo' onerror='findimg(this)' class='card-img-top noimg' alt='' style='width:100%;height:200px;border:2px #796400 solid;'>"+
    	  			"<div class='card-body'>"+
    	  			"<h5 class='card-title'>"+n[1]+"</h5>"+
    	    		"<p class='card-text'>"+n[2]+"</p>"+
    	    		"<p class='card-text'>"+n[3]+"</p>"+
    	    		"<p class='card-text'>商店類型:&nbsp"+n[4]+"</p>"+
    	    		"<p class='card-text'>服務寵物:&nbsp"+n[5]+"</p>"+
    	    		"<p class='card-text'><button type='button' class='btn btn-primary mr-1' onclick='editshop("+n[0]+")' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo'>修改店家</button>"+
    	    		"<button type='button' class='btn btn-danger' onclick='deletestore("+n[0]+")' >刪除店家</button></p>"+
    	  			"</div></div>");
    			});
    		},error:function(){
    			$("#tip").html("沒有找到相關資料")
    		}
    	});
    })
    
    $.ajax({
		url:"../Gusty/petshopall",
		type:"post",
		dataType:"json",
		async:false,
		data : { 
			"search":"",
			"page":"",
        },
		success:function(data){
			$("#petshopcount").html("&nbsp&nbsp店家總數:&nbsp"+data.length);
			for(let i=0;i<data.length/12;i=i+1){
				$("#pagecount").append("<button type='button' class='btn btn-primary' onclick='pagechange("+(i+1)+")'>"+(i+1)+"</button>");
			}
			$.each(data,function(i,n){	
				if(i>=12){return false;}
				$("#allstore").append("<div class='card m-3' style='width: 16rem;'>"+
	  			"<img src='"+n[6]+"' id='photo' onerror='findimg(this)' class='card-img-top noimg' alt='' style='width:100%;height:200px;border:2px #796400 solid;'>"+
	  			"<div class='card-body'>"+
	  			"<h5 class='card-title'>"+n[1]+"</h5>"+
	    		"<p class='card-text'>"+n[2]+"</p>"+
	    		"<p class='card-text'>"+n[3]+"</p>"+
	    		"<p class='card-text'>商店類型:&nbsp"+n[4]+"</p>"+
	    		"<p class='card-text'>服務寵物:&nbsp"+n[5]+"</p>"+
	    		"<p class='card-text'><button type='button' class='btn btn-primary mr-1' onclick='editshop("+n[0]+")' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo'>修改店家</button>"+
	    		"<button type='button' class='btn btn-danger' onclick='deletestore("+n[0]+")' >刪除店家</button></p>"+
	  			"</div></div>");
			});
		}
	});
    
    function pagechange(page){
    	$("#allstore").html("");
    	$.ajax({
    		url:"../Gusty/petshopall",
    		type:"post",
    		dataType:"json",
    		async:false,
    		data : { 
    			"search":"",
    			"page":page,
            },
    		success:function(data){
    			$.each(data,function(i,n){
    				$("#allstore").append("<div class='card m-3' style='width:16rem;'>"+
    	  			"<img src='"+n[6]+"' id='photo' onerror='findimg(this)' class='card-img-top' alt='' style='width:100%;height:200px;border:2px #796400 solid;'>"+
    	  			"<div class='card-body'>"+
    	  			"<h5 class='card-title'>"+n[1]+"</h5>"+
    	    		"<p class='card-text'>"+n[2]+"</p>"+
    	    		"<p class='card-text'>"+n[3]+"</p>"+
    	    		"<p class='card-text'>商店類型:&nbsp"+n[4]+"</p>"+
    	    		"<p class='card-text'>服務寵物:&nbsp"+n[5]+"</p>"+
    	    		"<p class='card-text'><button type='button' class='btn btn-primary mr-1' onclick='editshop("+n[0]+")' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo'>修改店家</button>"+
    	    		"<button type='button' class='btn btn-danger' onclick='deletestore("+n[0]+")' >刪除店家</button></p>"+
    	  			"</div></div>");
    			});
    		}
    	});
    }
    
    function editshop(id){
    	//alert(storename)
    	$.ajax({
    		url:"../Gusty/editpetshop",
    		type:"post",
    		dataType:"json",
    		async:false,
    		data : { 
    			"id":id,
            },
    		success:function(data){
    			$.each(data,function(i,n){
    				if(n[6].indexOf("image")==0){n[6]="../Petshop/"+n[6]}
    				$("#editid").val(n[0])
    				$("#previewedit").attr("src",n[6])
					$("#editname").val(n[1])
					$("#editaddress").val(n[2])
					$("#editphone").val(n[3])
					$(".edittype[name=type][value="+n[4]+"]").attr('checked',true);
					$(".editpet[name=pet][value="+n[5]+"]").attr('checked',true);
    			});
    		}
    	});
    }
    
    $("#editimg").change(function(){
        //當檔案改變後，做一些事 
       readURL(this);   // this代表<input id="imgInp">
     });
     function readURL(input){
    	  if(input.files && input.files[0]){
    	    var reader = new FileReader();
    	    reader.onload = function (e) {
    	       $("#previewedit").attr('src', e.target.result);
    	    }
    	    reader.readAsDataURL(input.files[0]);
    	  }
    	}
     
    function deletestore(sid){
    	$.ajax({
    		url:"../Gusty/petshopdelete",
    		type:"post",
    		dataType:"json",
    		async:false,
    		data : { 
    			"sid":sid,
            },
    		success:function(data){
    			Swal.fire({
    				title: '刪除成功',
    				icon: 'success',
    				confirmButtonText: '確定'
    				}).then((result) => {
    				if (result.isConfirmed) {
    					history.go(0);
    			}})
    		}
    	});
    }
    
    function findimg(replaceimg){
    	if($(replaceimg).attr("src").indexOf("image")>=0){
    		$(replaceimg).attr("src","../Petshop/"+$(replaceimg).attr('src'))
    	}else{
    		$(replaceimg).attr("src","../Admin/image/photo.png")
    	}
    	
    }
    
    var petshoptop3name=[]//top3名稱
    var petshoptop3amount=[]//top3數量
    $.ajax({
		url:"../Gusty/petshoptop3",
		type:"post",
		dataType:"json",
		async:false,
		data : {   
        },
		success:function(data){
			$.each(data,function(i,n){				
				petshoptop3name[i]=n[0]
				petshoptop3amount[i]=n[1]
			});
		}
	});
    
    var petshoptop3 = document.getElementById('petshoptop3').getContext('2d');//預約數量top3
    var petshoptop3chart = new Chart(petshoptop3, {
        type: 'bar',
        data: {
            labels: petshoptop3name,
            datasets: [{
                label: '訂單數量',
                data: petshoptop3amount,
                backgroundColor: [
                    '#005AB5',
                    '#FF0000',
                    '#9F35FF'  
                ],
                borderWidth: 2,
            }]
        },options: {
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontColor: '#000000',
                    fontSize:25,
                }
            },scales: {
                yAxes: [{
                    ticks: {
                    	suggestedMin: 0,
                        fontSize: 25,
                    }
                }],
                xAxes: [{
                    ticks: {
                        fontSize: 18,
                    }
                }]
            }
        }
    });
    
    var petshophotday=[];//熱度日期
    var petshopamount=[];//熱度數量
    $.ajax({
		url:"../Gusty/petshophot",
		type:"post",
		dataType:"json",
		async:false,
		data : {   
			"month" :new Date().getMonth()+1, 
        },
		success:function(data){
			$.each(data,function(i,n){				
				petshopamount[i]=n[0]
				petshophotday[i]=n[1]
			});
		}
	});
    
    var petshophottime = document.getElementById("petshophot").getContext('2d');//熱度時間
    var petshophotChart = new Chart(petshophottime, {
        type: 'line',
        data: {
            labels: petshophotday,
            datasets: [{
                label: '當日預約訂單數量',
                data: petshopamount,
                fill: false,
                backgroundColor: '#424200',
                borderColor: '#00CACA',
                borderWidth: 5,
                pointBorderWidth:'5px',
            }], 
        },options: {
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontColor: '#000000',
                    fontSize:25,
                }
            },scales: {
                yAxes: [{
                    ticks: {
                        fontSize: 25
                    }
                }],
                xAxes: [{
                    ticks: {
                        fontSize: 20
                    }
                }]
            }
        }
    });
    
	</script>

</body>
</html>