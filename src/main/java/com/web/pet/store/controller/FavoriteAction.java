package com.web.pet.store.controller;

import com.web.pet.store.dao.FavoriteDAO;
import com.web.pet.store.dto.api.AddFavoriteReqDTO;
import com.web.pet.store.dto.api.AddFavoriteResDTO;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.SQLException;

@EnableWebMvc
@Controller
@Slf4j
public class FavoriteAction {

    @PostMapping("/addFavorite")
    public @ResponseBody
    AddFavoriteResDTO addFavorite(@RequestBody AddFavoriteReqDTO req) {
        AddFavoriteResDTO res = new AddFavoriteResDTO();
        // 要先知道她有沒有已經蒐藏 沒有-> 新增 有 -> 刪除
        String sql = "SELECT COUNT(*) FROM favorite WHERE customer_id=? AND product_id=?";
        try (DbUtils dbu = new DbUtils()) {
            int count = dbu.selectIntList(sql, req.getCustomerId(), req.getProductId());
            if (count == 0) {
                FavoriteDAO.insert(dbu, req.toFavoriteDTO());
                res.setIsFavorite(true);
            } else {
                FavoriteDAO.delete(dbu, req.toFavoriteDTO());
                res.setIsFavorite(false);
            }
            dbu.doCommit();
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }
}
