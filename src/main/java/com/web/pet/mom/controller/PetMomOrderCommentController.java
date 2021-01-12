package com.web.pet.mom.controller;

import com.web.pet.mom.model.req.OrderCommentReq;
import com.web.pet.mom.service.PetMomOrderCommentService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author i19
 */
@AllArgsConstructor
@RestController
@RequestMapping("/mom")
public class PetMomOrderCommentController {

    private final PetMomOrderCommentService petMomOrderCommentService;

    @CrossOrigin("*")
    @PostMapping(value = "/comment", produces = "application/json; charset=utf-8")
    public void comment(@RequestBody OrderCommentReq req) {
        petMomOrderCommentService.insertComment(req);
    }

    @GetMapping(value = "/health")
    public String health(){
        return "OK";
    }

}


