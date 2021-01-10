function sendPetMom() {

    const data = new FormData();
    let title = $("#title").val();
    let experience = $("#experience").val();
    let notices = $("#notices").val();
    let petContent = $("#petContent").val();

    let myPic = $('#myPic').get(0).files[0];
    let checkPeace = $("#checkPeace").val();
    let checkBoarding = $("#checkBoarding").val();
    let checkWalkDog = $("#checkWalkDog").val();

    let littleDog = null;
    $('#littleDog').click(function () {
        littleDog = $(this).val();
    });

    let mediumDog = null;
    $('#mediumDog').click(function () {
        mediumDog = $(this).val();
    });

    let bigDog = null;
    $('#bigDog').click(function () {
        bigDog = $(this).val();
    });

    let cat = null;
    $('#cat').click(function () {
        cat = $(this).val();
    });

    let inpValue = $(".inp");
    let inpCount = 0;
    for (let i = 0; i < inpValue.length; i++) {
        //console.log(inpValue[i].value);
        if (inpValue[i].value > 0) {
            inpCount++;
        }
    }

    if (inpCount < 1) {
        Swal.fire('寵物品種 至少輸一個吧大哥')
        return false;
    } else {
        data.append("title",title)
        data.append("experience",experience)
        data.append("notices",notices)
        data.append("petContent",petContent)
        data.append("myPic",myPic)
        data.append("proPrice1",checkPeace)
        data.append("proPrice2",checkBoarding)
        data.append("proPrice3",checkWalkDog)
        data.append("bodyType1",littleDog)
        data.append("bodyType2",mediumDog)
        data.append("bodyType3",bigDog)
        data.append("bodyType4",cat)

        console.log(data)
        $.ajax({
            url: "../mom/insertMom",
            type: "POST",
            contentType: false,
            cache: false,
            processData: false,
            data: data,
            success: function (data) {
                console.log(data)
                console.log('success')
                showSuccessPage();
            }, error: function () {
                showErrorPage();
            }
        });

    }
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

