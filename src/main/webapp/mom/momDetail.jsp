<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <!--    Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--sweetAlert-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

    <script src="js/momDetail.js"></script>
    <script src="css/registerMom.css"></script>

    <style>

        #map { /*google map 要給大小 不然不會顯示*/
            height: 600px;
            width: 100%;
        }

        .st3 { /*底線*/
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: solid rgb(194, 193, 193) 1px;
        }

        .st9{ /*預約*/
            background-color: wheat;
            border-radius: 10px;
            border: wheat  solid ;
        }


    </style>
</head>

<body>

<jsp:include page="Header.jsp"/>
<%String getMom = request.getParameter("momId");%>

<div class="container">
    <div class="row">

        <div class="col-md-8">

            <div id="momPic"><!-- 圖片--></div>
            <br>

            <div id="userTalk" class="st9"></div> <!-- 評論-->

            <div class="st3"></div>
            <br>

            <div class="st9" id="petContent"></div> <!-- 服務介紹-->

            <div class="st3"></div>
            <br>

            <div class="st9" id="experience"></div> <!-- 資歷-->

            <div class="st3"></div>
            <br>

            <div class="st9" id="notices"></div> <!-- 注意事項-->

            <br>
        </div>



        <div class="col-md-4">
            <div id="title"></div>
            <div class="st2" id="pic"></div> <!-- 保母圖片-->

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

            <div>
                <div id="map"></div>
            </div> <!-- googleMap-->
            <br>
            <input type="hidden" id="getMomId" value="<%=getMom%>">
        </div>
    </div>
</div>
<script>
    let map
    function initMap() {/*要用googleamp的初始參數設定*/
        let myLatLng = {
            lat: 24.9901422,
            lng: 121.2319603
        };
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 13,/*放大比例*/
            center: myLatLng
        });
    }
</script>

<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChBlcBS8CVWG0N3smlRpMO678wobs4bdA&callback=initMap">
</script>

<jsp:include page="Footer.jsp"/>


</body>

</html>