package com.web.pet.store.controller;

import com.web.pet.store.dao.ProductDAO;
import com.web.pet.store.dto.api.UpdateProductImgReqDTO;
import com.web.pet.store.dto.api.UpdateProductImgResDTO;
import com.web.pet.store.dto.api.UpdateProductReqDTO;
import com.web.pet.store.dto.api.UpdateProductResDTO;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.ResultSet;
import java.sql.SQLException;

@EnableWebMvc
@Controller
// log要用的標籤
@Slf4j
@RequestMapping("/Store")
public class UpdateProductAction {

    /**
     * 取得UpdateProduct.jsp
     *
     * @return UpdateProduct.jsp
     */
    @GetMapping("/UpdateProduct")
    public String init(Model model, @RequestParam("productId") String id) {

        model.addAttribute("productId", id);

        // 資料庫連線處理
        try (DbUtils dbu = new DbUtils()) {

            String sql =
                    "SELECT product_name, introduction, category_id , "
                            + "animal, price, is_display, stock FROM product WHERE product_id=?";

            ResultSet resultSet = dbu.queryList(sql, id);
            if (resultSet.next()) {
                model.addAttribute("product_name", resultSet.getString(1));
                model.addAttribute("introduction", resultSet.getString(2));
                model.addAttribute("stock", resultSet.getInt(7));
                int categoryId = resultSet.getInt(3);

                // 組選項html字串
                StringBuilder stringBuilder = new StringBuilder();
                ResultSet categoryResultSet =
                        dbu.queryList("SELECT category_id, category_name FROM product_category");

                // 拆解資料庫資料
                while (categoryResultSet.next()) {
                    stringBuilder.append("<option value=\"");
                    stringBuilder.append(categoryResultSet.getInt(1));
                    stringBuilder.append("\" ");
                    if (categoryId == categoryResultSet.getInt(1)) {
                        stringBuilder.append("selected");
                    }
                    stringBuilder.append(">");
                    stringBuilder.append(categoryResultSet.getString(2));
                    stringBuilder.append("</option>");
                }
                // 重要!!!resultSet使用完畢必須關閉釋放資源,否則後台服務會塞爆
                categoryResultSet.close();
                // 設定AddProduct.jsp中${product_category}的值
                model.addAttribute("product_category", stringBuilder.toString());

                switch (resultSet.getString(4)) {
                    case "0":
                        model.addAttribute("dog", "selected");
                        break;
                    case "1":
                        model.addAttribute("cat", "selected");
                        break;
                    default:
                        model.addAttribute("universal", "selected");
                        break;
                }
                model.addAttribute("price", resultSet.getString(5));
                if (resultSet.getString(6).equals("T")) {
                    model.addAttribute("isDisplay", "checked");
                } else {
                    model.addAttribute("notDisplay", "checked");
                }
            }
            resultSet.close();
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        return "Store/UpdateProduct";
    }

    @PostMapping("/UpdateProduct/img")
    public @ResponseBody
    UpdateProductImgResDTO img(
            @RequestBody UpdateProductImgReqDTO req) {
        UpdateProductImgResDTO res = new UpdateProductImgResDTO();
        try (DbUtils dbu = new DbUtils()) {
            String sql = "SELECT img FROM product_image WHERE product_id=?";
            res.setImgList(dbu.selectStringAllList(sql, req.getId()));
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/UpdateProduct/update")
    public @ResponseBody
    UpdateProductResDTO update(@RequestBody UpdateProductReqDTO req) {
        UpdateProductResDTO res = new UpdateProductResDTO();
        try (DbUtils dbu = new DbUtils()) {
            ProductDAO.update(dbu, req.toProductDTO());

            String sql="DELETE FROM product_image WHERE product_id=?";
            dbu.executeList(sql, req.getId());

            // 綁定圖片及商品
            sql = "INSERT INTO product_image (product_id, img) VALUES (?,?)";

            for (String url: req.getImgList()) {
                dbu.executeList(sql,req.getId(),url);
            }

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
