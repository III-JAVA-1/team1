package com.web.pet.mom.controller;

import com.web.pet.mom.model.req.OrderCommentReq;
import com.web.pet.mom.model.req.StarReq;
import com.web.pet.mom.service.PetMomOrderCommentService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author i19
 */
@AllArgsConstructor
@Controller
@RequestMapping("/mom")
public class PetMomOrderCommentController {

    private final PetMomOrderCommentService petMomOrderCommentService;

    @PostMapping(value = "/comment", produces = "application/json; charset=utf-8")
    public void comment(@RequestBody OrderCommentReq req) {
        petMomOrderCommentService.insertComment(req);

    }

    @PostMapping(value = "/start", produces = "application/json; charset=utf-8")
    public void star(StarReq req) {

    }

}


