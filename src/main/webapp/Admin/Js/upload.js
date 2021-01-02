var feedback = function(res) {
    if (res.success === true) {
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status').classList.add('bg-success');
        document.querySelector('.status').innerHTML =
            '圖片預覽 : ' + '<br><input type=\"hidden"/ class="image-url" value=\"' + get_link + '\"/ name=\"image"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/ style=\"width:300px;height:300px;"/>';
    }
};

new Imgur({
    clientid: '4409588f10776f7', //You can change this ClientID
    callback: feedback
});