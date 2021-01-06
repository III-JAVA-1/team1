function isCheck() {
    let inpValue = document.getElementsByClassName("inp");
    let inpCount = 0;
    for (let i = 0; i < inpValue.length; i++) {
        //console.log(inpValue[i].value);
        if (inpValue[i].value > 0) {
            inpCount++;
        }
    }
    console.log(inpCount);
    if (inpCount < 1) {
        Swal.fire('服務價格 至少輸一個吧大哥')
        return false;
    }

    let chkValue = document.getElementsByClassName("chk");
    let chkCount = 0;
    for (let i = 0; i < chkValue.length; i++) {
        if (chkValue[i].checked === true) {
            chkCount++;
        }

    }
    console.log(chkCount);
    if (chkCount < 1) {
        Swal.fire('寵物品種 至少輸一個吧大哥')
        return false;
    } else {
        return true;
    }
}

function sendPetMomOrder() {
    let title = document.querySelector("title");
    let experience = document.querySelector("experience");
    let notices = document.querySelector("notices");
    let petContent = document.querySelector("petContent");
    let myPic = document.querySelector("myPic");
    let checkPeace = document.querySelector("checkPeace");
    let checkBoarding = document.querySelector("checkBoarding");
    let checkWalkDog = document.querySelector("checkWalkDog");
    let littleDog = document.querySelector("littleDog");
    let mediumDog = document.querySelector("mediumDog");
    let bigDog = document.querySelector("bigDog");
    let cat = document.querySelector("cat");


    let req = JSON.stringify({
        title: title,
        experience: experience,
        notices: notices,
        petContent: petContent,
        myPic: myPic,
        proPrice1: checkPeace,
        proPrice2: checkBoarding,
        proPrice3: checkWalkDog,
        bodyType1: littleDog,
        bodyType2: mediumDog,
        bodyType3: bigDog,
        bodyType4: cat
    })

    console.log(req)
    $.ajax({
        url: "..mom/comment",
        type: "post",
        dataType: "json",
        data : req ,
        success: function (res) {
            console.log(res.toString())
        }
    });
}

