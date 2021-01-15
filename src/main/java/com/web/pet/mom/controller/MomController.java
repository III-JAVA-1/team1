package com.web.pet.mom.controller;

import com.web.pet.mom.Exeption.MomIsExistedException;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.req.MomData;
import com.web.pet.mom.service.MomService;
import com.web.pet.util.BlobToByteArray;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import static com.web.pet.mom.config.MomConstant.CHARSET_CODE;
import static com.web.pet.mom.config.MomConstant.CONTENT_TYPE;

/**
 * @author i19
 */
@AllArgsConstructor
@RestController
@RequestMapping("/mom")
public class MomController {

    private final MomService momService;

    /**
     * 寫入註冊資料
     *
     * @param mom
     * @param myPic
     * @param response
     * @param request
     * @throws IOException
     */
    @CrossOrigin("*")
    @PostMapping(value = "/insertMom", produces = "application/json; charset=utf-8")
    public void insertMom(Mom mom,
                          @RequestParam(value = "myPic", required = false) MultipartFile myPic,
                          HttpServletResponse response, HttpServletRequest request) throws IOException {

        //亂碼處理
        request.setCharacterEncoding(CHARSET_CODE);
        response.setContentType(CONTENT_TYPE);

//        //取得session
        Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());

        try {
            momService.insertMom(myPic,mom, uId);

        } catch (MomIsExistedException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }


    /**
     * 顯示由城市標題查出的保母資料
     *
     * @param country
     * @param title
     * @return
     */
    @RequestMapping(value = "/allMom", produces = "application/json; charset=utf-8")
    public List<MomData> allMom(String country, String title) {

        return momService.getAllMoms(country, title);
    }

    /**
     * @param momId
     * @return 顯示預約時由保母ID查出的保母資料
     */
    @RequestMapping("/showReservation")
    public MomData getReservation(@RequestParam Integer momId) {

        return momService.getReservation(momId);
    }


    /**
     * 顯示與momId相符的圖片
     *
     * @param momId
     * @return
     */
    @RequestMapping(value = "/getPic")
    public byte[] getPicture(@RequestParam Integer momId) {

        Mom mom = momService.showPic(momId);
        Blob blob = mom.getPic();

        return BlobToByteArray.blobToByteArray(blob);
    }
}
