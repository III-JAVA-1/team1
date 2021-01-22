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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">	
<link href="../Admin/css/Adminchart.css" rel="stylesheet">
<title>AccompanyMe</title>
</head>
<body>
	
	<nav class="navbar navbar-light bg-light display-4">
  		<div class="container-fluid" style="background-color:#81C0C0;">
    		<p class="nav-link mt-2">文章管理</p>
    		<div class="d-flex">
      		<a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
    		</div>
  		</div>
	</nav><br>
		<div class='row mainarea'>
		<div class="col-12 secondarea" onclick='doScreenShot(this)'>
		<div class='row justify-content-center h1 tooltipp'>本月文章發起熱度<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="hottime" width="100" height="30"></canvas>
		</div></div><br>
		
		<div class="row mainarea">
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">本月文章點閱率TOP3<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="clickamount" width="100" height="60"></canvas>
		</div>
		
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">文章類型比例<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="articletype" width="100" height="60"></canvas>
		</div>
		</div><br>
		
		<div class="detailtable">

		<div class="row justify-content-center display-4">
			文章總覽
		</div>
		<div class="row justify-content-center h4" id='articlecount'>	
		</div><br>
		
		<div class='row'>
			<div class='col'>
			<table class="table table-hover table-bordered h4" id='maintable'>
  			<thead style="background-color:#CAFFFF">
    		<tr><th scope="col">文章編號</th>
      			<th scope="col">文章名稱</th>
      			<th scope="col">文章子版</th>
      			<th scope="col">文章內容</th>
      			<th scope="col">點閱率</th>
      			<th scope="col">發文暱稱</th>
      			<th scope="col">發文時間</th>
      			<th scope="col" style='width:80px;' >留言數</th>
      			<th scope="col" style='width:50px;'>操作</th></tr>
  			</thead>
  			<tbody id="articletable">
  			</tbody>
			</table>
			
			
			<div class="row justify-content-center h2" id='tip'>
			</div>
			
			</div>
			
		</div>
		
	</div>

	<div id="gotop">
	</div>

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
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
	
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
    
    $.ajax({//網頁一開始載入第一頁文章
		url:"../Gusty/articlefull",
		type:"post",
		dataType:"json",
		async:false,
		data : {  	
        },
		success:function(data){
			$("#articlecount").html("&nbsp&nbsp文章總數:&nbsp&nbsp"+data.length);
			$.each(data,function(i,n){
				$("#articletable").append("<tr><th scope='row'>"+n[0]+"</th>"+
					"<td>"+n[1]+"</td>"+
					"<td>"+n[2]+"</td>"+
					"<td><button type='button' class='btn btn-warning' onclick='articledetail("+n[0]+")' >文章內容</button></td>"+
					"<td>"+n[3]+"</td>"+
					"<td>"+n[4]+"</td>"+
					"<td>"+n[7]+"</td>"+
					"<td><button type='button' class='btn btn-primary' onclick='comment("+n[0]+")' >留言數:&nbsp"+n[5]+"</button></td>"+
					"<td><button type='button' class='btn btn-danger' onclick='articledelete("+n[0]+")' >刪除</button></td></tr>");
			});
			$('#maintable').DataTable({
				"language": {
			        "processing": "處理中...",
			        "loadingRecords": "載入中...",
			        "lengthMenu": "顯示 _MENU_ 項結果",
			        "zeroRecords": "沒有符合的結果",
			        "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
			        "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
			        "infoFiltered": "(從 _MAX_ 項結果中過濾)",
			        "infoPostFix": "",
			        "search": "搜尋:",
			        "paginate": {
			            "first": "第一頁",
			            "previous": "上一頁",
			            "next": "下一頁",
			            "last": "最後一頁"
			        },
			        "aria": {
			            "sortAscending": ": 升冪排列",
			            "sortDescending": ": 降冪排列"
			        }
			    }
			})
		}
	});
    
    function comment(aid){//文章留言
    	//alert(aid)
    	Swal.fire({
  		  	title: '文章名稱:<div id="commentname"></div>',
  		  	html:"<table class='table table-hover table-bordered h4'>"+
  			"<thead style='background-color:#ADFEDC	'>"+
    		"<tr><th scope='col'>留言內容</th>"+
      			"<th scope='col'>留言時間</th>"+
      			"<th scope='col'>留言者暱稱</th>"+
      			"<th scope='col'>操作</th></tr>"+
  			"</thead>"+
  			"<tbody id='commentdetail'>"+
  			"</tbody>"+
			"</table>",
			width: '1000px',
  		confirmButtonText: '確定'
  		})
  		$.ajax({
  			url:"../Gusty/articlecomment",
  			type:"post",
  			dataType:"json",
  			async:false,
  			data : { 
  				"aid":aid,
  	        },
  			success:function(data){
  				$.each(data,function(i,n){	
  					if(i==0){$("#commentname").html(n[3])}
  					$("#commentdetail").append("<tr><th scope='row'>"+n[0]+"</th>"+
  						"<td>"+n[1]+"</td>"+
  						"<td>"+n[2]+"</td>"+
  						"<td><button type='button' class='btn btn-danger' onclick='commentdelete("+n[4]+")'>刪除</button></td></tr>");
  				});
  			}
  		});
    }
    
    function articledelete(aid){
    	Swal.fire({
    		  title: '請輸入刪除原因',
    		  html:'<div style="color:red;">**請注意刪除文章會連文章相關資料一併刪除**</div>',
    		  input: 'text',
    		  inputAttributes: {
    		    autocapitalize: 'off'
    		  },
    		  preConfirm: (login) => {
    		},
    		  showCancelButton: true,
    		  cancelButtonText: '取消',
    		  confirmButtonText: '確定',
    		  confirmButtonColor:'#FF0000',
    		  cancelButtonColor:'#0080FF',
    		}).then((result) => {
    		  if (result.isConfirmed) {
    			  if(result.value==null||result.value==""){
    				  swalWithBootstrapButtons.fire(
    					      '刪除原因不可為空',
    					      '請輸入刪除原因',
    					      'error'
    				 )
    			  }else{
    				  Swal.fire({
    					  title: '執行中,請稍後',
    					  timerProgressBar: true,
    					  timer:100,
    					  didOpen: () => {
    					    Swal.showLoading()
    					  },
    					}).then((resultt) => {
    						$.ajax({
   			         		url:"../Gusty/articledelete",
   			         		type:"post",
   			         		dataType:"json",
   			         		async:false,
   			         		data : { 
   			         			"aid":aid,
   			         			"message":result.value,
   			                 },
   			         		success:function(data){
   			         			Swal.fire({
   			         				title: '文章已刪除，已寄信告知發文者',
   			         				icon: 'success',
   			         			    showConfirmButton: false,
   			         				timer:1500,
   			         			}).then((result) => {
   			             			window.location.href='<c:url value='/Gusty/goadminabality?abality=Article'/>';
   			             		})
   			         		},error:function(){
   			         			alert("發生錯誤，請稍後再嘗試操作");
   			         		}
   			         	});
    				})
    			 }
    		  }
    		})
    }
    
    const swalWithBootstrapButtons = Swal.mixin({
    	  customClass: {
    	    confirmButton: 'btn btn-success',
    	    cancelButton: 'btn btn-danger'
    	  },
    	  buttonsStyling: false
    })
    
    function commentdelete(cid){//文章留言刪除
    	Swal.fire({
  		  title: '請輸入刪除原因',
  		  input: 'text',
  		  inputAttributes: {
  		    autocapitalize: 'off'
  		  },
  		  preConfirm: (login) => {
  		},
  		  showCancelButton: true,
  		  cancelButtonText: '取消',
  		  confirmButtonText: '確定',
  		  confirmButtonColor:'#FF0000',
  		  cancelButtonColor:'#0080FF',
  		}).then((result) => {
  		  if (result.isConfirmed) {
  			  if(result.value==null||result.value==""){
  				  swalWithBootstrapButtons.fire(
  					      '刪除原因不可為空',
  					      '請輸入刪除原因',
  					      'error'
  				 )
  			  }else{
  				  Swal.fire({
  					  title: '執行中,請稍後',
  					  timerProgressBar: true,
  					  timer:100,
  					  didOpen: () => {
  					    Swal.showLoading()
  					  },
  					}).then((resultt) => {
  						$.ajax({
  							url:"../Gusty/articlecommentdelete",
 			         		type:"post",
 			         		dataType:"json",
 			         		async:false,
 			         		data : { 
 			         			"cid":cid,
 			         			"message":result.value,
 			                 },
 			         		success:function(data){
 			         			Swal.fire({
 			         				title: '留言已刪除，已寄信告知留言者',
 			         				icon: 'success',
 			         			    showConfirmButton: false,
 			         				timer:1500,
 			         			}).then((result) => {
 			             			window.location.href='<c:url value='/Gusty/goadminabality?abality=Article'/>';
 			             		})
 			         		},error:function(){
 			         			alert("發生錯誤，請稍後再嘗試操作");
 			         		}
 			         	});
  				})
  			 }
  		  }
  		})
    
    }
    
    function articledetail(aid){//文章詳細內容
    	//alert(aid);
    	Swal.fire({
  		  	title: '文章名稱:<div id="mainname"></div>',
  		  	html:"<div id='content' style='text-align:left;'></div>",
			width: '1000px',
  		confirmButtonText: '確定'
  		})
  		$.ajax({
  			url:"../Gusty/articledetail",
  			type:"post",
  			dataType:"json",
  			async:false,
  			data : { 
  				"aid":aid,
  	        },
  			success:function(data){
  				$.each(data,function(i,n){	
  					$("#mainname").append(n[0]);
  					$("#content").append(n[1]);
  				});
  			}
  		});
    }
    
    var aricletypename=[]//子版名稱
    var articletypeamount=[]//子版數量
    $.ajax({
		url:"../Gusty/articletype",
		type:"post",
		dataType:"json",
		async:false,
		data : {  
        },
		success:function(data){
			$.each(data,function(i,n){				
				articletypeamount[i]=n[0]
				aricletypename[i]=n[1]
			});
		}
	});
    
    var articletype = document.getElementById("articletype").getContext('2d');//顯示文章子版比例
	var articletypeChart = new Chart(articletype, {
	    type: 'pie',
	    data: {
	        labels: aricletypename,
	        datasets: [{        
	            data: articletypeamount,
	            backgroundColor: [
	                'rgba(255, 99, 132)',
	                'rgba(54, 162, 235)',
	                '#CCFF80',
	                '#4F9D9D',
	            	'#0000C6',
	            	'#949449'
	            ],
	        }]
	    },options: {
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontColor: '#000000',
                    fontSize:25,
                }
            }
        }
	});
    
    var aricletop3name=[]//top3日期
    var articletop3amount=[]//top3點閱率
    $.ajax({
		url:"../Gusty/articletop3",
		type:"post",
		dataType:"json",
		async:false,
		data : {   
			"month" :new Date().getMonth()+1, 
        },
		success:function(data){
			$.each(data,function(i,n){
				if(n[0].length>10){
					n[0]=n[0].substring(0,10)+"..."
				}
				aricletop3name[i]=n[0]
				articletop3amount[i]=n[1]
			});
		}
	});
    
    var clickamount = document.getElementById('clickamount').getContext('2d');//點閱率top3
    var clickamountchart = new Chart(clickamount, {
        type: 'bar',
        data: {
            labels: aricletop3name,
            datasets: [{
                label: '點閱率',
                data: articletop3amount,
                backgroundColor: [
                    '#FF0080',
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
                        fontSize: 25,
                        suggestedMin: 0,
                    }
                }],
                xAxes: [{
                    ticks: {
                        fontSize: 18
                    }
                }]
            }
        }
    });
    
    var ariclehotday=[]//熱度日期
    var articlehotamount=[]//熱度數量
    $.ajax({
		url:"../Gusty/articlehot",
		type:"post",
		dataType:"json",
		async:false,
		data : {   
			"month" :new Date().getMonth()+1, 
        },
		success:function(data){
			$.each(data,function(i,n){				
				articlehotamount[i]=n[0]
				ariclehotday[i]=n[1]
			});
		}
	});
    
    var activehottime = document.getElementById("hottime").getContext('2d');//熱度時間
    var activehottimeChart = new Chart(activehottime, {
        type: 'line',
        data: {
            labels: ariclehotday,
            datasets: [{
                label: '當日文章發起數量',
                data: articlehotamount,
                fill: false,
                backgroundColor: '#3D7878',
                borderColor: '#D9B300',
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
                        fontSize: 25
                    }
                }]
            }
        }
    });
    
    
	</script>

</body>
</html>