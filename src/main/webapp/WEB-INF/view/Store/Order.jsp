<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="Store/css/order.css" rel="stylesheet">
    <title>我的訂單</title>
</head>
<body>
<div class="tb1">
    <table class="table">
        <thead>
        <tr class="tr1">
            <th colspan="2">訂單商品</th>
            <th scope="col">單價</th>
            <th scope="col" style="text-align: center">數量</th>
            <th scope="col">總價</th>
        </tr>
        </thead>
        <tbody>
        ${orderItem}
        </tbody>
    </table>
    <hr>
    <form class="btnborder">
        <div class="row">
            <div class="col">
                <p class="address">備註:
                    <input id="remarks" type="text" class="form-control" placeholder="(選填)請留言給賣家">
                </p>
            </div>
            <div class="col">
                <p class="message">寄送資訊:
                    <input id="address" type="text" class="form-control" placeholder="請輸入寄送地址" required>
                </p>
            </div>
        </div>
    </form>
</div>

<div id="payTotal" class="payTotal">
    <p class="p2">付款方式
        <button id="creditCardBtn" type="button" onclick="setPayType(0)" class="btn btn-outline-warning active">信用卡</button>
        <button id="deliveryPayBtn" type="button" onclick="setPayType(1)" class="btn btn-outline-warning">貨到付款</button>
    </p>

    <hr>
    <div class="btnborder">
        <p class="p1">商品總金額: $${orderTotalPrice}</p>
        <p id="shippingPrice" class="p1">運費總金額: $xx</p>
        <p id="totalPrice" class="p1">總付款金額: $xxx</p>

    </div>
    <hr>
    <div class="btn1 btnborder">
        <button id="submitBtn" type="button" class="btn btn-primary" onclick="return doOrder()">下訂單</button>
    </div>
</div>

<script>

    let memberId = "${memberId}";
    let orderPrice = ${orderTotalPrice};
    let payType = 0;

    function setPayType(i) {
        let creditCardBtn = document.getElementById("creditCardBtn");
        let deliveryPayBtn = document.getElementById("deliveryPayBtn");
        let shippingPrice = document.getElementById("shippingPrice");
        let totalPrice = document.getElementById("totalPrice");

        if (i === 0) {
            payType = 0;
            creditCardBtn.classList.add("active");
            deliveryPayBtn.classList.remove("active");
            shippingPrice.innerHTML="運費總金額: $60"
            totalPrice.innerHTML= "總付款金額: $" + (orderPrice + 60);
        } else if (i === 1) {
            payType = 1;
            deliveryPayBtn.classList.add("active");
            creditCardBtn.classList.remove("active");
            shippingPrice.innerHTML="運費總金額: $65"
            totalPrice.innerHTML= "總付款金額: $" + (orderPrice + 65);
        }
    }
    setPayType(0);

    /**
     * 生成訂單
     * @returns {boolean} 防止預設跳轉
     */
    function doOrder() {
        //取得address的元件
        let address = document.querySelector("#address");
        //取得remarks的元件
        let remarks = document.querySelector("#remarks");

        //取得輸入框的值並且判斷為空值
        if (address.value === "") {
            // 地址為空
            alert("地址不可為空")
            return true;
        }
        let req = JSON.stringify({
            "id": memberId,
            "address": address.value,
            "remarks": remarks.value,
            "payType": payType
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "order/add",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                if (res.success) {
                    if(payType === 0) {
                        $("#payTotal").append(res.ecpHtml);
                    } else if (payType === 1) {
                        goSuccess(res.orderId);
                    }
                } else {
                    alert('生成訂單錯誤');
                }
            },
            error: function () {
                alert('連接伺服器失敗');
            }
        });
        return false;
    }

    /**
     * 跳轉至成功畫面
     */
    function goSuccess(orderId) {
        window.location.href = "orderSuccess?memberId=" + memberId + "&orderId=" + orderId;
    }

</script>
</body>
</html>
