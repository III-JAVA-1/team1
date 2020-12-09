<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh-Hant-TW">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!--bootstrap初始規模-->
    <title>AccompanyMe</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
    
    .qq,.qq2,.qq3{
 
        border: solid 2px black;
        width: 300px;
        height: 200px;
        text-align: center;
        margin: 20px;
        margin-top: 8px;     
        display: inline-block;
         border-radius: 8px;
    }
    .qqq{
        text-align: center;
    }
 
    #ig01, #ig02,#ig03{
     
     border-radius:50%
    }
    .pettop{
        text-align: center
        
    }
    
    #top{
        width: 800px;
        height: 400px;
    }
    .formgroup{
        
        width: 450px;
        margin: auto;
        border: solid 1px;
        margin-bottom: 20px;
        border-radius: 8px;
        margin-top:30px

    }
    .submit{
        text-align: center;
    }

    h3{
       text-align: center;
       margin-top: 10px;
    }
    #gotop{ /*回到top按鈕設計*/
  		position:fixed;
  		right:30px;
  		bottom:31px;
  		width:50px;
  		height:50px;
  		text-align: center;
  		border: none;
  		background-image: url("Images/up.png");
  		background-size: 50px 50px;
		}
		#gotop:hover{/*button滑入不要背景顏色*/
  			background-color: transparent;
		}
    </style>
<script src="https://www.w3schools.com/lib/w3.js"></script><!--要include 的程式 最下面還有-->
</head>

<body>

<div class="container">
<%request.setCharacterEncoding("UTF-8"); %>

    <div calss="title">
        <h3>預約表</h3>
        

 <h3>預約店家:</h3>

    </div>
    <form class="formgroup"  method="post" action="../Salon_reservServlet">
      <input type="hidden" name="storename" value="55">
       
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
                <option value="spa">spa</option>

            </select>

            </div>


         </div>
         <div>
            <label for="">預約時間</label>
            <input type="datetime-local" id="date" name="time">
         </div>
        
    
            <div>
                    <p>備註</p>
                    <textarea name="other" id="text" cols="60" rows="10" style="margin-top: 2px;"></textarea>
    
    
            </div>
            <div class="submit">
                <input type="submit" value="送出"  name="submit"> 
                <input type="reset" value="重製">
              	
            </div>
            
        </fieldset>
    </form>
  
</div> 

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
        $(function(){//會到最上層的jquery
	        $('#gotop').click(function(){ 
		    $('html,body').animate({scrollTop:0}, 333);
	    });
	    $(window).scroll(function() {
		    if ( $(this).scrollTop() > 300 ){
			    $('#gotop').fadeIn(222);
		    } else {
			    $('#gotop').stop().fadeOut(222);
		    }
	        }).scroll();
        });
    </script>
</body>

</html>