<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../Store/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="../Store/css/addProduct.css" rel="stylesheet">
    <title>修改商品</title>
</head>
<body>
<!-- 選單內容 -->
<!-- Navigation -->
<jsp:include page="Header.jsp"/>
<form>
    <fieldset class="fieldset">
        <legend onclick="doInput()">修改商品</legend>
        <div class="form-group">
            <label for="inputName">* 商品名稱：</label>
            <input type="text" class="form-control" id="inputName" placeholder="請輸入名稱" required value="${product_name}">

        </div>
        <div class="form-group">
            <label for="inputIntro">* 商品描述：</label>
            <textarea class="form-control" id="inputIntro" rows="5" required>${introduction}</textarea>

        </div>
        <div class="form-group">
            <label for="selectCategory">商品類別：</label>
            <select class="form-control" id="selectCategory">
                ${product_category}
            </select>

        </div>
        <div class="form-group">
            <label for="selectAnimal">寵物種類：</label>
            <select class="form-control" id="selectAnimal">
                <option value="0" ${dog}>狗</option>
                <option value="1" ${cat}>貓</option>
                <option value="2" ${universal}>通用</option>
            </select>
        </div>
        <div class="count">
            <P>* 價格：</P>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">$</span>
                </div>
                <input id="inputPrice" type="text" class="form-control"
                       aria-label="Dollar amount (with dot and two decimal places)" required value="${price}"
                       oninput="value=value.replace(/[^\d]/g,'')" onblur="setPrice(this)">
            </div>
        </div>

        <div class="form-group">
            <label for="inputName">* 商品數量：</label>
            <input type="text" class="form-control" id="inputStock" value="${stock}"
                   oninput="value=value.replace(/[^\d]/g,'')" onblur="setStock(this)">
        </div>

        <div class="displayDiv">
            <input type="file" id="fileUploader" class="display_none" onchange="handleFiles(this, this.files)"/>
            <div id="upload_zone" class="upload_zone">
                <P class="pChoose">選擇檔案</P>
            </div>
            <div id="preview" class="d-flex flex-wrap">

            </div>
        </div>
        <div class="displayDiv">
            <P>商品是否上架：</P>
            <div class="custom-control custom-radio">
                <input type="radio" id="customRadio1" name="radioDisplay" class="custom-control-input" value="T"
                ${isDisplay}>
                <label class="custom-control-label" for="customRadio1">上架</label>
            </div>
            <div class="custom-control custom-radio ">
                <input type="radio" id="customRadio2" name="radioDisplay" class="custom-control-input" value="F"
                ${notDisplay}>
                <label class="custom-control-label " for="customRadio2">不上架</label>
            </div>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-primary" onsubmit="return false;" onclick="return doUpdate();">送出
            </button>
        </div>
    </fieldset>
</form>

<script>

    let uploadData = {}
    let imgList = []
    let stock = 1

    let productId =${productId};

    function doUpdate() {

        //取得inputName的元件
        let name = document.querySelector("#inputName");
        //取得輸入框的值並且判斷為空值
        if (name.value === "") {
            // 姓名為空
            return true;
        }
        //取得inputIntro的元件
        let introduction = document.querySelector("#inputIntro");
        //取得輸入框的值並且判斷為空值
        if (introduction.value === "") {
            // 介紹為空
            return true;
        }
        //取得inputPrice的元件
        let price = document.querySelector("#inputPrice");
        //取得輸入框的值並且判斷為空值
        if (price.value === "") {
            // 價格為空
            return true;
        }

        //取得selectCategory的元件,
        //取得輸入框的值,不用判斷因為有預設值
        let category = document.querySelector("#selectCategory");

        //取得selectAnimal的元件,
        //取得輸入框的值,不用判斷因為有預設值
        let animal = document.querySelector("#selectAnimal");

        //取得radioDisplay的原件,
        //不用判斷因為有預設值
        let radios = document.getElementsByName('radioDisplay');

        //預設為不上架
        let isDisplay = "F"

        // 取得選擇商品是否上架狀態
        for (let i = 0, length = radios.length; i < length; i++) {
            if (radios[i].checked) {
                isDisplay = radios[i].value;
                break;
            }
        }

        uploadData.id = parseInt(productId);
        uploadData.name = name.value;
        uploadData.introduction = introduction.value;
        uploadData.categoryId = category.value;
        uploadData.animal = animal.value;
        uploadData.price = price.value;
        uploadData.isDisplay = isDisplay;
        uploadData.imgList = imgList;
        uploadData.stock = stock;

        // 準備後端要儲存的商品資料
        let req = JSON.stringify(uploadData);

        // 跟server post傳輸
        $.ajax({
            // 傳輸格式
            type: "POST",
            // 要傳輸的位置
            url: "UpdateProduct/update",
            // 要傳輸的資料(只有Post才有) body
            data: req,
            // 傳輸的格式
            dataType: "json",
            // 傳輸的格式
            contentType: "application/json",
            // 成功時要做的事(res後端回傳訊息)
            // success,error判斷傳輸是否成功,如果傳輸成功會跑if判斷
            success: function (res) {
                if (res.success) {
                    alert('修改成功');
                    window.location = document.referrer;
                } else {
                    alert('修改失敗');
                }
            },
            // 失敗時要做的事
            error: function () {
                alert('修改失敗');
            }
        });
        return false;
    }

    const dropbox = document.getElementById("upload_zone");
    const preview = document.getElementById("preview");

    function handleFileSelect(e) {
        e.stopPropagation();
        e.preventDefault();
        const fileUploader = document.getElementById("fileUploader");
        fileUploader.click();

    }

    const click = e => handleFileSelect(e);

    function dragenter(e) {

        dropbox.classList.add("upload_zone_enter");
        e.stopPropagation(); // 終止事件傳導
        e.preventDefault(); // 終止預設行為
    }

    const dragleave = () => dropbox.classList.remove("upload_zone_enter");

    function dragover(e) {
        e.stopPropagation(); // 終止事件傳導
        e.preventDefault(); // 終止預設行為
    }

    function handleFiles(input, files) {
        if (input.value === "")
            return
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const imageType = /image.*/;

            if (!file.type.match(imageType)) {
                continue;
            }

            let data = new FormData();
            data.append("file", file);

            $.ajax({
                url: '../uploadImg',
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST', // For jQuery < 1.9
                success: function (res) {
                    setImg($.parseJSON(res).url);
                    input.value = ""
                },
                error: function () {
                    alert('上傳失敗');
                }
            });
        }
    }

    function drop(e) {
        e.stopPropagation(); //終止事件傳導
        e.preventDefault(); // 終止預設行為

        const dt = e.dataTransfer;
        const files = dt.files; // 取得被拖曳的圖片

        handleFiles(files);
        dropbox.classList.remove("upload_zone_enter");
    }

    dropbox.addEventListener("click", click, false);
    dropbox.addEventListener("dragenter", dragenter, false);
    dropbox.addEventListener("dragleave", dragleave, false);
    dropbox.addEventListener("dragover", dragover, false);
    dropbox.addEventListener("drop", drop, false);

    function getImgs() {
        let req = JSON.stringify({
            "id": productId
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "UpdateProduct/img",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                res.imgList.forEach(function (imgUrl) {
                    setImg(imgUrl);
                })
            },
            error: function () {
                alert('error');
            }
        });
    }

    function setImg(imgUrl) {

        const imgDiv = document.createElement("div");
        imgDiv.classList.add("imgDiv");

        const img = document.createElement("img");
        img.classList.add("obj");
        img.src = imgUrl;

        const imgClear = document.createElement("img");
        imgClear.width = 25
        imgClear.height = 25
        imgClear.classList.add("clear")
        imgClear.src = "../Store/images/remove.svg";

        imgDiv.appendChild(img);
        imgDiv.appendChild(imgClear);

        imgClear.addEventListener("click", (event => {
            const index = imgList.indexOf(imgUrl);
            if (index > -1) {
                imgList.splice(index, 1);
            }
            imgDiv.remove();
        }));

        preview.appendChild(imgDiv);

        imgList.push(imgUrl);
    }

    getImgs();

    function setStock(input) {
        if (input.value < 1) {
            input.value = 1
        }
        stock = input.value
    }

    function setPrice(input) {
        if (input.value < 1) {
            input.value = 1
        }
    }

    function doInput() {
        $("#inputName").val("是椅凳也是窩! 日系實木圓口機能椅子窩 (江戶淺蔥藍) (32*32*34cm) 寵物貓狗床窩");
        $("#inputIntro").val("人的凳子，貓咪的家，親密關係，共享和諧生活。\n" +
            "安全舒適。\n" +
            "簡約又耐抓面料。\n" +
            "承重力強。\n" +
            "彈力海綿。\n" +
            "\n" +
            "尺寸: 32*32*34cm (手工測量略有10%誤差)\n" +
            "適用: 迷你小型犬/所有體型貓咪\n" +
            "承重: 100kg以內");
        $("#selectCategory").val("6");
        $("#selectAnimal").val("2");
        $("#inputPrice").val("550");
        $("#inputStock").val("50");
        stock = 50;
        //取得radioDisplay的元件,
        //不用判斷因為有預設值
        let radios = document.getElementsByName('radioDisplay');
        // 取得選擇商品是否上架狀態
        for (let i = 0, length = radios.length; i < length; i++) {
            radios[i].checked = i === 1;
        }
    }


</script>


</body>
<!-- Footer -->
<jsp:include page="Footer.jsp"/>

</html>
