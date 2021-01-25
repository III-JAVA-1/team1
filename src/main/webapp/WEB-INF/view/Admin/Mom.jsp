<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<link href="../Admin/css/Adminchart.css" rel="stylesheet">
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath() + "/";
//這會顯示localhost+port號
%>

<title>AccompanyMe</title>

</head>
<body>

	<nav class="navbar navbar-light bg-light display-4">
		<div class="container-fluid" style="background-color: #81C0C0;">
			<p class="nav-link mt-2">保母管理</p>
			<div class="d-flex">
				<a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
			</div>
		</div>
	</nav>

	<br>
	
	<div class="row mainarea">
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">本月保母預約熱度<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="momhot" width="100" height="60"></canvas>
		</div>
		
		<div class="col-6 secondarea" onclick='doScreenShot(this)'>
		<div class="row justify-content-center h1 tooltipp">本月保母接單Top3<span class="tooltiptext h4">點我可下載png</span></div>
		<canvas id="momtop3" width="100" height="60"></canvas>
		</div>
	</div><br>
	
	<div class="detailtable">
	
		<div class="col">

			<div class="row justify-content-center">
				<div class='display-4'>全部保母資料</div>
			</div>
			<div class="row justify-content-center">
				<h4 id="count"></h4>
			</div>

			<table class="table table-hover table-bordered" id='maintable'>
				<thead class="h4" style="background-color:#ECFFFF;">
					<tr>
						<th scope="col" style='width:20px;'>編號</th>
						<th scope="col">環境照片</th>
						<th scope="col">服務名稱</th>
						<th scope="col"style='width:20px;'>年資</th>
						<th scope="col" style='width:90px;'>服務內容</th>
						<th scope="col" style='width:130px;'>服務項目</th>
						<th scope="col" style='width:150px;'>服務寵物</th>
						<th scope="col">評價</th>
						<th scope="col">操作</th>
					</tr>
				</thead>
				<tbody id="momtable">

				</tbody>
			</table>

			<div class="row justify-content-center">
				<h1 id="tip"></h1>
			</div>

		</div>

	</div>

	<div id="gotop"></div>

	<br>

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>

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
    
    $.ajax({
		url:"../Gusty/allmom",
		type:"post",
		dataType:"json",
		async:false,
		data : {                   
        },
		success:function(data){
		$.each(data,function(i,n){
			let count=0;
			$("#count").html("保母總數:&nbsp"+data.length);
			for(let i=5;i<8;i=i+1){
				if(n[i]==null){
					n[i]="未提供此服務"
				}
			}
			for(let i=8;i<12;i=i+1){
				if(n[i]==null){
					n[i]=""
				}else{
					if(count==0){
						count=count+1;
					}else{
						n[i]="<br>"+n[i]
					}
				}
			}
				$("#momtable").append("<tr style='font-size:20px;' ><th scope='row'>"+n[0]+"</th>"
						+"<td><img src='<c:url value='/mom/getPic?momId="+n[0]+"'/>'alt='沒有上傳圖片' style='width:100%; height:120px;'></td>"
						+"<td>"+n[1]+"</td>"
						+"<td>"+n[2]+"年</td>"
						+"<td><button type='button' class='btn btn-primary' onclick='momdetail("+n[0]+")' >點我查看</button></td>"
						+"<td>到府遛狗:&nbsp"+n[5]+"<br>安親照顧:&nbsp"+n[6]+"<br>寄宿照顧:&nbsp"+n[7]+"</td>"
						+"<td>"+n[8]+""+n[9]+""+n[10]+""+n[11]+"</td>"
						+"<td><button type='button' class='btn btn-info' onclick='mommessage("+n[0]+")'>點我查看</button></td>"
						+"<td><button type='button' class='btn btn-danger' onclick='deletemom("+n[0]+")'>刪除保母</button></td></tr>");
			});
		}
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
	
	function momdetail(mid){
    	//alert(mid)
    	Swal.fire({
  		  	title: '<div id="momname"></div>&nbsp注意事項&服務內容',
  		  	html:"<div class='h4'>注意事項:&nbsp</div>"+
  		  		 "<div id='notice'></div><hr>"+
  		  		 "<div class='h4'>服務內容:&nbsp</div>"+
  		  		 "<div id='content'></div>",
			width: '1000px',
  		confirmButtonText: '確定'
  		})
  		$.ajax({
  			url:"../Gusty/momdetail",
  			type:"post",
  			dataType:"json",
  			async:false,
  			data : {
  				"mid":mid,
  	        },
  			success:function(data){
  			$.each(data,function(i,n){
  					$("#momname").append(n[0])
  					$("#notice").append(n[1])
  					$("#content").append(n[2])
  				});
  			}
  		});
    }
    
    function mommessage(mid){
    	//alert(mid)
    	Swal.fire({
    		  title: '<div id="sub"></div>',
    		  html:"<table class='table table-hover table-bordered '>"+
    				'<thead class="h5" style="background-color:#C2C287;">'+
  				'<tr>'+
  					'<th scope="col">評價內容</th>'+
  					'<th scope="col">評價日期</th>'+
  					'<th scope="col">評價等級</th>'+
  					'<th scope="col">評價會員</th>'+
  				'</tr>'+
  			'</thead>'+
  			'<tbody id="evaluateetable" class="h5">'+
  			'</tbody>'+
  			'</table>'+
  			'<div id="tipp"></div>',
  			width: '800px',
    		confirmButtonText: '確定'
    		})
    		
    		$.ajax({
        		url:"../Gusty/mommessage",
        		type:"post",
        		dataType:"json",
        		data : { 
        			"mid" : mid
                },
        		success:function(data){
        			$.each(data,function(i,n){
        				$("#sub").html(n[0]+" 保母評價")
        				$("#evaluateetable").append("<tr><th scope='row'>"+n[1]+"</th>"+
        			   		"<td>"+n[2]+"</td>"+
        			   		"<td id=o"+n[5]+"></td>"+
        			   		"<td>"+n[4]+"</td></tr>");
        				if(n[3]>0){
        					for(let i=1;i<=5;i=i+1){
        						if(i<=n[3]){$("#o"+n[5]+"").append("★")}
        						else{$("#o"+n[5]+"").append("☆")}
        					}
        				}else{
        					$("#o"+n[5]+"").append("對方尚未評價")
        				}
        			});
        		},error:function(){
        			$("#tipp").append("尚未有評價")
        		}
        	});
    }
    
    function deletemom(mid){
    	
    	Swal.fire({
    		  title: '請輸入刪除原因',
    		  html:'<div style="color:red;">**刪除保母會連該保母的相關資料一併刪除**</div>',
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
    					  allowOutsideClick:false,
    					}).then((resultt) => {
    						$.ajax({
	    						url:"../Gusty/deletemom",
	   			         		type:"post",
	   			         		dataType:"json",
	   			         		async:false,
	   			         		data : { 
	   		        			"mid":mid,
	   		        			"message":result.value,
	   		                	},
	   			         		success:function(data){
	   			         			Swal.fire({
	   			         				title: '保母已刪除，已寄信告知',
	   			         				icon: 'success',
	   			         			    showConfirmButton: false,
	   			         				timer:1500,
	   			         			}).then((result) => {
	   			         				window.location.href='<c:url value='/Gusty/goadminabality?abality=Mom'/>';
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
  		
  	var momordertitletop3=[];//保母TOP3服務名稱
    var momorderamounttop3=[];//保母TOP3訂單數量
    $.ajax({
		url:"../Gusty/momordertop3",
		type:"post",
		dataType:"json",
		async:false,
		data : {   
			"month" :new Date().getMonth()+1, 
        },
		success:function(data){
			$.each(data,function(i,n){
				if(n[0].length>5){n[0]=n[0].substring(0,5)+"..."}
				momordertitletop3[i]=n[0]
				momorderamounttop3[i]=n[1]
			});
		}
	});
  		
  	var momordertop3 = document.getElementById('momtop3').getContext('2d');//預約數量top3
    var momordertop3chart = new Chart(momordertop3, {
        type: 'bar',
        data: {
            labels: momordertitletop3,
            datasets: [{
                label: '訂單數量',
                data: momorderamounttop3,
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
  		
    var momhotday=[];//熱度日期
    var momamount=[];//熱度數量
    $.ajax({
		url:"../Gusty/momhott",
		type:"post",
		dataType:"json",
		async:false,
		data : {   
			"month" :new Date().getMonth()+1, 
        },
		success:function(data){
			$.each(data,function(i,n){				
				momhotday[i]=n[0]
				momamount[i]=n[1]
			});
		}
	});
    
    var momhottime = document.getElementById("momhot").getContext('2d');//熱度時間
    var momhottimeChart = new Chart(momhottime, {
        type: 'line',
        data: {
            labels: momhotday,
            datasets: [{
                label: '當日保母預約訂單數量',
                data: momamount,
                fill: false,
                backgroundColor: '#8600FF',
                borderColor: '#FF0080',
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