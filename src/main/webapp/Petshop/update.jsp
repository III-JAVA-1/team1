<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

</style>
<body>



    <div class="container">

    <div class="title">
        <h3>訂單修改</h3>
        

  <h3></h3>  

    </div>
    <form class="formgroup"  method="post" action="../Henry/update">
    <div id='shopname' class='h4'></div>
    <input type='hidden' name='storename' id='storename'>
        <fieldset> 
         <div><label for="exampleFormControlInput1">飼主姓名</label>
            <input type="text" class="form-control" id="name" placeholder="請輸入姓名" name="name" required="required" >
         </div>
         <div>
            <label for="exampleFormControlInput1">飼主電話</label>
            <input type="number" class="form-control" id="phone" placeholder="請輸入電話" name="phone" maxlength="10" minlength="10"  required="required">
         </div>
         <div>
            <label for="exampleFormControlInput1">飼主地址</label>
            <input type="text" class="form-control" id="address" placeholder="請輸入地址"  name="address" required="required">
    
         </div>
         <div>
             <label for="">種類:</label>
             <label for="cat"><input type="radio" name="type" id="cat" value="貓" >貓</label>
             <label for="dog"><input type="radio" name="type" id="dog" value="狗" >狗</label>
         </div>
         <div>
            <label for="">美容項目:（洗澡、剪毛、SPA、其他）</label>
            <div>
            <select  id="service" name="item">
                <option value="洗澡">洗澡</option>
                <option value="美容">美容</option>
                <option value="除毛">除毛</option>
                <option value="spa">spa</option>
				<option value="其他">其他</option>
            </select>

            </div>


         </div>
         <div>
            <label for="">預約時間</label>
            <input type="datetime-local" id="date" name="datee">
         </div>
    	
            <div class="text">
               <p>備註</p>
               <textarea name="other" id="text" cols="60" rows="10" style="margin-top: 2px;" ></textarea>
            </div>
            
            <input type='hidden' id='id' name='id'>

            <div class="row justify-content-center">
				<button type="submit" class="btn btn-primary btn-lg ml-3">確認送出</button>
				<button type="button" class="btn btn-primary btn-lg ml-3" onclick="history.back()">取消</button>
			</div>
            
        </fieldset>
    </form>
  
</div> 

	<script>
	
	
	$.ajax({
		url:"../Henry/updatereserv",
		type:"post",
		dataType:"json",
		data : {
			"sid":<%=request.getParameter("sid")%>
		},
		success:function(data){
			$.each(data,function(i,n){
				$("#id").val(n[0])
				$("#name").val(n[3])
				$("#phone").val(n[5])
				$("#address").val(n[1])
				$("#shopname").html(n[6])
				$("#storename").val(n[6])
				$("#date").val(n[9].substring(0,10)+"T"+n[9].substring(11,16))
				$("#text").val(n[4])
				$("#service option[value="+n[2]+"]").attr('selected', 'selected');
				$("input[name=type][value="+n[7]+"]").attr('checked',true);
			});
		}
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