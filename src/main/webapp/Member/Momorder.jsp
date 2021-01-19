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
	<%
	String basePath = request.getScheme()+"://"+
		request.getServerName()+":"+request.getServerPort()+
		request.getContextPath()+"/";
		//這會顯示localhost+port號
	%>
	
<title>AccompanyMe</title>
<style>

	a{
    	text-decoration:none;
	}
	
	#title{
		background-color: aqua;
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
	<br>
	
	<div class="container">
	
		<div class="row justify-content-center" id="title">
    		<div class="display-1"><img src="image/title.png" style="width:150px; height:150px;">會員專區</div>
  		</div><hr>
  		
  		<div class="row">
  		
  			<div class="col-3">
  				<div class="list-group">
 					<a href="Member.jsp" class="list-group-item list-group-item-action h4 " aria-current="true">
    					<img src="image/pawprintb.png">會員基本資料
  					</a>
  					<a href="Editmom.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >保母資料修改</a>
  					<a href="Momorder.jsp" class="list-group-item list-group-item-action h4 active"><img src="image/pawprintb.png" >保母訂單查詢</a>
  					<a href="Shoporder.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商城訂單紀錄</a>
  					<a href="Action.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >活動/課程查詢</a>
  					<a href="Petshop.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >店家預約訂單</a>
  					<a href="Favoritestore.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >我的收藏</a>
  					<a href="Evaluation.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >商品評價</a>
  					<a href="Article.jsp" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >論壇紀錄查詢</a>
  					<a href="<c:url value='/Gusty/logout'/>" class="list-group-item list-group-item-action h4"><img src="image/pawprintb.png" >登出</a>
				</div>
  			</div>
  		
  			<div class="col-9">
  			
  			<div class="row justify-content-center">
    			<div class="display-4">保母訂單紀錄</div>
  			</div><br>
  			
  			<div class="row justify-content-center h4">
    			<ul class="nav nav-pills nav-fill">
  					<li class="nav-item">
    					<a class="nav-link active" aria-current="page" id="mymom" href="#" onclick="return momchange('我的保母訂單')">我的保母訂單</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="#" id="othermom" onclick="return momchange('我預約的保母訂單')">我預約的保母訂單</a>
  					</li>
				</ul>
  			</div><br>
  			
  			<div class="row justify-content-start h5">
				<table class="table table-hover table-bordered " id='maintable'>
  				<thead class="h4" style="background-color:#FFE66F;">
    				<tr>
      					<th scope="col">服務地址</th>
      					<th scope="col" style='width:170px;'>服務時間</th>
      					<th scope="col">寵物資訊</th>
      					<th scope="col">服務項目</th>
      					<th scope="col">總金額</th>
      					<th scope="col">評價</th>
      					<th scope="col">狀態</th>
    				</tr>
  				</thead>
  				<tbody id="mymomtable" class="h5">
  				</tbody>
  			</table>
  			</div>
  			
  			<div class="row justify-content-center" >
			<div class="h4" id="tip"></div>
			</div>
			
  			</div>
  			
  		</div>
	</div>
	
	<div id="gotop">
	</div>
	
	<br>
	
	<jsp:include page="Footer.jsp"/>

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
    
    $.ajax({
		url:"../Gusty/mymomorder",
		type:"post",
		//async : false,//要賦值給全域變數要改false
		dataType:"json",
		data : { 
			"mid" : <%=session.getAttribute("user")%>,
        },
		success:function(data){
			$('#maintable').DataTable().destroy()
			$.each(data,function(i,n){
				$("#mymomtable").append("<tr><th scope='row'>"+n[0]+""+n[1]+""+n[2]+"</th>"+
			   			"<td>"+n[3].substring(0,16)+"&nbsp~&nbsp<br>"+n[4].substring(0,16)+"</td>"+
			   			"<td><button type='button' onclick='petdetail("+n[8]+")' class='btn btn-success'>寵物資訊</button></td>"+
			   			"<td>"+n[5]+"</td>"+
			   			"<td>"+n[6]+"</td>"+
			   			"<td id='a"+n[8]+"'></td>"+
			   			"<td id='"+n[8]+"'></td></tr>");
				if(n[7]=="處理中"){
					$("#a"+n[8]+"").append("尚未接受訂單");
					$("#"+n[8]+"").append("<button type='button' onclick='accept("+n[8]+")' class='btn btn-info'>接受</button>"
						+"<hr><button type='button' onclick='reject("+n[8]+")' class='btn btn-danger'>拒絕</button>");
				}else if(n[7]=='拒絕'){
					$("#a"+n[8]+"").append("訂單已被拒絕");
					$("#"+n[8]+"").append(n[7]);
				}
				else{
					$("#a"+n[8]+"").append("<button type='button' onclick='evaluatee("+n[8]+")' class='btn btn-dark'>點我查看</button>");
					$("#"+n[8]+"").append(n[7]);
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
		},error:function(){
			$('#maintable').DataTable().destroy()
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
    
    function petdetail(oid){//寵物詳細資訊
    	//alert(oid)
    	Swal.fire({
  		  title: '寵物詳細資訊',
  		  html:"<img src='<c:url value='/Gusty/momorderimg?oid="+oid+"'/>'  style='width:400px;height:350px;'>"+
  			  "<div class='h4'><div id='pett'></div>"+
  			  "<div id='pettype'></div>"+
  			  "<div id='remark'></div></div>",
  		confirmButtonText: '確定',
  		})
    	$.ajax({
    		url:"../Gusty/mymomorderpetdetail",
    		type:"post",
    		//async : false,//要賦值給全域變數要改false
    		dataType:"json",
    		data : { 
    			"oid" : oid,
            },
    		success:function(data){
    			$.each(data,function(i,n){
					$("#pett").append("名字: "+n[0]+"<br>性別: "+n[1]+"<br>種類: "+n[2]+"<br>年齡: "+n[3]+"<hr>");
					$("#pettype").html("寵物類型: "+n[4]+"<hr>");
					$("#remark").html("備註: "+n[5]);
    			});
    		},
    	});
    }
    
    function accept(oid){//接受訂單
    	Swal.fire({
			  title: '執行中,請稍後',
			  timerProgressBar: true,
			  timer:100,
			  didOpen: () => {
			    Swal.showLoading()
			  },
			}).then((resultt) => {
				$.ajax({
					url:"../Gusty/momorderaccept",
	         		type:"post",
	         		dataType:"json",
	         		async:false,
	         		data : { 
	        			"oid" :oid,                     
	                },
	         		success:function(data){
	         			Swal.fire({
	         				title: '訂單已接受，已寄信通知顧客',
	         				icon: 'success',
	         			    showConfirmButton: false,
	         				timer:1500,
	         			}).then((result) => {
	         				window.location.reload()
	             		})
	         		},error:function(){
	         			alert("發生錯誤，請稍後再嘗試操作");
	         		}
	         	});
		})
    }
    
    function reject(oid){//拒絕訂單
    	Swal.fire({
    		  title: '請輸入拒絕原因',
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
    					      '拒絕原因不可為空',
    					      '請輸入拒絕原因',
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
    							url:"../Gusty/rejectmomorder",
   			         		type:"post",
   			         		dataType:"json",
   			         		async:false,
   			         		data : { 
   			         			"oid":oid,
   			         			"message":result.value,
   			                 },
   			         		success:function(data){
   			         			Swal.fire({
   			         				title: '此次預約已拒絕，已寄信通知預約者',
   			         				icon: 'success',
   			         			    showConfirmButton: false,
   			         				timer:1500,
   			         			}).then((result) => {
   			         				window.location.reload()
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
    
    function evaluatee(oid){//保母評價詳細資訊
    	//alert(oid)
    	Swal.fire({
  		  title: '保母評價',
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
      		url:"../Gusty/momorderevaluatee",
      		type:"post",
      		dataType:"json",
      		data : { 
      			"oid" : oid
              },
      		success:function(data){
      			$.each(data,function(i,n){
      				$("#evaluateetable").append("<tr><th scope='row'>"+n[0]+"</th>"+
      			   		"<td>"+n[1]+"</td>"+
      			   		"<td id=o"+n[4]+"></td>"+
      			   		"<td>"+n[3]+"</td></tr>");
      				if(n[2]>0){
      					for(let i=1;i<=5;i=i+1){
      						if(i<=n[2]){$("#o"+n[4]+"").append("★")}
      						else{$("#o"+n[4]+"").append("☆")}
      					}
      				}else{
      					$("#o"+n[4]+"").append("沒有評價")
      				}
      			});
      		},error:function(){
      			$("#tipp").append("對方尚未評價")
      		}
      	});
    }
    
    function momchange(change){//切換查看
    	if(change=="我的保母訂單"){
    		$('#maintable').DataTable().destroy()
    		$('#mymom').addClass("active")
    		$('#othermom').removeClass("active")
    		$("#mymomtable").html("");
    		$.ajax({
    			url:"../Gusty/mymomorder",
    			type:"post",
    			dataType:"json",
    			data : { 
    				"mid" : <%=session.getAttribute("user")%>,
    	        },
    			success:function(data){
    				$('#maintable').DataTable().destroy()
    				$.each(data,function(i,n){
    					$("#mymomtable").append("<tr><th scope='row'>"+n[0]+""+n[1]+""+n[2]+"</th>"+
    				   			"<td>"+n[3].substring(0,16)+"&nbsp~&nbsp<br>"+n[4].substring(0,16)+"</td>"+
    				   			"<td><button type='button' onclick='petdetail("+n[8]+")' class='btn btn-success'>寵物資訊</button></td>"+
    				   			"<td>"+n[5]+"</td>"+
    				   			"<td>"+n[6]+"</td>"+
    				   			"<td id='a"+n[8]+"'></td>"+
    				   			"<td id='"+n[8]+"'></td></tr>");
    					if(n[7]=="處理中"){
    						$("#a"+n[8]+"").append("尚未接受訂單");
    						$("#"+n[8]+"").append("<button type='button' onclick='accept("+n[8]+")' class='btn btn-info'>接受</button>"
    							+"<hr><button type='button' onclick='reject("+n[8]+")' class='btn btn-danger'>拒絕</button>");
    					}else if(n[7]=='拒絕'){
    						$("#a"+n[8]+"").append("訂單已被拒絕");
    						$("#"+n[8]+"").append(n[7]);
    					}
    					else{
    						$("#a"+n[8]+"").append("<button type='button' onclick='evaluatee("+n[8]+")' class='btn btn-dark'>點我查看</button>");
    						$("#"+n[8]+"").append(n[7]);
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
    			},error:function(){
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
    		
    	}else{
    		$('#maintable').DataTable().destroy()
    		$("#mymomtable").html("");
    		$('#othermom').addClass("active")
    		$('#mymom').removeClass("active")
    		$.ajax({
    			url:"../Gusty/othermomorder",
    			type:"post",
    			dataType:"json",
    			data : { 
    				"uid" : <%=session.getAttribute("user")%>,
    	        },
    			success:function(data){
    				$('#maintable').DataTable().destroy()
    				$.each(data,function(i,n){
    					$("#mymomtable").append("<tr><th scope='row'>"+n[0]+""+n[1]+""+n[2]+"</th>"+
    				   			"<td>"+n[3].substring(0,16)+"&nbsp~&nbsp<br>"+n[4].substring(0,16)+"</td>"+
    				   			"<td><button type='button' onclick='petdetail("+n[9]+")' class='btn btn-success'>寵物資訊</button></td>"+
    				   			"<td>"+n[5]+"</td>"+
    				   			"<td>"+n[7]+"</td>"+
    				   			"<td id='b"+n[9]+"'></td>"+
    				   			"<td>"+n[6]+"</td></tr>");
    					if(n[6]=="處理中"){
    						$("#b"+n[9]+"").html("訂單尚在處理")	
    					}else if(n[6]=="接受"){
    						$("#b"+n[9]+"").html("<button type='button' onclick='evaluatee("+n[9]+")' class='btn btn-dark'>去寫評價</button>")
    					}else if(n[6]=="接受"&&n[8]!=null){
    						$("#b"+n[9]+"").html("您已經寫過評價")
    					}else if(n[6]=="拒絕"){
    						$("#b"+n[9]+"").html("訂單已被拒絕")
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
    			},error:function(){
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
    	}
    }
    
	</script>

</body>
</html>