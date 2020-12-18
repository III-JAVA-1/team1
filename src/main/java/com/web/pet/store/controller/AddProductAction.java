package com.web.pet.store.controller;

import com.web.pet.store.dao.ProductDAO;
import com.web.pet.store.dto.api.AddProductReqDTO;
import com.web.pet.store.dto.api.AddProductResDTO;
import com.web.pet.store.dto.table.ProductCategoryDTO;
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
public class AddProductAction {

    /**
     * 取得AddProduct.jsp
     *
     * @return AddProduct.jsp
     */
    @GetMapping("/AddProduct")
    public String init(Model model) {

        // 資料庫連線處理
        try (DbUtils dbu = new DbUtils()) {
            // 組選項html字串
            StringBuilder stringBuilder = new StringBuilder();
            ResultSet resultSet =
                    dbu.queryList("SELECT category_id, category_name FROM product_category");

            // 拆解資料庫資料
            while (resultSet.next()) {
                stringBuilder.append("<option value=\"");
                stringBuilder.append(resultSet.getInt(1));
                stringBuilder.append("\">");
                stringBuilder.append(resultSet.getString(2));
                stringBuilder.append("</option>");
            }

            // 重要!!!resultSet使用完畢必須關閉釋放資源,否則後台服務會塞爆
            resultSet.close();

            // 設定AddProduct.jsp中${product_category}的值
            model.addAttribute("product_category", stringBuilder.toString());

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        ProductCategoryDTO productCategoryDTO = new ProductCategoryDTO();

        return "Store/AddProduct";
    }

    /**
     * 新增商品
     *
     * @param req post body 可以加入@Valid檢驗格式 網頁傳過來要儲存商品的資料
     * @return 需要回傳格式
     */
    @PostMapping("/AddProduct/add")
    public @ResponseBody
    AddProductResDTO AddProduct(@RequestBody AddProductReqDTO req) {
        // 準備要回傳的資料(裡面還是空的)
        AddProductResDTO addProductResDTO = new AddProductResDTO();
        // 建立資料庫連線
        try (DbUtils dbu = new DbUtils()) {
            // 將前端傳入的資料轉換後並儲存
            int id = ProductDAO.insert(dbu, req.toProductDTO());

            // 綁定圖片及商品
            String sql = "INSERT INTO product_image (product_id, img) VALUES (?,?)";

            for (String url: req.getImgList()) {
                dbu.executeList(sql,id,url);
            }

            // 儲存做過的事
            dbu.doCommit();

            // 修改回傳的狀態為成功(預設為false)
            addProductResDTO.setSuccess(true);

        } catch (SQLException e) {
            // 資料庫處理錯誤
            // 把錯誤資訊印至console
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        // 回傳資料
        return addProductResDTO;
    }
}
