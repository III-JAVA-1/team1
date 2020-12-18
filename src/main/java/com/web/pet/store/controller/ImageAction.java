package com.web.pet.store.controller;

import com.web.pet.util.ContextUtils;
import com.web.pet.util.ConvertUtils;
import com.web.pet.util.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.io.File;
import java.io.IOException;

/** 後端傳輸範例，可以是使用需求複製貼上後修改 */
@EnableWebMvc
@Controller
public class ImageAction {

    @PostMapping("/uploadImg")
    public @ResponseBody String uploadImg(
            // 設定要接收的上傳檔案
            @RequestParam("file") MultipartFile file) {

        // 要存放的資料夾路徑
        String outputPath = "src/main/webapp/images/upload/";
        // 要儲存的檔名(使用UUID)
        String fileName = ConvertUtils.createUUID();
        // 取得原始檔案副檔名
        String extension = FileUtils.getExtension(file.getOriginalFilename());

        // 初始化要輸出的完整位置
        File outPutFile = new File(outputPath + fileName + extension);

        try {
            // 將檔案輸出至路徑
            file.transferTo(outPutFile);
        } catch (IOException e) {
            return "上傳失敗";
        }

        // 回傳圖片顯示用的網址
        return ContextUtils.getContextString(ContextUtils.IMG_URL) + fileName + extension;

    }
}
