
function doScreenShot(chartshot){
    	 html2canvas($(chartshot), {
    	  onrendered: function(canvas) {
    	   canvas.id = "mycanvas"; 
    	   var mainwh=$(chartshot).width(); 
    	   var mainhg=$(chartshot).height();
    	   var img = convertCanvasToImage(canvas);
    	   //console.log(img);
    	   //document.body.appendChild(img);
    	   img.onload = function() {
    	    img.onload = null;
    	    canvas = convertImageToCanvas(img, 0, 0, 1920, 1080); //设置图片大小和位置
    	    img.src = convertCanvasToImage(canvas).src;
    	    //调用下载方法 
    	     if(browserIsIe()){ //假如是ie浏览器    
    	      DownLoadReportIMG(img.src);
    	     }else{
    	      download(img.src)
    	     }
    	    }
    	   }    
    	 });
    	} 
    	//绘制显示图片 
    	function convertCanvasToImage(canvas) {
    	 var image = new Image();
    	 image.src = canvas.toDataURL("image/png"); //获得图片地址
    	 return image;
    	}
    	//生成canvas元素，相当于做了一个装相片的框架
    	function convertImageToCanvas(image, startX, startY, width, height) {
    	 var canvas = document.createElement("canvas");
    	 canvas.width = width;
    	 canvas.height = height;
    	 canvas.getContext("2d").drawImage(image, startX, startY, width, height, 0, 0, 2500, 1500); //在这调整图片中内容的显示（大小,放大缩小,位置等）
    	 return canvas;
    	}
    	 function DownLoadReportIMG(imgPathURL) {
    	 //如果隐藏IFRAME不存在，则添加
    	 if (!document.getElementById("IframeReportImg"))
    	  $('<iframe style="display:none;" id="IframeReportImg" name="IframeReportImg" "DoSaveAsIMG();" width="0" height="0" src="about:blank"></iframe>').appendTo("body");
    	 if (document.all.IframeReportImg.src != imgPathURL) {
    	  //加载图片
    	  document.all.IframeReportImg.src = imgPathURL;
    	 }
    	 else {
    	  //图片直接另存为
    	  DoSaveAsIMG();
    	 }
    	}
    	function DoSaveAsIMG() {
    	 if (document.all.IframeReportImg.src != "about:blank")
    	  window.frames["IframeReportImg"].document.execCommand("SaveAs");
    	}
    	// 另存为图片
    	function download(src) {
    	 var $a = $("<a></a>").attr("href", src).attr("download", "img.png");
    	 $a[0].click();
    	}
    	//判断是否为ie浏览器
    	function browserIsIe() {
    	 if (!!window.ActiveXObject || "ActiveXObject" in window)
    	  return true;
    	 else
    	  return false;
    	}