package com.web.pet.mom.controller;

import com.web.pet.mom.Exeption.FavoriteSameMomException;
import com.web.pet.mom.model.req.FavoriteMomReq;
import com.web.pet.mom.service.FavoriteMomService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
public class FavoriteMomController {

    private final FavoriteMomService favoriteMomService;

    @RequestMapping("/favorite")
    public void insertFavoriteMom(FavoriteMomReq req, HttpServletResponse response, HttpServletRequest request) throws IOException {

        request.setCharacterEncoding(CHARSET_CODE);
        response.setContentType(CONTENT_TYPE);

        try {
            Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());
//            Integer uId = 1;
            Integer momId = req.getMomId();
//            Integer momId = 3;

            favoriteMomService.insertFavoriteMom(req, uId, momId);
        } catch (FavoriteSameMomException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }

    }

}


