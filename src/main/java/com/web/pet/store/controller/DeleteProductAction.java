package com.web.pet.store.controller;

import com.web.pet.store.dao.*;
import com.web.pet.store.dto.api.DeleteProductReqDTO;
import com.web.pet.store.dto.api.DeleteProductResDTO;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.SQLException;

/** 後端傳輸範例，可以是使用需求複製貼上後修改 */
@EnableWebMvc
@Controller
@Slf4j
public class DeleteProductAction {

    /**
     * 刪除商品
     *
     * @param req 接收前端傳入的值
     * @return 要回傳給前端的值
     */
    @PostMapping("deleteProduct")
    public @ResponseBody
    DeleteProductResDTO deleteProduct(
            @RequestBody DeleteProductReqDTO req) {
        DeleteProductResDTO res = new DeleteProductResDTO();
        try (DbUtils dbu = new DbUtils()) {
            ProductDAO.delete(dbu, req.getId());
            FavoriteDAO.deleteProduct(dbu, req.getId());
            OrderItemDAO.deleteProduct(dbu, req.getId());
            RateDAO.deleteProduct(dbu, req.getId());
            ShoppingCartDAO.deleteProduct(dbu, req.getId());
            ProductImageDAO.deleteProduct(dbu, req.getId());
            dbu.doCommit();
            res.setSuccess(true);
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        return res;
    }
}
