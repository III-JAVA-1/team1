$().ready(function () {
    $.ajax({
        url: "../mom/showReservation",
        type: "post",
        dataType: "json",
        data: {
            "momId": $("#momId").val()
        },
        success: function (data) {

            console.log(data)

            $("#sName").text("聯絡 " + data.momDetailData.sname)
            console.log(data.momDetailData.proPrice1)
            let pet = "<option>請選擇貓或狗</option>";
            if (data.momDetailData.bodyType1 != null) {
                pet += "<option id='type1' name='type1'>" + data.momDetailData.bodyType1 + "</option>"
            }
            if (data.momDetailData.bodyType2 != null) {
                pet += "<option id='type2' name='type2'>" + data.momDetailData.bodyType2 + "</option>"
            }
            if (data.momDetailData.bodyType3 != null) {
                pet += "<option id='type3' name='type3'>" + data.momDetailData.bodyType3 + "</option>"
            }
            if (data.momDetailData.bodyType4 != null) {
                pet += "<option id='type4' name='type4'>" + data.momDetailData.bodyType4 + "</option>"
            }
            $("#petId").append(pet);

            let price = "<option>服務種類</option>";
            if (data.momDetailData.proPrice1 != null) {
                price += "<option id='service1' name='service1'>到府遛狗 " + data.momDetailData.proPrice1 + " 元/1hr</option>"
            }
            if (data.momDetailData.proPrice2 != null) {
                price += "<option id='service2' name='service2'>安親照顧 " + data.momDetailData.proPrice2 + " 元/1hr</option>"
            }
            if (data.momDetailData.proPrice3 != null) {
                price += "<option id='service3' name='service3'>寄宿照顧 " + data.momDetailData.proPrice3 + " 元/1hr</option>"
            }
            $("#priceId").append(price)
        }

    });
});


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

// //取得創建時間
// function goTime() {
//     document.getElementById("orderCreate").value = new Date();
// }

// $("#twzipcode_My").twzipcode({
//     zipcodeIntoDistrict: true, // 郵遞區號自動顯示在區別選單中
//     css: ["city form-control", "town form-control"],
//     countyName: "country", // 自訂城市 select 標籤的 name 值
//     districtName: "district", // 自訂地區 select 標籤的 name 值
// });

function submit() {
    console.log("submit()")
    const data = new FormData();
    let connPhone = $("#userPhone").val()
    let country = $(".city").val()
    let district = $(".town").val()
    let address = $("#idAddress").val()
    let picUser = document.getElementById("picUser").files[0];
    let petName = $("#petName").val()
    let petBreed = $("#breed").val()
    let petAge = $("#petAge").val()
    let petGender = $("#petGender").val()
    let petType = $("#petId").val()
    let proPrice = $("#priceId").val()
    let chooseStart = $("#timeStart").val()
    let chooseEnd = $("#timeEnd").val()
    let remark = $("#remark").val()
    let momId = $("#momId").val()

    console.log(picUser)
    console.log(connPhone)
    console.log(country)
    console.log(district)
    console.log(address)
    console.log(petName)
    console.log(petBreed)
    console.log(petAge)
    console.log(petType)
    console.log(proPrice)
    console.log(petGender)
    console.log(chooseStart)
    console.log(chooseEnd)
    console.log(remark)
    console.log(momId)

    data.append("connPhone", connPhone)
    data.append("country", country)
    data.append("district", district)
    data.append("address", address)
    data.append("petName", petName)
    data.append("petBreed", petBreed)
    data.append("petAge", petAge)
    data.append("petGender", petGender)
    data.append("petType", petType)
    data.append("proPrice", proPrice)
    data.append("chooseStart", chooseStart)
    data.append("chooseEnd", chooseEnd)
    data.append("remark", remark)
    data.append("momId", momId)
    data.append("picUser", picUser)

    console.log(data)
    $.ajax({
        url: "../mom/reservationMom",
        type: "POST",
        contentType: false,
        cache: false,
        processData: false,
        data: data,
        success: function (data) {
            showSuccessPage()
            console.log(data)
            console.log('success')
        }, error: function () {
            showErrorPage()
        }
    });
}

function showSuccessPage() {
    console.log('showSuccessPage()')
    Swal.fire({
        icon: 'success', title: '預約成功',
        showConfirmButton: false,
        timer: 1500,
    }).then((result) => {
        console.log(result)
        window.location.href = '../mom/extar.jsp';
    })
}

function showErrorPage() {
    console.log('showErrorPage()')
    Swal.fire({
        icon: 'error', title: '預約失敗 自己無法預約自己',
        showConfirmButton: false,
        timer: 1500,
    }).then((result) => {
        console.log(result)
        window.location.href = '../mom/extar.jsp';
    })
}



