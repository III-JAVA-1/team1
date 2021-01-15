package com.web.pet.mom.controller;

import com.web.pet.member.model.Member;
import com.web.pet.mom.Exeption.CommentIsSameOrderException;
import com.web.pet.mom.Exeption.OrderIsSameMomException;
import com.web.pet.mom.model.req.OrderCommentReq;
import com.web.pet.mom.service.PetMomOrderCommentService;
import lombok.AllArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.web.pet.mom.config.MomConstant.CHARSET_CODE;
import static com.web.pet.mom.config.MomConstant.CONTENT_TYPE;

/**
 * @author i19
 */
@AllArgsConstructor
@RestController
@RequestMapping("/mom")
public class PetMomOrderCommentController {


    private final PetMomOrderCommentService petMomOrderCommentService;

    @PostMapping(value = "/comment", produces = "application/json; charset=utf-8")
    public void comment(@RequestBody OrderCommentReq req, HttpServletResponse response, HttpServletRequest request) throws IOException {
        try {
            request.setCharacterEncoding(CHARSET_CODE);
            response.setContentType(CONTENT_TYPE);

//            Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());
            Integer uId = 3;
//            Integer momId = req.getMomId();
            Integer momId = 1;
//            Integer orderId = req.getOrderId();
            Integer orderId = 23;
            petMomOrderCommentService.insertComment(req, uId, momId, orderId);

        } catch (OrderIsSameMomException | CommentIsSameOrderException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }

    }

    @RequestMapping(value = "showComment")
    public List<OrderCommentReq> searchComment(int uId) {
        return petMomOrderCommentService.searchComment(uId);
    }
}


