<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="Store/css/productRate.css" rel="stylesheet">

    <title>評價商品</title>
</head>
<body>
<div id="rateDiv" class="tb1">

    <p class="my-title">商品評價</p>
    <hr>


</div>

<script>


    let memberId = "${memberId}";
    let orderId = "${orderId}";
    let req = JSON.stringify({
        "memberId": parseInt(memberId),
        "orderId": parseInt(orderId)
    });

    let rateDataList;

    // 跟server post傳輸
    $.ajax({
        type: "POST",
        url: "productRate/getOrderItem",
        data: req,
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            rateDataList = res.rateDataList;
            console.log(rateDataList);
            makeRateList();
        },
        error: function () {
            alert('發生了一些錯誤');
        }
    });

    function makeRateList() {
        let rateDiv = document.querySelector("#rateDiv");

        rateDataList.forEach(function (data) {
            //建立一個div物件
            const div = document.createElement("div");
            //給div id
            div.id = data.productId;
            div.className = "products";
            //如果沒有圖片放預設圖有圖片就放原本圖片
            let img = data.img == null ? "Store/images/no_picture.gif" : data.img;
            let message = data.message == null ? "" : data.message;
            let html = "<div class=\"d-flex justify-content-start flex-wrap \">\n" +
                "<img src=\"" +
                img +
                "\" height=\"100px\" width=\"100px\">\n" +
                "<p class=\"d-flex align-items-center product-name\">" +
                data.productName +
                "</p>\n" +
                "</div>\n" +
                "<div class=\"starAll d-flex justify-content-center\">\n" +
                makeStar(data) +
                "</div>\n" +
                "<br><span id=\"span\"></span>\n" +
                "<div class=\" text1 d-flex justify-content-center\">\n" +
                "<textarea class=\"form-control\" id=\"input" +
                data.productId +
                "\" rows=\"5\" placeholder=\"告訴別人此商品好的地方\" value=\"" +
                message +
                "\">" +
                message + "</textarea>\n" +
                "</div>";
            div.innerHTML = html;
            rateDiv.appendChild(div);
            makeStarListener(data);
            // 備註框輸入
            let inputBlock = document.querySelector("#input" + data.productId);
            inputBlock.addEventListener("blur", (event => {
                    console.log(event.target.value);
                    data.message = event.target.value;
                }
            ));
        });

        const btnDiv = document.createElement("div");
        btnDiv.className = "d-flex justify-content-end btn1";
        let btnHtml =
            "<button type=\"submit\" class=\"btn btn-primary\" onsubmit=\"return false\" onclick=\"sendRate()\">送出評價\n" +
            "</button>\n"
        btnDiv.innerHTML = btnHtml;
        rateDiv.appendChild(btnDiv);
    }

    function makeStar(data) {
        let html = "";
        for (let i = 1; i <= 5; i++) {
            if (i > data.rate) {
                html += "<img class=\"i" + data.productId + "\" src=\"Store/images/noStar.svg\" width=\"30px\" height=\"30px\"/>\n";
            } else {
                html += "<img class=\"i" + data.productId + "\" src=\"Store/images/star.svg\" width=\"30px\" height=\"30px\"/>\n";
            }
        }

        return html;
    }

    function makeStarListener(data) {
        if (data.rate === 0) {
            $(".i" + data.productId).mouseover(function () {
                $(this).prop("src", "Store/images/star.svg");
                $(this).prevAll().prop("src", "Store/images/star.svg");
                $(this).nextAll().prop("src", "Store/images/noStar.svg");
            })

            $(".i" + data.productId).mouseleave(function () {
                $(this).prop("src", "Store/images/noStar.svg");
                $(this).prevAll().prop("src", "Store/images/noStar.svg");
            })
        }

        $(".i" + data.productId).click(function () {
            data.rate = $(this).index() + 1;
            $(this).prop("src", "Store/images/star.svg");
            $(this).prevAll().prop("src", "Store/images/star.svg");
            $(this).nextAll().prop("src", "Store/images/noStar.svg");
            $(".i" + data.productId).unbind('mouseover');
            $(".i" + data.productId).unbind('mouseleave');
            console.log("商品編號: " + data.productId + "打了" + data.rate + "顆星");
        })
    }

    function sendRate() {

        let isOk = true;
        rateDataList.forEach(function (data) {
            if(data.rate===0){
                isOk=false;
            }
        })

        if(!isOk){
            alert('尚有商品還未評價');
            return;
        }

        console.log(rateDataList);
        let req = JSON.stringify({
            "memberId": memberId,
            "rateDataList": rateDataList
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "productRate/sendRate",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                if (res.success) {
                    alert('感謝完成評價');
                    window.location = "Member/Evaluation.jsp";
                } else {
                    alert('評價有誤');
                }
            },
            error: function () {
                alert('error');
            }
        });
    }

</script>
</body>
</html>
