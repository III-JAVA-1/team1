<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="zh-Hant-TW">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--bootstrap初始規模-->
    <title>AccompanyMe</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">



    <style>
        @import url(https://fonts.googleapis.com/css?family=Lily+Script+One);

        * {
            margin: 0;
            padding: 0;
        }

        article {
            /* border:1px solid gray; */
            border-radius: 15px;
            padding: 30px 80px;
            background-color: #E0E0E0;
        }

        .h4 {
            /*nav消除間距*/
            margin: 0px;
        }

        #gotop {
            /*回到top按鈕設計*/
            position: fixed;
            right: 30px;
            bottom: 31px;
            width: 50px;
            height: 50px;
            text-align: center;
            border: none;
            background-image: url("Images/up.png");
            background-size: 50px 50px;
        }

        #gotop:hover {
            /*button滑入不要背景顏色*/
            background-color: transparent;
        }

        input[type="text"] {
            text-align: center;
        }

        .st1 {
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: solid rgb(194, 193, 193) 1px;
        }
        .bg{
            background-image: url(Images/无缝的乱画猫和狗lineart背景-123270005\ \(2\).jpg);
        }
    </style>
    <script src="https://www.w3schools.com/lib/w3.js"></script>
    <!--要include 的程式 最下面還有-->

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-2 bg">
            </div>
            <article class="col-md-8">

                <form action="/mom/reservtionMom" method="POST" style="margin: auto;" onsubmit="goTime()">
                    <b>
                        <h4>
                            <b>聯絡</b>
                        </h4>
                    </b>

                    <br>

                    <b>
                        <div class="st1">會員基本資料</div>
                    </b>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="userPhone">手機</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="userPhone" name="connPhone" placeholder="請輸入手機號"
                                required=" " value="">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>

                        <div class="col-md-3">
                            <label for="idAddress">地址</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="form-inline col-md-8" role="form">
                            <div id="twzipcode_My"></div>
                            <input class="form-control" id="idAddress" type="text" name="address" required=" "
                                placeholder="地址">
                        </div>
                    </div>

                    <b>
                        <div class="st1">寵物資料</div>
                    </b>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="petName">寵物名字</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" id="petName" type="text" name="petName"
                                required=" ">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="breed">寵物品種</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" id="breed" type="text" name="petBreed" required=" ">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="age">寵物歲數</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="col-md-2">
                            <input type="number" class="form-control" id="idMount" name="maxReceive" value="0" min="0"
                                max="99" required=" ">
                        </div>
                        <div style="line-height:2.5rem;height:2.5rem;padding-left:0;">
                            歲
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="gender">性別</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="col-md-2">
                            <select class="custom-select" name="petGender">
                                <option>性別</option>
                                <option>公</option>
                                <option>母</option>
                            </select>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="type">寶貝體型</label>
                            <span class="uppercase">*</span>
                        </div>
                        <div class="col-md-3">
                            <select class="custom-select" name="petType">
                                <option>貓或狗</option>
                                <option>小型犬(0~10kg)</option>
                                <option>中型犬(10~24kg)</option>
                                <option>大型犬(24kg以上)</option>
                                <option>貓(0~10kg)</option>
                            </select>
                        </div>
                    </div>

                    <b>
                        <div class="st1">服務項目</div>
                    </b>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="type">服務價格</label>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="type">預約時段(起)</label>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control" type="datetime-local" name="chooseStart" required=" ">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="type">預約時段(訖)</label>
                        </div>
                    <div class="col-md-5">
                        <input class="form-control" type="datetime-local" name="chooseEnd" required=" ">
                    </div>
                </div>
                    <br>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <label for="remark"> 備註</label>
                        </div>
                        <div class="col-md-7">
                        <textarea class="form-control" name="remarks" id="remark" rows="4" name="remark"></textarea>
                    </div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">價格計算</div>
                        <div class="col-md-7">
                    <div style="width: 300px;height: 100px; border: solid black;border-radius: 5px;"></div>
                </div>
                </div>

                    <br>

                    <div class="form-check" style="text-align: center;">
                        <!-- checked -->
                        <!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1"><p style="color: red;">我同意AccompanyMe的服務條款</p></label> -->

                        <button type="submit" name="reservtion" class="btn btn-primary">送出</button>
                    </div>
                </form>
            </article>
            <div class="col-md-2 bg">
            </div>
        </div>
    </div>

    <script>
        w3.includeHTML();
    </script>
    <!--include 的下半部分-->

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--bootstrap的東西-->

    <!-- TWzipcode的js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
    <script>
        $("#twzipcode_My").twzipcode({
            zipcodeIntoDistrict: true, // 郵遞區號自動顯示在區別選單中
            css: ["city form-control", "town form-control"],
            countyName: "city", // 自訂城市 select 標籤的 name 值
            districtName: "town", // 自訂地區 select 標籤的 name 值
        });
    </script>

    <script>
        function goTime() {
            document.getElementById("listCreate").value = new Date();
        }
    </script>

</body>

</html>