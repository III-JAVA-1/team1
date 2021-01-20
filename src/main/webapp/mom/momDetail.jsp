<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AccompanyMe</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
        </script>
    <!--sweetAlert-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="sweetalert2.all.min.js"></script>
    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

    <style>
        * {
            padding: 0;
            margin: 0;
        }

        /*.st2 { !*預約*!*/
        /*    background-color: burlywood;*/

        /*}*/

        /*.st3 { !*評論*!*/
        /*    padding-top: 10px;*/
        /*    padding-bottom: 10px;*/
        /*    border-bottom: solid rgb(194, 193, 193) 1px;*/
        /*}*/

        /*.st4 { !*服務介紹*!*/
        /*    background-color: grey;*/

        /*}*/
        /*.st5 {*/
        /*    border-left: solid rgb(194, 193, 193) 1px;*/
        /*    position: absolute;*/
        /*    padding-top: 10px;*/
        /*}*/

        /*.st6 {*/
        /*    background-color: darkgoldenrod;*/

        /*}*/
        /*.st7{*/
        /*    background-color: wheat;*/

        /*}*/
        /*.st8{*/
        /*    background-color: wheat;*/

        /*}*/
        /*.st9{ !*預約*!*/
        /*    background-color: wheat;*/

        /*}*/
    </style>
</head>

<body>

<jsp:include page="Header.jsp"/>
<%String getMom = request.getParameter("momId");%>

<div class="container">
    <div class="row">

        <div class="col-md-8">

            <div  id="momPic"><!-- 圖片--></div>
            <div class="st3"></div>

            <div class="st4"><h4>家長的話</h4>
            </div> <!-- 評論-->

            <div class="st3"></div>
            <br>

            <div class="st4" id="petContent"></div> <!-- 服務介紹-->

            <div class="st3"></div>
            <br>

            <div class="st4" id="experience"></div> <!-- 資歷-->

            <div class="st3"></div>
            <br>

            <div class="st4" id="notices"></div> <!-- 注意事項-->

            <div class="st3"></div>
            <br>

            <div class="st4"></div> <!-- ???-->

            <div class="st3"></div>
            <br>
        </div>

        <div class="col-md-4">
            <div id="title"></div>
            <div class="st2" id="pic"></div> <!-- 預約-->

            <div class="row">
                <div class="col-md-3" id="reservation"></div>
                <div class="col-md-3" id="favoriteMom"></div>
                <div class="col-md-6" id="address"></div>
            </div>
            <div class="st3"></div>
            <br>

            <div class="row st9">
                <div id="petType" class="col-md-5"></div>
                <div id="petMoney" class="col-md-6"></div>
            </div> <!-- 預約-->

            <div class="st3"></div>
            <br>

            <div class="st6"></div> <!-- 願意預約體型-->

            <div class="st3"></div>
            <br>

            <div class="st7"></div> <!-- 行事曆-->

            <div class="st3"></div>
            <br>

            <div class="st8"></div> <!-- googleMap-->
            <br>
        </div>
    </div>
</div>

<jsp:include page="Footer.jsp"/>

<script>

    $().ready(function () {
        $.ajax({
            url: "../mom/showReservation",
            type: "post",
            dataType: "json",
            data: {
                "momId": <%=getMom%>
            },
            success: function (data) {
                $("#title").html("<b style='font-size: 150%'>"+data.title+"</b>")
                $("#momPic").html(" <img src='data:image/png;base64,"+data.pic+"' style='width:720px; height:500px;'/>")
                $("#pic").html(" <img src='data:image/png;base64,"+data.img+"' style='width:350px; height:300px;'/>")
                $("#reservation").html("<a href='reservation.jsp?momId="+data.momId+"' style='text-decoration:none;color:white;'><button class='btn btn-secondary' type='button'  onclick='toReservation()'>預約保母</button></a>")
                $("#favoriteMom").html("<button class='btn btn-secondary' type='button'  onclick='toCollection()'>關注保母</button>")
                $("#address").html("<h5 style='font-size:20px;margin-bottom:2px;'>"+data.sname+"</h5>"+
                "<h5 style='font-size: 15px'>聯絡地址:"+data.country+"  "+data.district+"</h5>"+
                "<h5 style='font-size: 15px'>聯絡電話:  "+data.phone+"</h5>")
                $("#experience").html("<h4>資歷</h4><h5>"+data.experience+" 年</h5>")
                $("#petContent").html("<h4>服務內容</h4>" +
                    "<p>"+data.petContent+"</p>")
                $("#notices").html("<h4>注意事項</h4><h5>"+data.notices+"</h5>")
                let type = "<h5>可接受的體型</h5>";
                let typeMoney = "<h5>各種服務的價格</h5>";
                if (data.bodyType1 != null) {
                    type += "<h6>迷你犬(0~4kg)</h6>"
                }
                if (data.bodyType2 != null) {
                    type += "<h6>中型犬(10~24kg)</h6>"
                }
                if (data.bodyType3 != null) {
                    type += "<h6>大型犬(24kg以上)</h6>"
                }
                if (data.bodyType4 != null) {
                    type += "<h6>貓</h6>"
                }
                if(data.proPrice1 != null){
                    typeMoney += "<small>到府遛狗 :"+data.proPrice1+" 元</small><br>"

                }
                if(data.proPrice2 != null){
                    typeMoney += "<small>安親照顧 :"+data.proPrice2+" 元</small><br>"
                }
                if(data.proPrice3 != null){
                    typeMoney += "<small>寄宿照顧 :"+data.proPrice3+" 元</small><br>"
                }
                $("#petType").append(type)
                $("#petMoney").append(typeMoney)


                console.log(data)
            }

        });
    });
</script>

<script>
    function toReservation(){
        return true
    }
    function toCollection(){
        $.ajax({
            url:"../mom/favorite",
            type:"post",
            dataType:"json",
            data:{
                "momId": <%=getMom%>
            },
            success:function(data){
                console.log(data)
                console.log("isFavorite="+data);

                if(data){
                    $("#favoriteMom").html("<button class='btn btn-success' type='button'  onclick='toCollection()'>取關保母</button>")
                }
                else{
                    $("#favoriteMom").html("<button class='btn btn-secondary' type='button''>關注保母</button>")
                }
            }, error: function () {
                Swal.fire({
                    icon: 'error', title: '關注 失敗自己無法關注自己',
                    showConfirmButton: false,
                    timer: 1500,
                })
            }
        });
    }

</script>
</body>

</html>