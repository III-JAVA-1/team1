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
    		<p class="nav-link mt-2">活動管理</p>
    		<div class="d-flex">
      		<a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
    		</div>
  		</div>
	</nav><br>
	
		<div class='row mainarea'>
		<div class="col-12 secondarea" onclick='doScreenShot(this)'>
		<div class='row justify-content-center h1 tooltipp'>本月活動發起熱度<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="hottime" width="100" height="30"></canvas>
		</div></div><br>
		
		<div class="row mainarea">
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">參加人數TOP3的活動<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="joincount" width="100" height="60"></canvas>
		</div>
		
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">活動類型比例<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="activetype" width="100" height="60"></canvas>
		</div>
		</div><br>
		
		<div class='detailtable'>
		<div class="row justify-content-center " >
  			<ul class="nav nav-tabs ">
  				<li class="nav-item">
    				<a class="nav-link display-4 active" aria-current="page" href="" id="seeactive" onclick="return activeallgo()">活動一覽</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link display-4" href="" onclick="return activecheck()" id="checkactive">活動審核</a>
  				</li>
			</ul>
		</div><br>
		<div class="row justify-content-center h4">
		<div id='total'></div>
		</div>
		<div class='col'>
		<div class='row'>
			<div class='col'>
			<table class="table table-hover table-bordered h4" id='maintable'>
  			<thead style="background-color:#8080C0">
    		<tr><th scope="col">活動編號</th>
      			<th scope="col">活動名稱</th>
      			<th scope="col">活動新增時間</th>
      			<th scope="col">舉辦人姓名</th>
      			<th scope="col">舉辦人手機</th>
      			<th scope="col">活動類型</th>
      			<th scope="col">活動時間</th>
      			<th scope="col" id='contro'>參加人員</th></tr>
  			</thead>
  			<tbody id="allactive">
  			</tbody>
			</table>
			
			</div>
			
			<div class="row justify-content-center h4" id='tip'>
			</div>
			
		</div></div></div>
		
	<br>

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
    
    var change="go";
    function activeallgo(){//活動一覽
    	$("#tip").html("");
    	$('#maintable').DataTable().destroy()
    	change="go";
    	$("#checkactive").removeClass("active");
    	$("#seeactive").addClass("active");
    	$("#allactive").html("");
    	$.ajax({
    		url:"../Gusty/activeall",
    		type:"post",
    		dataType:"json",
    		async:false,
    		data : {
    		},
    		success:function(data){
    			$("#total").html("&nbsp&nbsp活動總數量&nbsp&nbsp"+data.length)
    			$("#contro").html("參加人員");
    			$.each(data,function(i,n){				
    				$("#allactive").append("<tr><th scope='row'>"+n[0]+"</th>"+
    						"<td><button type='button' onclick='activedetail("+n[0]+")' class='btn btn-warning'>詳細內容</button></td>"+
    						"<td >"+n[3]+"</td>"+
    						"<td>"+n[5]+"</td>"+
    						"<td>"+n[6]+"</td>"+
    						"<td>"+n[7]+"</td>"+
    						"<td style='width:140px;'>"+n[9].substring(0,10)+"<br>~<br>"+n[10].substring(0,10)+"</td>"+
    						"<td style='width:80px;'><button type='button' class='btn btn-info' onclick='joinpeople("+n[0]+")'>參加人數:&nbsp"+n[11]+"</button></td></tr>");
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
    	return false;
    }
    
    function activecheck(){//活動審核
    	$("#tip").html("");
    	$('#maintable').DataTable().destroy()
    	change="check";
    	$("#checkactive").addClass("active");
    	$("#seeactive").removeClass("active");
    	$("#allactive").html("");
    	$.ajax({
    		url:"../Gusty/activecheck",
    		type:"post",
    		dataType:"json",
    		async:false,
    		data : { 
    			                  
            },
    		success:function(data){
    			$("#total").html("&nbsp&nbsp待審核活動總數量&nbsp&nbsp"+data.length)
    			$("#contro").html("操作");
    			$.each(data,function(i,n){				
    				$("#allactive").append("<tr><th scope='row'>"+n[0]+"</th>"+
    						"<td><button type='button' onclick='activedetailcheck("+n[0]+")' class='btn btn-warning'>詳細內容</button></td>"+
    						"<td >"+n[3]+"</td>"+
    						"<td>"+n[5]+"</td>"+
    						"<td>"+n[6]+"</td>"+
    						"<td>"+n[7]+"</td>"+
    						"<td style='width:140px;'>"+n[9].substring(0,10)+"<br>~<br>"+n[10].substring(0,10)+"</td>"+
    						"<td style='width:80px;'><button type='button' class='btn btn-danger' onclick='deleteactive("+n[0]+")'>不予許</button><hr>"+
    						"&nbsp<button type='button' class='btn btn-primary' onclick='activeok("+n[0]+")'>通過</button>"+
    						"</td></tr>");
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
    		},error:function(){
    			$("#total").html("&nbsp&nbsp待審核活動總數量&nbsp&nbsp0")
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
    	return false;
    }
    
    function deleteactive(aid){//不予許活動通過
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
  							url:"../Gusty/activedelete",
 			         		type:"post",
 			         		dataType:"json",
 			         		async:false,
 			         		data : { 
 			         			"aid":aid,
 			         			"message":result.value,
 			                 },
 			         		success:function(data){
 			         			Swal.fire({
 			         				title: '活動不通過，已刪除活動和寄信通知發起人',
 			         				icon: 'success',
 			         			    showConfirmButton: false,
 			         				timer:1500,
 			         			}).then((result) => {
 			         				activecheck();
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
    
    function activeok(aid){//審核活動通過
    	
    	Swal.fire({
			  title: '執行中,請稍後',
			  timerProgressBar: true,
			  timer:100,
			  didOpen: () => {
			    Swal.showLoading()
			  },
			}).then((resultt) => {
				$.ajax({
					url:"../Gusty/activeok",
	         		type:"post",
	         		dataType:"json",
	         		async:false,
	         		data : { 
	        			"aid" :aid,                     
	                },
	         		success:function(data){
	         			Swal.fire({
	         				title: '活動審核通過，已寄信告知發起人',
	         				icon: 'success',
	         			    showConfirmButton: false,
	         				timer:1500,
	         			}).then((result) => {
	         				activecheck();
	             		})
	         		},error:function(){
	         			alert("發生錯誤，請稍後再嘗試操作");
	         		}
	         	});
		})
    }
    
    $.ajax({//一開啟網頁載入的活動一覽
		url:"../Gusty/activeall",
		type:"post",
		dataType:"json",
		async:false,
		data : {                 
        },
		success:function(data){
			$("#total").html("&nbsp&nbsp活動總數量&nbsp&nbsp"+data.length)
			$.each(data,function(i,n){				
				$("#allactive").append("<tr><th scope='row'>"+n[0]+"</th>"+
						"<td><button type='button' onclick='activedetail("+n[0]+")' class='btn btn-warning'>詳細內容</button></td>"+
						"<td >"+n[3]+"</td>"+
						"<td>"+n[5]+"</td>"+
						"<td>"+n[6]+"</td>"+
						"<td>"+n[7]+"</td>"+
						"<td style='width:140px;'>"+n[9].substring(0,10)+"<br>~<br>"+n[10].substring(0,10)+"</td>"+
						"<td style='width:80px;'><button type='button' class='btn btn-info' onclick='joinpeople("+n[0]+")'>參加人數:&nbsp"+n[11]+"</button></td></tr>");
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
    
    function joinpeople(aid){//顯示參加人員詳細資料
    	Swal.fire({
  		  	title: '活動名稱:<div id="mainname"></div>&nbsp參加人員',
  		  	html:"<table class='table table-hover table-bordered h4'>"+
  			"<thead style='background-color:#8080C0'>"+
    		"<tr><th scope='col'>名字</th>"+
      			"<th scope='col'>電郵</th>"+
      			"<th scope='col'>地址</th>"+
      			"<th scope='col'>攜帶寵物&數量</th>"+
      			"<th scope='col'>參加狀態</th>"+
      			"<th scope='col'>備註</th></tr>"+
  			"</thead>"+
  			"<tbody id='alljoinactive1'>"+
  			"</tbody>"+
			"</table>",
			width: '1000px',
  		confirmButtonText: '確定'
  		})
  		$.ajax({
  			url:"../Gusty/activejoinall",
  			type:"post",
  			dataType:"json",
  			async:false,
  			data : { 
  				"aid":aid,
  	        },
  			success:function(data){
  				$.each(data,function(i,n){	
  					if(i==0){$("#mainname").html(n[9])}
  					$("#alljoinactive1").append("<tr><th scope='row'>"+n[0]+"</th>"+
  						"<td>"+n[1]+"</td>"+
  						"<td>"+n[2]+n[3]+n[4]+"</td>"+
  						"<td>"+n[5]+"&nbsp&nbsp"+n[6]+"隻</td>"+
  						"<td>"+n[7]+"</td>"+
  						"<td>"+n[8]+"</td></tr>");
  				});
  			}
  		});
    }
    
    function activedetail(aid){//活動一覽的詳細活動內容
    	Swal.fire({
  		  	title: '活動名稱:<div id="namee"></div>&nbsp詳細活動內容',
  		  	html:"<img id='aimg' src='' style='width:500px;'><br>"+
  		  		"<div class='row justify-content-center h1'>活動內容:</div>"+
  		  		"<div id='content' class='h2'></div>"+
  				"<div class='row justify-content-center h1'>舉辦單位:</div>"+
  				"<div id='actionaunit' class='h2'></div>"+
  				"<div class='row justify-content-center h1'>活動地址:</div>"+
  				"<div id='actionaddress' class='h2'></div>",
			width: '1000px',
  		confirmButtonText: '確定'
  		})
  		$.ajax({
  			url:"../Gusty/activeall",
  			type:"post",
  			dataType:"json",
  			async:false,
  			data : {
  				
  	        },
  			success:function(data){
  				$.each(data,function(i,n){	
  					if(n[0]==aid){
  						$("#namee").html(n[1]);
  						$("#aimg").attr("src","<c:url value='/Gusty/getactiveimg?act_no="+n[0]+"'/>");
  						$("#content").html(n[2]);
  						$("#actionaunit").html(n[4]);
  						$("#actionaddress").html(n[8]);
  					}
  				});
  			}
  		});
    }
    
    function activedetailcheck(aid){//審核活動的詳細活動內容
    	Swal.fire({
  		  	title: '活動名稱:<div id="namee"></div>&nbsp詳細活動內容',
  		  	html:"<img id='aimg' src='' style='width:500px;'><br>"+
  		  		"<div class='row justify-content-center h1'>活動內容:</div>"+
  		  		"<div id='content' class='h2'></div>"+
  				"<div class='row justify-content-center h1'>舉辦單位:</div>"+
  				"<div id='actionaunit' class='h2'></div>"+
  				"<div class='row justify-content-center h1'>活動地址:</div>"+
  				"<div id='actionaddress' class='h2'></div>",
			width: '1000px',
  		confirmButtonText: '確定'
  		})
  		$.ajax({
  			url:"../Gusty/activecheck",
  			type:"post",
  			dataType:"json",
  			async:false,
  			data : {
  				
  	        },
  			success:function(data){
  				$.each(data,function(i,n){	
  					if(n[0]==aid){
  						$("#namee").html(n[1]);
  						$("#aimg").attr("src","<c:url value='/Gusty/getactiveimg?act_no="+n[0]+"'/>");
  						$("#content").html(n[2]);
  						$("#actionaunit").html(n[4]);
  						$("#actionaddress").html(n[8]);
  					}
  				});
  			}
  		});
    }
    
    var activehotday=[]
    var activehotamount=[]//發起時間熱度
    $.ajax({
		url:"../Gusty/activehottime",
		type:"post",
		dataType:"json",
		async:false,
		data : { 
			"month" :new Date().getMonth()+1,                     
        },
		success:function(data){
			$.each(data,function(i,n){				
				activehotday[i]=n[0]
				activehotamount[i]=n[1]
			});
		}
	});
    
    var joincountname=[]
    var joincountamount=[]//參加人數top3
    $.ajax({
		url:"../Gusty/activejointop3",
		type:"post",
		dataType:"json",
		async:false,
		data : {                    
        },
		success:function(data){
			$.each(data,function(i,n){	
				if(n[0].length>6){
					n[0]=n[0].substring(0,6)+"..."
				}
				joincountname[i]=n[0]
				joincountamount[i]=n[1]
			});
		}
	});
    
    var typename=[]
    var typeamount=[]//活動類型比例
    $.ajax({
		url:"../Gusty/activetype",
		type:"post",
		dataType:"json",
		async:false,
		data : {                    
        },
		success:function(data){
			$.each(data,function(i,n){				
				typename[i]=n[0]
				typeamount[i]=n[1]
			});
		}
	});
    
    //Chart.defaults.global.defaultFontSize = 16;
    
    var activehottime = document.getElementById("hottime").getContext('2d');//熱度時間
    var activehottimeChart = new Chart(activehottime, {
        type: 'line',
        data: {
            labels: activehotday,
            datasets: [{
                label: '當日活動發起數量',
                data: activehotamount,
                fill: false,
                backgroundColor: '#FF8040',
                borderColor: '#B766AD',
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
    
    var joincount = document.getElementById('joincount').getContext('2d');//參加人數top3
    var joincountchart = new Chart(joincount, {
        type: 'bar',
        data: {
            labels: joincountname,
            datasets: [{
                label: '參加人數',
                data: joincountamount,
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
                        fontSize: 20
                    }
                }]
            }
        }
    });
    
    var activetype = document.getElementById("activetype").getContext('2d');//顯示活動比例
	var myChart = new Chart(activetype, {
	    type: 'pie',
	    data: {
	        labels: typename,
	        datasets: [{        
	            data: typeamount,
	            backgroundColor: [
	                'rgba(255, 99, 132)',
	                'rgba(54, 162, 235)',
	                '#CCFF80',
	                '#4F9D9D'
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
	</script>

</body>
</html>