package com.web.pet.mom.controller;

import com.web.pet.mom.Exeption.OrderIsSameMomException;
import com.web.pet.mom.model.req.PetMomOrderReq;
import com.web.pet.mom.service.PetMomOrderService;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.web.pet.mom.config.MomConstant.CHARSET_CODE;
import static com.web.pet.mom.config.MomConstant.CONTENT_TYPE;

/**
 * @author i19
 */
@AllArgsConstructor
@RestController
@RequestMapping("/mom")
@Slf4j
public class PetMomOrderController {

    private final PetMomOrderService petMomOrderService;

    /**
     * 寫入預約資料
     *
     * @param petMomOrder
     * @param response
     * @param request
     * @throws IOException
     */

    @SneakyThrows
    @PostMapping(value = "/reservationMom", produces = "application/json; charset=utf-8")
    public void insertPetMomOrder(
            @RequestParam(value = "picUser", required = false) MultipartFile picUser,
            PetMomOrderReq petMomOrder, HttpServletResponse response, HttpServletRequest request) {

        try {
            //亂碼處理
            request.setCharacterEncoding(CHARSET_CODE);
            response.setContentType(CONTENT_TYPE);

            Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());
//            Integer uId = 1;
            Integer momId = petMomOrder.getMomId();

            petMomOrderService.insertPetMomOrder(picUser, petMomOrder, momId, uId);
        } catch (OrderIsSameMomException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }
}




