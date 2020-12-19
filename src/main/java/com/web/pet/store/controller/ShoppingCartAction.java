package com.web.pet.store.controller;


import com.web.pet.store.dao.ShoppingCartDAO;
import com.web.pet.store.dto.api.*;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@EnableWebMvc
@Controller
@Slf4j
public class ShoppingCartAction {

    /**
     * GET(取得要顯示的jsp) GetMapping括號中的字串為自己要設定的網址路徑
     *
     * @param model jsp環境
     * @param id 會員id
     * @return jsp的檔案名稱
     */
    @GetMapping("/shoppingCart")
    public String init(Model model, @RequestParam("memberId") String id) {
        model.addAttribute("memberId", id);
        try (DbUtils dbu = new DbUtils()) {
            String sql =
                    "SELECT COUNT(*) FROM shopping_cart a ,product b \n"
                            + "WHERE a.customer_id = ?\n"
                            + "AND a.product_id = b.product_id";
            // 紀錄購物車筆數
            int count = dbu.selectIntList(sql, id);
            if (count > 0) {
                return "Store/ShoppingCart";
            }
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        // 要回傳的jsp檔案名稱(spring mvc會自動去抓對應的jsp給前端)
        return "Store/ShoppingCartEmpty";
    }

    /**
     * 標準POST格式 (傳入及傳出的型別可以自由更改為自己想要的型別, 本範例為String) PostMapping括號中的字串為自己要設定的網址路徑
     *
     * @param req 接收前端傳入的值
     * @return 要回傳給前端的值
     */
    @PostMapping("/shoppingCart/getDataList")
    public @ResponseBody List<ShoppingCardResDTO> getShoppingCard(
            @RequestBody ShoppingCardReqDTO req) {

        // 初始化要回傳的購物車資料陣列
        List<ShoppingCardResDTO> dataList = new ArrayList<>();
        try (DbUtils dbu = new DbUtils()) {
            String sql =
                    "SELECT a.shopping_cart_id, a.product_id, a.quantity,\n"
                            + "b.product_name, b.price,\n"
                            + "(SELECT TOP 1 img FROM product_image WHERE product_id = a.product_id), a.is_check\n"
                            + " FROM shopping_cart a ,product b \n"
                            + "WHERE a.customer_id = ?\n"
                            + "AND a.product_id = b.product_id";
            // 資料庫查詢結果
            ResultSet rs = dbu.queryList(sql, req.getMemberId());
            while (rs.next()) {
                ShoppingCardResDTO data = new ShoppingCardResDTO();
                data.setShoppingCartId(rs.getInt(1));
                data.setProductId(rs.getInt(2));
                data.setQuantity(rs.getInt(3));
                data.setProductName(rs.getString(4));
                data.setPrice(rs.getInt(5));
                data.setImg(rs.getString(6));
                data.setIsCheck(rs.getString(7).equals("T"));
                dataList.add(data);
            }
            rs.close();
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return dataList;
    }

    /**
     * 標準POST格式
     *
     * @param req 接收前端傳入的值
     * @return 要回傳給前端的值
     */
    @PostMapping("/shoppingCart/add")
    public @ResponseBody
    ShoppingCartAddResDTO add(@RequestBody ShoppingCartAddReqDTO req) {
        ShoppingCartAddResDTO res = new ShoppingCartAddResDTO();

        // 要準備與資料庫溝通必須先建立連線(DbUtils)
        try (DbUtils dbu = new DbUtils(); ) {
            ShoppingCartDAO.insert(dbu, req.toShoppingCartDTO());
            // 儲存做過的事
            dbu.doCommit();

            // 修改回傳的狀態為成功(預設為false)
            res.setSuccess(true);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/shoppingCart/updateCount")
    public @ResponseBody
    UpdateCountResDTO updateCount(@RequestBody UpdateCountReqDTO req) {
        UpdateCountResDTO res = new UpdateCountResDTO();

        // 要準備與資料庫溝通必須先建立連線(DbUtils)
        try (DbUtils dbu = new DbUtils(); ) {
            ShoppingCartDAO.updateQuantity(dbu, req.getId(), req.getQuantity());
            // 儲存做過的事
            dbu.doCommit();

            // 修改回傳的狀態為成功(預設為false)
            res.setSuccess(true);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }


    @PostMapping("/shoppingCart/delete")
    public @ResponseBody
    ShoppingCartDeleteResDTO delete(@RequestBody ShoppingCartDeleteReqDTO req) {
        ShoppingCartDeleteResDTO res = new ShoppingCartDeleteResDTO();

        // 要準備與資料庫溝通必須先建立連線(DbUtils)
        try (DbUtils dbu = new DbUtils(); ) {
            ShoppingCartDAO.delete(dbu, req.getId());
            // 儲存做過的事
            dbu.doCommit();

            // 修改回傳的狀態為成功(預設為false)
            res.setSuccess(true);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/shoppingCart/check")
    public @ResponseBody
    CheckResDTO check(@RequestBody CheckReqDTO req) {
        CheckResDTO res = new CheckResDTO();

        // 要準備與資料庫溝通必須先建立連線(DbUtils)
        try (DbUtils dbu = new DbUtils(); ) {
            ShoppingCartDAO.updateCheck(dbu, req.getId(), req.getIsCheck());
            // 儲存做過的事
            dbu.doCommit();

            // 修改回傳的狀態為成功(預設為false)
            res.setSuccess(true);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/shoppingCart/checkAll")
    public @ResponseBody
    CheckAllResDTO checkAll(@RequestBody CheckAllReqDTO req) {
        CheckAllResDTO res = new CheckAllResDTO();

        // 要準備與資料庫溝通必須先建立連線(DbUtils)
        try (DbUtils dbu = new DbUtils(); ) {
            ShoppingCartDAO.updateCheckAll(dbu, req.getCustomerId(),req.getIsCheck());
            // 儲存做過的事
            dbu.doCommit();

            // 修改回傳的狀態為成功(預設為false)
            res.setSuccess(true);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }
}
