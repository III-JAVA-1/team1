// fetch('../mom/allMom' , {
//     method : 'POST',
//
// })

// fetch('https://httpbin.org/post', {
//     method: 'POST',
//     body: JSON.stringify(
//         {
//             name: 'GQSM',
//             age: 25
//         }
//     )
// }).then((response) => {
//     return response.json()
// }).then((myJson)=>{
//     console.log(myJson)
// })
let pageValue = 1
search();

function pageGo(page) {
    //  console.log("page"+page.value)
    pageValue = page.value
    // console.log(pageValue)
    search()

}


//ajax查詢
function search() {
    $('#showMom').html("")
    $('#tip').html("")
    $('#page').html("")
    $('#pageF').html("")
    $('#pageB').html("")

    $.ajax({
        url: "../mom/allMom",
        type: "post",
        dataType: "json",
        data: {
            country: $("#selectArea").val(),
            title: $("#selectTitle").val(),
            currPage: pageValue,
            pageSize: 4,
        },
        success: function (data) {

            $("#pageF").append("<li>«</li>")
            for (let i = 1; i < (data.totalDataSize / 4) + 1; i++) {
                //console.log(i);
                $("#page").append("<li value='" + i + "' onclick='pageGo(this)'>" + i + "</li>");
            }
            $("#pageB").append("<li>»</li>")
            console.log(data)
            console.log(data.momDataList)
            data.momDataList.forEach(function (momData) {
                let type = "<div class='col-md-4'>"
                    + "<img src='data:image/png;base64," + momData.img + "' style='width:230px; height:180px;'/>"
                    + "</div>"
                    + "<div class='col-md-7'>"
                    + "<h5>" + momData.title + "</h5>"
                    + " <h6>" + momData.country + " " + momData.district + "</h6>"
                getAddress(momData);
                for (let i = 0; i < momData.starAvg; i++) {
                    type += "<div class='fa fa-star' style='color:#F9F900'></div>";
                }
                if (momData.countTime > 0) {
                    type += "<small>&emsp;(" + momData.countTime + " 評價)</small>"
                }
                type += "<br>"
                if (momData.bodyType1 != null) {
                    type += "<small>迷你犬(0~4kg):O</small> <br>"
                } else {
                    type += "<small>迷你犬(0~4kg):X</small> <br>"
                }
                if (momData.bodyType2 != null) {
                    type += "<small>中型犬(10~24kg):O</small> <br>"
                } else {
                    type += "<small>中型犬(10~24kg):X</small> <br>"
                }
                if (momData.bodyType3 != null) {
                    type += "<small>大型犬(24kg以上):O</small> <br>"
                } else {
                    type += "<small>大型犬(24kg以上):X</small> <br>"
                }
                if (momData.bodyType4 != null) {
                    type += "<small>貓:O</small>"
                } else {
                    type += "<small>貓:X</small>"
                }
                type += "<a href='momDetail.jsp?momId=" + momData.momId + "' style='text-decoration:none;color:white;'><button class='btn btn-secondary' type='button'" +
                    "style='position: absolute; bottom: 10px; right: 20px;' onclick='return goTo()'>保母詳細資料</button></a>" +
                    "<hr>"
                $("#showMom").append(type);

            });
        }, error: function () {
            $("#tip").html("沒有你要找的保母哦");
            pageValue = 1
        }
    });
}


function getAddress(momData) {
    let address = momData.country + momData.district + momData.address
    let title = momData.title
    let geocoder = new google.maps.Geocoder();

    geocoder.geocode({address: address}, function (results, status) {

        if (status === google.maps.GeocoderStatus.OK) {
            let Longitude = results[0].geometry.location.lng();

            let Latitude = results[0].geometry.location.lat();

            var myLatLng = {
                lng : Longitude,

                lat: Latitude
            }
            console.log(myLatLng)
        }
        var marker = new google.maps.Marker({
            position: myLatLng,
        });
        marker.setMap(map);
        let infowindow = new google.maps.InfoWindow({
            content: "<a href='momDetail.jsp?momId=" + momData.momId + "' style='text-decoration:none;color:black;' onclick='return goTo()'>"+title+"</a>" // 支援html
        });
        infowindow.open(map,marker);

    })
}


