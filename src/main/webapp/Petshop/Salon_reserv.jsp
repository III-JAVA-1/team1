<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<head>
<title>AccompanyME</title>

</head>
<jsp:include page="Header.jsp" />
<style>
.container{

 width: 550px;
        margin: auto;
        border: solid 1px;
        margin-bottom: 20px;
        border-radius: 8px;
        margin-top:30px



}

.submit{
        text-align: center;
    }
/*     .text{ */
/*     width: 550px; */
/*     	width:50px; */
/*     	 text-align: center; */
/*     	margin-auto  */
    
/*     } */

</style>
<script>
var userid=<%=request.getSession().getAttribute("user")%>

if(userid==null||userid==""){
	window.alert('請先登入'); window.location='../Member/Login.jsp'
}
</script>
<body>



    <div class="container">

    <div class="title">
        <h3>預約表</h3>
        

  <h3></h3>  

    </div>
    <form class="formgroup"  method="post" action="../Henry/insert"  onsubmit="return gogo()" name="res">
    <div><%=request.getParameter("storename")%></div>
    <input type="hidden" name="u_Id" id="u_Id" value="<%=session.getAttribute("user")%>">
      <input type="hidden" name="storename" value="<%=request.getParameter("storename")%>">
       
        <fieldset>
             
           
         <div><label for="exampleFormControlInput1">飼主姓名</label>
            <input type="text" class="form-control" id="name" placeholder="請輸入姓名" name="name" required="required" >
         </div>
         <div>
            <label for="exampleFormControlInput1">飼主電話</label>
            <input type="number" class="form-control" id="phone" placeholder="請輸入電話" name="phone"  required="required">
         </div>
         <div>
            <label for="exampleFormControlInput1">飼主地址</label>
            <input type="text" class="form-control" id="address" placeholder="請輸入地址"  name="address" required="required">
    
         </div>
         <div>
             <label for="">種類:</label>
             <label><input type="radio" name="type"  id="cat" value="貓" >貓
             <input type="radio" name="type"   id="dog" value="狗" >狗</label>
         </div>
         <div>
            <label for="">美容項目:（洗澡、剪毛、SPA、其他）</label>
            <div>
            <select  id="service" name="item">
                <option value="洗澡" >洗澡</option>
                <option value="美容" >美容</option>
                <option value="除毛" >除毛</option>
                <option value="spa">spa</option>
				<option value="其他">其他</option>
            </select>

            </div>


         </div>
         <div>
            <label for="">預約時間</label>
            <input type="datetime-local" id="date" name="datee" min="2021-01-07T00:00">
         </div>
         
        <input type="hidden" id="thistime"  name="thistimee">
    	
            <div class="text">
                    <p>備註</p>
                    <textarea name="other" id="text" cols="60" rows="10" style="margin-top: 2px;" ></textarea>
    
    
            </div>
<!--             <div class="submit"> -->
<!--                 <input type="submit" value="送出"  name="submit">  -->
<!--                 <input type="reset" value="重製"> -->
              	
<!--             </div> -->
            <div class="row justify-content-center">
				<button type="button" class="btn btn-primary btn-lg ml-3" onClick="check()">確認送出</button>
				<button type="button" class="btn btn-primary btn-lg ml-3" onclick="history.back()">取消</button>
				
			</div>
            
        </fieldset>
    </form>
  
</div> 

	<script>
	
	
	
	function check(){
		var today=new Date();
		var currentDateTime =
		today.getFullYear()+'-'+
		(today.getMonth()+1)+'-'+
		today.getDate()+'T'+
		today.getHours()+':'+today.getMinutes()+':00'
		'';
		$("#thistime").val(currentDateTime);
		 res.submit();
		 
	}
	
	$().ready(function(){
		$.ajax({
			url:"../Gusty/headercheck",
			type:"post",
			dataType:"json",
			data : { 
				"user_id" : <%=session.getAttribute("user")%>,                     
        	},
			success:function(data){
				$.each(data,function(i,n){
					$("#name").val(n.name);
					$("#phone").val(n.phone);
					
					$("#address").val(n.address);
				});
			}
		});
	});
	
	
	</script>
    
    
    
    
	
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
		
</body>
</html>