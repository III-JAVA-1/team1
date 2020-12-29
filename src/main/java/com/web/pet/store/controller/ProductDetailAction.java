package com.web.pet.store.controller;

import com.web.pet.store.dto.api.*;
import com.web.pet.util.ConvertUtils;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@EnableWebMvc
@Controller
@Slf4j
@RequestMapping("/Store")
public class ProductDetailAction {

    @GetMapping("/productDetail")
    public String init(
            Model model,
            @RequestParam("id") String id, // 商品編號
            @RequestParam(value = "memberId", required = false)
                    String memberId) { // 會員編號不一定要帶也可查詢商品
        model.addAttribute("productId", id);
        model.addAttribute("memberId", memberId);
        try (DbUtils dbu = new DbUtils()) {
            String sql =
                    "SELECT a.product_name, a.introduction, \n"
                            + "       b.category_name, a.animal, a.create_date,\n"
                            + "       a.price, a.stock\n"
                            + "FROM product a, product_category b\n"
                            + "WHERE a.category_id = b.category_id \n"
                            + "AND a.product_id = ?\n";

            ResultSet rs = dbu.queryList(sql, id);
            if (rs.next()) {
                // 把jsp的${productName}換成後面的值
                model.addAttribute("productName", rs.getString(1));
                model.addAttribute("price", rs.getString(6));
                model.addAttribute(
                        "date", ConvertUtils.convertDate(rs.getTimestamp(5), "yyyy-MM-dd HH:mm"));
                model.addAttribute("category", rs.getString(3));
                model.addAttribute("animal", rs.getString(4).equals("0") ? "狗" : "貓");
                model.addAttribute("introduction", rs.getString(2));
                model.addAttribute("surplus", rs.getInt(7));
            }
            rs.close();

            sql =
                    "SELECT a.img FROM product_image a, product b\n"
                            + "WHERE a.product_id=b.product_id\n"
                            + "AND b.product_id=?";
            // 資料庫取得圖片網址為陣列
            List<String> imgList = dbu.selectStringAllList(sql, id);

            // 初始化裝輪播圖要用的html
            StringBuilder indicators = new StringBuilder(); // 畫面指示器
            StringBuilder carousel = new StringBuilder(); // 輪播圖

            // 檢查是否無圖片
            if (imgList.isEmpty()) {
                carousel.append(
                        "<div class=\"carousel-item active\">\n"
                                + "<img src=\"images/no_picture.gif\" class=\"d-block roll-img\" alt=\"...\">\n"
                                + "</div>");
                indicators.append(
                        "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\"0\" class=\"active\"></li>\n");
            }

            for (int i = 0; i < imgList.size(); i++) {
                String img = imgList.get(i);
                if (i == 0) {
                    carousel.append("<div class=\"carousel-item active\">\n" + "<img src=\"")
                            .append(img)
                            .append("\" class=\"d-block roll-img\" alt=\"...\">\n")
                            .append("</div>");
                    indicators
                            .append(
                                    "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\"")
                            .append(i)
                            .append("\" class=\"active\"></li>\n");

                } else {
                    carousel.append("<div class=\"carousel-item\">\n" + "<img src=\"")
                            .append(img)
                            .append("\" class=\"d-block roll-img\" alt=\"...\">\n")
                            .append("</div>");
                    indicators
                            .append(
                                    "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\"")
                            .append(i)
                            .append("\"></li>\n");
                }
            }

            // 檢查是否收藏
            sql = "SELECT COUNT(*) FROM favorite WHERE customer_id=? AND product_id=?";
            int count = dbu.selectIntList(sql, memberId, id);
            if (count == 0) {
                model.addAttribute("likeImage", "../Store/images/noLike.svg");
            } else {
                model.addAttribute("likeImage", "../Store/images/like.svg");
            }

            // 把jsp的${indicators}換成後面的值
            model.addAttribute("indicators", indicators.toString());
            // 把jsp的${carousel}換成後面的值
            model.addAttribute("carousel", carousel.toString());
            // 把jsp的${id}換成後面的值
            model.addAttribute("id", id);

            if (StringUtils.isNotEmpty(memberId) && memberId.equals("1")) {
                model.addAttribute("memberId", memberId);
                String modProductHtml =
                        "<img id=\"pen\" width=\"50\" height=\"50\" onclick=\"goUpdate()\" src=\"../Store/images/pen.svg\" alt=\"\">\n"
                                + "<img id=\"trash\" width=\"50\" height=\"50\" src=\"../Store/images/trash.svg\" alt=\"\"\n"
                                + "data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n"
                                + "<div class=\"modal fade\" id=\"exampleModalCenter\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\"\n"
                                + "aria-hidden=\"true\">\n"
                                + "<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n"
                                + "<div class=\"modal-content\">\n"
                                + "<div class=\"modal-header\">\n"
                                + "<img src=\"../Store/images/warning.svg\" width=\"25\" height=\"25\">\n"
                                + "<h5 class=\"modal-title\" id=\"exampleModalCenterTitle\">注意</h5>\n"
                                + "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n"
                                + "<span aria-hidden=\"true\">&times;</span>\n"
                                + "</button>\n"
                                + "</div>\n"
                                + "<div class=\"modal-body\">\n"
                                + "確認是否要刪除商品\n"
                                + "</div>\n"
                                + "<div class=\"modal-footer\">\n"
                                + "<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">取消</button>\n"
                                + "<button type=\"button\" class=\"btn btn-danger\" onclick=\"doDelete()\">刪除</button>\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>";
                model.addAttribute("modProduct", modProductHtml);
            }

            // 產品售出量
            sql = "SELECT SUM(quantity) FROM order_item WHERE product_id = ?";
            model.addAttribute("saleCount", dbu.selectIntList(sql, id));

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return "Store/ProductDetail";
    }

    @PostMapping("/getRateList")
    public @ResponseBody GetRateListResDTO getRateList(@RequestBody GetRateListReqDTO req) {
        GetRateListResDTO res = new GetRateListResDTO();
        try (DbUtils dbUtils = new DbUtils(); ) {

            // 存放問號的值,解決問號會浮動的問題
            List<Object> args = new ArrayList<>();
            String sql =
                    "SELECT b.Sname,a.date,a.rate,a.message FROM rate a, Member b\n"
                            + "WHERE a.customer_id = b.U_Id\n"
                            + "AND a.product_id=?\n";
            args.add(req.getProductId());

            if (null != req.getRateCount()) {
                sql += "AND a.rate=?;";
                args.add(req.getRateCount());
            }
            ResultSet resultSet =
                    dbUtils.queryList(
                            sql,
                            // 將查詢條件的值轉為array
                            args.toArray(new Object[0]));
            List<RateResDTO> dataList = new ArrayList<>();

            while (resultSet.next()) {
                RateResDTO data = new RateResDTO();
                data.setName(confuseName(resultSet.getString(1)));
                data.setDate(
                        ConvertUtils.convertDate(resultSet.getTimestamp(2), "yyyy-MM-dd HH:mm"));
                data.setRateCount(resultSet.getInt(3));
                data.setMessage(resultSet.getString(4));
                dataList.add(data);
            }
            resultSet.close();
            res.setRateList(dataList);

            sql = "SELECT AVG(rate) FROM rate WHERE product_id=?";

            double avg = dbUtils.selectDoubleList(sql, req.getProductId());
            DecimalFormat df = new DecimalFormat("#.0");
            avg = Double.parseDouble(df.format(avg));

            res.setAvgRate(String.valueOf(avg));
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    /**
     * 碼掉中間名字
     *
     * @param name 名字
     * @return 處理過後的名字
     */
    private String confuseName(String name) {
        String newName = "";
        for (int i = 0; i < name.length(); i++) {
            if (i == 0) {
                // 取得名字的第一個字並填入newName
                newName += name.substring(0, 1);
            } else if (i == name.length() - 1) {
                // 取得名字的最後一個字並填入newName
                newName += name.substring(name.length() - 1);
            } else {
                // 中間的字皆改為*
                newName += "*";
            }
        }
        return newName;
    }
}
