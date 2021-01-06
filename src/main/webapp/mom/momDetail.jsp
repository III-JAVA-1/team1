<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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
        
        .underline {
            background-color: pink;
            height: 500px;
        }

        .st2 { /*預約*/
            background-color: burlywood;
            height: 350px;
        }

        .st3 { /*評論*/
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: solid rgb(194, 193, 193) 1px;
        }

        .st4 { /*服務介紹*/
            background-color: grey;
            height: 200px;
        }

        .st5 { 
            border-left: solid rgb(194, 193, 193) 1px;
            position: absolute;     
            padding-top: 10px;
        }

        .st6 {
            background-color: darkgoldenrod;
            height: 500px;
        }
        .st7{
            background-color: wheat;
            height: 300px;
        }
        .st8{
            background-color: wheat;
            height: 300px;
        }
        .st9{ /*預約*/
            background-color: wheat;
            height: 150px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="st1"></div> <!-- 圖片-->
                <div class="st3"></div>
                
                <div class="st4"></div> <!-- 評論-->

                <div class="st3"></div>
                <br>

                <div class="st4"></div> <!-- 服務介紹-->

                <div class="st3"></div>
                <br>

                <div class="st4"></div> <!-- 資歷-->

                <div class="st3"></div>
                <br>

                <div class="st4"></div> <!-- 注意事項-->

                <div class="st3"></div>
                <br>

                <div class="st4"></div> <!-- ???-->

                <div class="st3"></div>
                <br>
            </div>

            <div class="col-md-4">
                <div class="st2"></div> <!-- 預約-->
                <div class="st3"></div>
                <br>
                
                <div class="st9"></div> <!-- 預約-->

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
</body>

</html>