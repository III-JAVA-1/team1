function submitOrder() {
    console.log("submitOrder()")
    let data = new FormData();
    let connPhone = '0912345678'
    let country = '桃園市'
    let district = '蘆竹區'
    let address = '中山路一段'
    let petName = 'petName'
    let petBreed = 'petBreed'
    let petAge = '1'
    let petGender = 'petGender'
    let petType = 'petType'
    let proPrice = '100'
    let chooseStart = '2021-01-00T00:00:00'
    let chooseEnd = '2021-01-00T12:00:00'
    let remark = 'remark'
    let momId = '2'

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

    console.log(data)
    $.ajax({
            url: "http://localhost:8080/PetProject_Final_war_exploded/mom/reservationMom",
            type: "POST",
            contentType: false,
            cache: false,
            processData: false,
            data: data,
            success: function () {
                console.log('success')
                Swal.fire({
                    icon: 'success', title: '預約成功',
                    showConfirmButton: false,
                    timer: 1500,
                }).then((result) => {
                    console.log(result)
                    window.location.href = '../mom/extar.jsp';
                })
            }
        }
    );

}

function submitComment() {
    console.log("submitComment()")
    let data = {
        "userId": 1,
        "orderId": 2,
        "star": 1,
        "comment": "comment"
    }

    console.log(data)
    $.ajax({
            url: "http://localhost:8080/PetProject_Final_war_exploded/mom/comment",
            type: "POST",
            contentType: 'application/json; charset=utf-8',
            cache: false,
            processData: false,
            data: JSON.stringify
            (data),
            success: function (data) {
                console.log('success')
                Swal.fire({
                    icon: 'success', title: '成功',
                    showConfirmButton: false,
                    timer: 1500,
                }).then((result) => {
                    console.log(result)
                    showSuccessPage();
                })
            }
        }
    );

}

function showSuccessPage() {
    console.log('showSuccessPage()')
    Swal.fire({
        icon: 'success', title: '成功',
        showConfirmButton: false,
        timer: 1500,
    }).then((result) => {
        console.log(result)
    })
}