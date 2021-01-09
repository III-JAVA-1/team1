package com.web.pet.mom.controller;

import com.web.pet.mom.model.req.PetMomOrderReq;
import com.web.pet.mom.service.PetMomOrderService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

/**
 * @author i19
 */
@AllArgsConstructor
@Controller
@RequestMapping("/mom")
@Slf4j
public class PetMomOrderController {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    private static final String CHARSET_CODE = "UTF-8";

    private final PetMomOrderService petMomOrderService;

    /**
     * 寫入預約資料
     *
     * @param petMomOrder
     * @param response
     * @param request
     * @param uId
     * @throws IOException
     */
    @CrossOrigin("http://localhost:63342")
    @PostMapping(value = "/reservationMom", produces = "application/json; charset=utf-8")
    public void insertPetMomOrder(
            @ModelAttribute PetMomOrderReq petMomOrder, HttpServletResponse response, HttpServletRequest request, Integer uId) throws IOException, ParseException {
        try {
            //亂碼處理
            request.setCharacterEncoding(CHARSET_CODE);
            response.setContentType(CONTENT_TYPE);

            Integer momId = petMomOrder.getMomId();
            petMomOrderService.insertPetMomOrder(petMomOrder, momId, uId);
        } catch (Exception oe) {
            log.debug(oe.getMessage(), oe);
        }
    }

}


