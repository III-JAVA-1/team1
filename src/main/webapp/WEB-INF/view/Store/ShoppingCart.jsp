<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="Store/css/shoppingCart.css" rel="stylesheet">

    <title>我的購物車</title>
</head>
<body>
<div class="tb1">
    <table class="table table-hover">
        <thead>
        <tr class="tr1">
            <th colspan="1" scope="row" style="vertical-align:middle;text-align: center">
                <input type="checkbox"
                       class="mycheckBox"
                       onclick="checkAll(this)">
            </th>
            <th colspan="3">商品</th>
            <th scope="col">單價</th>
            <th scope="col" style="text-align: center">數量</th>
            <th scope="col">總價</th>
            <th scope="col" style="text-align: center">操作</th>
        </tr>
        </thead>
        <tbody id="table-body">
        </tbody>
    </table>
</div>
<div class="total">
    <P class="p1" id="totalPrice">小計:$</P>
    <div class="btn1">
        <button type="button" class="btn btn-warning" onclick="goStore()">返回逛逛</button>
        <button type="button" class="btn btn-primary" onclick="goOrder()">去買單</button>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.zmin.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script>
    // 會員id
    let memberId = "${memberId}";
    let res;

    //取得購物車資料並組出畫面要的東西
    function getShoppingCart() {
        let req = JSON.stringify({
            "memberId": memberId
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "shoppingCart/getDataList",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (dataList) {
                //檢查是否有取到東西
                console.log(dataList)
                res = dataList;
                res.forEach(function (data) {
                    //建立一個tr物件
                    const tr = document.createElement("tr");
                    //給tr id
                    tr.id = data.shoppingCartId;
                    //如果沒有圖片放預設圖有圖片就放原本圖片
                    let img = data.img == null ? "Store/images/no_picture.gif" : data.img;
                    let html = "<th scope=\"row\" style=\"vertical-align:middle;text-align: center\">\n"
                        + "<input type=\"checkbox\" class=\"mycheckBox\"id=\"check"
                        + data.shoppingCartId
                        + "\" name=\"checkboxName\">\n"
                        + "<label for=\"vehicle1\"></label><br></th>\n"
                        + "<td><img src=\""
                        + img
                        + "\" width=\"150px\" height=\"150px\"></td>\n"
                        + "<td class=\"shopping-item-name\">"
                        + data.productName
                        + "</td>\n"
                        + "<td></td>\n"
                        + "<td style=\"vertical-align:middle\">$"
                        + data.price
                        + "</td>\n"
                        + "<td style=\"text-align: center; vertical-align:middle\">\n"
                        + "<input id=\"min"
                        + data.shoppingCartId
                        + "\" type=\"button\" value=\"-\">\n"
                        + "<input id=\"count"
                        + data.shoppingCartId
                        + "\" oninput = \"value=value.replace(/[^\\d]/g,'')\" maxlength=\"2\" \n"
                        + "type=\"text\" value=\""
                        + data.quantity
                        + "\" size=\"1\" style=\"text-align:center;\">\n"
                        + "<input id=\"add"
                        + data.shoppingCartId
                        + "\" type=\"button\" value=\"+\" data-value=\"123\">\n"
                        + "</td>\n"
                        + "<td id=\"itemTotal"
                        + data.shoppingCartId
                        + "\" style=\"vertical-align:middle\">$"
                        + (data.quantity * data.price)
                        + "</td>\n"
                        + "<td style=\"text-align: center; vertical-align:middle\">\n"
                        + "<button id=\"delete"
                        + data.shoppingCartId
                        + "\" type=\"button\" class=\"btn btn-danger\">刪除</button>\n"
                        + "</td>";
                    tr.innerHTML = html;
                    tr.addEventListener("click", (event => {
                        let countBlock = document.querySelector("#count" + tr.id);
                        let priceBlock = document.querySelector("#itemTotal" + tr.id);
                        if (event.target.id === ("add" + tr.id)) {
                            // 點選+
                            console.log("點選了" + tr.id + "項目的+")
                            if (countBlock.value < 99) {
                                countBlock.value = parseInt(countBlock.value) + 1;
                                data.quantity = parseInt(data.quantity) + 1;
                                updateQuantity(data, priceBlock);
                            }
                        }
                        if (event.target.id === ("min" + tr.id)) {
                            // 點選-
                            console.log("點選了" + tr.id + "項目的-")
                            // 購買項目不能小於1
                            if (countBlock.value > 1) {
                                countBlock.value = parseInt(countBlock.value) - 1;
                                data.quantity = parseInt(data.quantity) - 1;
                                updateQuantity(data, priceBlock);
                            }
                        }
                        if (event.target.id === ("delete" + tr.id)) {
                            // 點選刪除
                            console.log("點選了" + tr.id + "項目的刪除")
                            deleteItem(data, tr);
                        }
                    }));

                    document.querySelector("#table-body").appendChild(tr);

                    // 處理數字框輸入
                    let countBlock = document.querySelector("#count" + tr.id);
                    let priceBlock = document.querySelector("#itemTotal" + tr.id);
                    countBlock.addEventListener("blur", (event => {
                            console.log(event.target.value);
                            let num = event.target.value;
                            if (num == 0) {
                                num = 1;
                                event.target.value = num;
                            }
                            data.quantity = num;
                            updateQuantity(data, priceBlock);
                        }
                    ));
                    // 單選處理
                    let checkbox = document.querySelector("#check" + tr.id);
                    checkbox.checked = data.isCheck;
                    checkbox.addEventListener("change", (event => {
                            data.isCheck = checkbox.checked;
                            checkItem(data);
                        }
                    ));
                })
                sumPrice(res);
            },
            error: function () {
                alert("發生了一些錯誤");
            }
        });
    }

    /**
     * 計算小計金額
     * @param dataList 購物車資料陣列
     */
    function sumPrice(dataList) {
        let total = 0;
        dataList.forEach(function (data) {
            if (data.isCheck)
                total += (data.price * data.quantity);
        })
        document.querySelector("#totalPrice").innerHTML = "小計: " + total;
    }

    function checkAll(checkBox) {
        let checkboxes = document.getElementsByName("checkboxName");

        let req = JSON.stringify({
            "customerId": memberId,
            "isCheck": checkBox.checked
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "shoppingCart/checkAll",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (selectRes) {
                if (selectRes.success) {
                    checkboxes.forEach(function (checkboxItem) {
                        checkboxItem.checked = checkBox.checked;
                    });
                    res.forEach(function (data) {
                        data.isCheck = checkBox.checked;
                    })
                    sumPrice(res);

                } else {
                    alert('error');
                }
            },
            error: function () {
                alert('error');
            }
        });
    }

    /**
     * 更新購物車商品數量
     * @param data 購物車商品資料
     * @param priceBlock 總價格框
     */
    function updateQuantity(data, priceBlock) {
        let req = JSON.stringify({
            "id": data.shoppingCartId,
            "quantity": data.quantity
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "shoppingCart/updateCount",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (updateRes) {
                if (updateRes.success) {
                    priceBlock.innerHTML = "$" + (data.quantity * data.price);
                    sumPrice(res);
                } else {
                    alert('error');
                }
            },
            error: function () {
                alert('error');
            }
        });

    }

    /**
     * 刪除購物車商品
     * @param data 購物車商品資料
     * @param tr 一整列商品元件
     */
    function deleteItem(data, tr) {
        let req = JSON.stringify({
            "id": data.shoppingCartId
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "shoppingCart/delete",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (deleteRes) {
                if (deleteRes.success) {
                    // 找當前筆數位置
                    let i = res.indexOf(data);
                    // 移除陣列中的項目
                    res.splice(i, 1);
                    // 把畫面一整列砍掉
                    tr.remove();
                    sumPrice(res);
                    if (res.length == 0) {
                        reload();
                    }
                } else {
                    alert('error');
                }
            },
            error: function () {
                alert('error');
            }
        });

    }

    /**
     * 選取單一筆商品
     * @param data 購物車商品資料
     */
    function checkItem(data) {
        let req = JSON.stringify({
            "id": data.shoppingCartId,
            "isCheck": data.isCheck
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "shoppingCart/check",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (selectRes) {
                if (selectRes.success) {
                    sumPrice(res);
                } else {
                    alert('error');
                }
            },
            error: function () {
                alert('error');
            }
        });

    }

    // 返回商店頁面
    function goStore() {
        window.location.href = "Store/?memberId=" + memberId;
    }

    // 前往訂單頁面
    function goOrder() {
        let b = false;
        res.forEach(function (data) {
            if (data.isCheck) {
                b = true;
            }
        })
        if (b) {
            window.location.href = "order?memberId=" + memberId;
        } else {
            alert("請選取要購買項目");
        }
    }

    // 重載
    function reload() {
        window.location.href = "shoppingCart?memberId=" + memberId;
    }

    // 使用getShoppingCart方法
    getShoppingCart();

</script>
</body>
</html>
