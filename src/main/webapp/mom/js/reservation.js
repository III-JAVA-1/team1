function printPriceResult() {

    let timeStart = Date.parse(document.getElementById("timeStart").value);
    let timeEnd = Date.parse(document.getElementById("timeEnd").value);

    let priceId = document.getElementById("priceId").value;
    if (priceId != null && timeStart != null && timeEnd != null) {

        let price = priceId.split(' ')[1];
        let countTime = timeEnd - timeStart;
        //hour 還要再修改
        //hour = countTime % (24*3600*1000);
        let hour = Math.round(countTime / (1000 * 60 * 60));
        console.log("timeStart " + timeStart)
        console.log("countTime " + countTime)
        console.log("hour" + hour)
        let countResult = price * hour;

        if (countTime <= 0) {
            Swal.fire('結束時間必須大於開始時間')
        } else if (countResult > 0) {
            console.log("countResult " + countResult);
            let p = countResult + " 元"
            console.log(p)
            document.getElementById("total").textContent = p;
        }
    }
}

$("#timeStart").change(function () {
    printPriceResult()
});

$("#timeEnd").change(function () {
    printPriceResult()
});

$("#priceId").change(function () {
    printPriceResult()
});

//取得創建時間
function goTime() {
    document.getElementById("orderCreate").value = new Date();
}


    $("#twzipcode_My").twzipcode({
    zipcodeIntoDistrict: true, // 郵遞區號自動顯示在區別選單中
    css: ["city form-control", "town form-control"],
    countyName: "country", // 自訂城市 select 標籤的 name 值
    districtName: "district", // 自訂地區 select 標籤的 name 值
});







