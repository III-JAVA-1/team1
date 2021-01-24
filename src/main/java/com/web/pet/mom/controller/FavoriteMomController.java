package com.web.pet.mom.controller;

import com.web.pet.mom.Exeption.FavoriteSameMomException;
import com.web.pet.mom.model.req.FavoriteMomReq;
import com.web.pet.mom.model.res.FavoriteMomRes;
import com.web.pet.mom.service.FavoriteMomService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author i19
 */
@AllArgsConstructor
@RestController
@RequestMapping("/mom")
public class FavoriteMomController {

    private final FavoriteMomService favoriteMomService;

    @RequestMapping("/favorite")
    public FavoriteMomRes insertOrDeleteFavoriteMom(FavoriteMomReq req, HttpServletResponse response, HttpServletRequest request) throws IOException {

        try {
            Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());
//            Integer uId = 1;
            Integer momId = req.getMomId();
//            Integer momId = 3;
            return favoriteMomService.insertOrDeleteFavoriteMom(req, uId, momId);
        } catch (FavoriteSameMomException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());

        }
        return new FavoriteMomRes(true);
    }

    @RequestMapping("selFavoriteMom")
    public FavoriteMomRes selFavoriteMom(FavoriteMomReq req, HttpServletRequest request) {
        Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());
        Integer momId = req.getMomId();
        return favoriteMomService.selFavoriteMom(uId, momId);

    }
}


