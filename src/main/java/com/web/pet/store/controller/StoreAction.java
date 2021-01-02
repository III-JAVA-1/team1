package com.web.pet.store.controller;

import com.web.pet.store.dto.api.*;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class StoreAction {

    // 可以自己命名網址路徑位置
    @GetMapping("/Store")
    public String init(
            Model model,
            @RequestParam(value = "memberId", required = false) String memberId,
            @RequestParam(value = "sort", required = false) String sort) {

        // 資料庫連線處理
        try (DbUtils dbu = new DbUtils()) {
            // 組選項html字串
            StringBuilder stringBuilder = new StringBuilder();
            ResultSet resultSet =
                    dbu.queryList("SELECT category_id, category_name FROM product_category");

            stringBuilder.append(
                    "<button type=\"button\" class=\"btn btn-outline-secondary all-button category-btn active\" onclick=\"categoryClick(this)\" value=\"");
            stringBuilder.append(0);
            stringBuilder.append("\">");
            stringBuilder.append("全部");
            stringBuilder.append("</button>");

            // 拆解資料庫資料
            while (resultSet.next()) {
                stringBuilder.append(
                        "<button type=\"button\" class=\"btn btn-outline-secondary all-button category-btn\" onclick=\"categoryClick(this)\" value=\"");
                stringBuilder.append(resultSet.getInt(1));
                stringBuilder.append("\">");
                stringBuilder.append(resultSet.getString(2));
                stringBuilder.append("</button>");
            }

            // 重要!!!resultSet使用完畢必須關閉釋放資源,否則後台服務會塞爆
            resultSet.close();

            // 設定AddProduct.jsp中${product_category}的值
            model.addAttribute("product_category", stringBuilder.toString());

            if (StringUtils.isNotEmpty(memberId)) {
                model.addAttribute("memberId", memberId);
            }
            if (StringUtils.isNotEmpty(sort)) {
                try {
                    model.addAttribute("sort", Integer.valueOf(sort));
                } catch (Exception e) {
                    model.addAttribute("sort", 0);
                }
            } else {
                model.addAttribute("sort", 0);
            }
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        return "Store/Store";
    }

    @PostMapping("/store/getCard")
    public @ResponseBody GetCardResDTO test(@RequestBody GetCardReqDTO req) {

        GetCardResDTO res = new GetCardResDTO();
        // 查詢條件的值存放陣列
        List<Object> args = new ArrayList<>();
        String sql =
                "SELECT a.product_id,\n"
                        + "a.product_name,\n"
                        + "a.price,\n"
                        + "(SELECT top 1 img\n"
                        + "FROM product_image b\n"
                        + "WHERE a.product_id = b.product_id),\n"
                        + "(SELECT count(*)\n"
                        + "FROM favorite\n"
                        + "WHERE product_id = a.product_id\n"
                        + "AND customer_id = ?), a.is_display\n"
                        + "FROM product a\n"
                        + "WHERE 1 = 1\n";
        args.add(req.getMemberId());

        List<Object> countArgs = new ArrayList<>();
        String countSql = "SELECT count(*)\n" + "FROM product a\n" + "WHERE 1 = 1\n";

        // 檢查是否為管理者
        if (!StringUtils.isNotEmpty(req.getMemberId()) || !req.getMemberId().equals("1")) {
            // 不是管理者身分要加限制條件
            sql += "AND a.is_display='T'\n";
            countSql += "AND a.is_display='T'\n";
        }

        if (null != req.getCategory()) {
            // 當category不為空要加入條件
            sql += "AND a.category_id = ?\n";
            countSql += "AND a.category_id = ?\n";
            args.add(req.getCategory());
            countArgs.add(req.getCategory());
        }

        if (null != req.getAnimal()) {
            // 當Animal不為空要加入條件
            sql += "AND a.animal = ?\n";
            countSql += "AND a.animal = ?\n";
            args.add(req.getAnimal());
            countArgs.add(req.getAnimal());
        }

        if (null != req.getName()) {
            // 當Name不為空要加入條件
            sql += "AND a.product_name LIKE '%' + ? + '%'  \n";
            countSql += "AND a.product_name LIKE '%' + ? + '%'  \n";
            args.add(req.getName());
            countArgs.add(req.getName());
        }

        if (req.getSort() == 1) {
            // 按照最新順序排
            sql += "ORDER BY a.create_date DESC\n";
        } else {
            // 按照熱門順序排
            sql +=
                    "ORDER BY (SELECT count(*) FROM order_item c\n"
                            + "WHERE c.product_id = a.product_id) DESC\n";
        }

        sql += "OFFSET ? ROWS\n" + "FETCH NEXT 20 ROWS ONLY";
        args.add((req.getPages() - 1) * 20);

        try (DbUtils dbu = new DbUtils()) {
            // 執行查詢資料庫
            ResultSet resultSet =
                    dbu.queryList(
                            sql,
                            // 將查詢條件的值轉為array
                            args.toArray(new Object[0]));

            // 初始化要裝卡片的陣列
            List<CardResDTO> dataList = new ArrayList<>();

            // resultSet是上面SQL語法查出來的結果
            while (resultSet.next()) {
                CardResDTO data = new CardResDTO();
                data.setId(resultSet.getInt(1));
                data.setName(resultSet.getString(2));
                data.setPrice(resultSet.getInt(3));
                data.setImg(resultSet.getString(4));
                data.setIsFavorite(resultSet.getInt(5) == 1);
                data.setIsDisplay(resultSet.getString(6).equals("T"));
                dataList.add(data);
            }

            resultSet.close();
            res.setCardList(dataList);

            int totalCount =
                    dbu.selectIntArray(
                            countSql,
                            // 將查詢條件的值轉為array
                            countArgs.toArray(new Object[0]));

            int totalPages = totalCount / 20;

            if (totalCount % 20 > 0) {
                totalPages++;
            }

            res.setTotalPages(totalPages);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/shoppingCartQuantity")
    public @ResponseBody ShoppingCartQuantityResDTO shoppingCartQuantity(
            @RequestBody ShoppingCartQuantityReqDTO req) {
        ShoppingCartQuantityResDTO res = new ShoppingCartQuantityResDTO();
        try (DbUtils dbu = new DbUtils()) {
            String sql = "SELECT count(*) FROM shopping_cart WHERE customer_id=?";
            int count = dbu.selectIntList(sql, req.getMemberId());
            res.setQuantity(count);
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }
}
