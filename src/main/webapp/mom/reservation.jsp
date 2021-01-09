<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<!doctype html>
<html lang="zh-Hant-TW">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--bootstrap初始規模-->
    <title>AccompanyMe</title>
    <script src="js/reservation.js"></script>

    <link rel="stylesheet" href="css/registerMom.css">


    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <script src="https://www.w3schools.com/lib/w3.js"></script>
    <!--要include 的程式 最下面還有-->
<body>

<jsp:include page="Header.jsp"/>

<%String getMom = request.getParameter("momId");%>
<%String getsName = request.getParameter("sname");%>

<div class="container">
    <div class="row">
        <div class="col-md-2 bGround">
        </div>
        <article class="col-md-8">

            <div style="margin: auto;" onsubmit="goTime()">
                <b>
                    <h4>
                        <b>聯絡 <%=getsName%>
                        </b>

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
                               required=" ">
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
                        <input type="text" class="form-control" id="petName" name="petName"
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
                        <input type="text" class="form-control" id="breed" name="petBreed" required=" ">
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="petAge">寵物歲數</label>
                        <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-2">
                        <input type="number" class="form-control" id="petAge" name="petAge" value="0" min="0"
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
                        <label>性別</label>
                        <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-2">
                        <select class="custom-select" name="petGender" id="petGender">
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
                        <label>寶貝體型</label>
                        <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-3">
                        <select class="custom-select" name="petType" id="petId">

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
                        <label for="priceId">服務種類</label>
                    </div>
                    <div class="col-md-3 num">
                        <select class="custom-select" name="proPrice" id="priceId">

                        </select>
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="timeStart">預約時段(起)</label>
                    </div>
                    <div class="col-md-5 num">
                        <input class="form-control" type="datetime-local" name="chooseStart" required=" "
                               id="timeStart" onchange="printPriceResult()">
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3 num">
                        <label for="timeEnd">預約時段(訖)</label>
                    </div>
                    <div class="col-md-5">
                        <input class="form-control" id="timeEnd"
                               type="datetime-local" name="chooseEnd"
                               required=" " onchange="printPriceResult()">
                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="remark"> 備註</label>
                    </div>
                    <div class="col-md-7">
                        <textarea class="form-control" id="remark" rows="4" name="remark"></textarea>
                    </div>
                </div>

                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">價格計算</div>
                    <div class="col-md-7">
                        <div style="width: 300px;height: 100px; border: solid black;border-radius: 5px;">
                            <div id="total" name="total"
                                 onchange="printPriceResult()">0 元</div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="momId" id="momId" value="<%=getMom%>">
                <%--                    <input type="hidden" name="total" value="<%=request.getParameter("total")%>">--%>

                <br>

                <div class="form-check" style="text-align: center;">
                    <!-- checked -->
                    <!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1"><p style="color: red;">我同意AccompanyMe的服務條款</p></label> -->
                    <button type="button" name="reservation"
                            id="reservation" class="btn btn-primary"
                            onclick="submit()">送出
                    </button>
                </div>
            </div>
        </article>
        <div class="col-md-2 bGround">
        </div>
    </div>
</div>


<script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<!--include 的下半部分-->
<jsp:include page="Footer.jsp"/>
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
        countyName: "country", // 自訂城市 select 標籤的 name 值
        districtName: "district", // 自訂地區 select 標籤的 name 值
    });
</script>


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
                $.each(data, function (n, m) {
                    let pet = "<option>貓或狗</option>";
                    if (m[3] != null) {
                        pet += "<option id='type1' name='type1'>" + m[3] + "</option>"
                    }
                    if (m[4] != null) {
                        pet += "<option id='type2' name='type2'>" + m[4] + "</option>"
                    }
                    if (m[5] != null) {
                        pet += "<option id='type3' name='type3'>" + m[5] + "</option>"
                    }
                    if (m[6] != null) {
                        pet += "<option id='type4' name='type4'>" + m[6] + "</option>"
                    }
                    $("#petId").append(pet);

                    let price = "<option>服務種類</option>";
                    if (m[7] != null) {
                        price += "<option id='service1' name='service1'>到府遛狗 " + m[7] + " 元</option>"
                    }
                    if (m[8] != null) {
                        price += "<option id='service2' name='service2'>安親照顧 " + m[8] + " 元</option>"
                    }
                    if (m[9] != null) {
                        price += "<option id='service3' name='service3'>寄宿照顧 " + m[9] + " 元</option>"
                    }
                    $("#priceId").append(price)
                });
            }

        });
    });

</script>
</body>

</html>