function sendPetMom() {

    const data = new FormData();
    let title = $("#title").val();
    let experience = $("#experience").val();
    let notices = $("#notices").val();
    let petContent = $("#petContent").val();

    let myPic = document.getElementById('myPic').files[0];
    console.log(myPic)

    let checkPeace = $("#checkPeace").val();
    let checkBoarding = $("#checkBoarding").val();
    let checkWalkDog = $("#checkWalkDog").val();
    let littleDog

    if (document.getElementById("littleDog").checked) {
        littleDog = $("#littleDog").val();
        data.append("bodyType1", littleDog)
        console.log(littleDog)
    }

    let mediumDog
    if (document.getElementById("mediumDog").checked) {
        mediumDog = $("#mediumDog").val();
        data.append("bodyType2", mediumDog)
        console.log(mediumDog)
    }
    let bigDog;
    if (document.getElementById("bigDog").checked) {
        bigDog = $("#bigDog").val();
        data.append("bodyType3", bigDog)
        console.log(bigDog)
    }

    let cat;
    if (document.getElementById("cat").checked) {
        cat = $("#cat").val();
        data.append("bodyType4", cat)
        console.log(cat)
    }


    // let inpValue = $(".inp");
    // let inpCount = 0;
    // for (let i = 0; i < inpValue.length; i++) {
    //     //console.log(inpValue[i].value);
    //     if (inpValue[i].value > 0) {
    //         inpCount++;
    //     }
    // }
    //
    // if (inpCount < 1) {
    //     Swal.fire('寵物品種 至少輸一個吧大哥')
    //     return false;
    // } else {
    data.append("title", title)
    data.append("experience", experience)
    data.append("notices", notices)
    data.append("petContent", petContent)
    data.append("myPic", myPic)
    data.append("proPrice1", checkPeace)
    data.append("proPrice2", checkBoarding)
    data.append("proPrice3", checkWalkDog)

    console.log(data)
    $.ajax({
        url: "../mom/insertMom",
        type: "POST",
        contentType: false,
        cache: false,
        processData: false,
        data: data,
        success: function (data) {
            showSuccessPage();
            console.log(data);
            console.log('success');
        }, error: function () {
            console.log("error");
            showErrorPage();
        }
    });
    // // }
}

function showSuccessPage() {
    console.log('showSuccessPage()')
    Swal.fire({
        icon: 'success', title: '註冊成功',
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
        icon: 'error', title: '你已經註冊為保母啦',
        showConfirmButton: false,
        timer: 1500,
    }).then((result) => {
        console.log(result)
        window.location.href = '../mom/extar.jsp';
    })
}

