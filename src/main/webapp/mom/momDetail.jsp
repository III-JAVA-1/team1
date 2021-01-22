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
    <!--    Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--sweetAlert-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

    <script src="js/momDetail.js"></script>

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

            <div  id="userTalk">

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
            <input type="hidden" id="getMomId" value="<%=getMom%>">
        </div>
    </div>
</div>

<jsp:include page="Footer.jsp"/>


</body>

</html>