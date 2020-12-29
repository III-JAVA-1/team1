package com.web.pet.store.dao;

import com.sun.xml.bind.v2.model.core.ID;
import com.web.pet.store.dto.table.ProductDTO;
import com.web.pet.util.DbUtils;

import java.sql.SQLException;

public class ProductDAO {

    public static int insert(DbUtils dbu, ProductDTO data) throws SQLException {
        String sql =
                "INSERT INTO product (product_name, introduction, category_id, price, animal, create_date, is_display, stock) \n"
                        + "OUTPUT inserted.product_id\n"
                        + "VALUES (?,?,?,?,?,?,?,?)";

        return dbu.selectIntList(
                sql,
                data.getProductName(),
                data.getIntroduction(),
                data.getCategoryId(),
                data.getPrice(),
                data.getAnimal(),
                data.getCreateDate(),
                data.getIsDisplay(),
                data.getStock());
    }

    public static void delete(DbUtils dbu, int id) throws SQLException {
        String sql = "DELETE FROM product where product_id=?";
        dbu.executeList(sql, id);
    }

    public static int update(DbUtils dbu, ProductDTO data) throws SQLException {
        String sql =
                "UPDATE product SET product_name=?,introduction=?,\n"
                        + "category_id=?,price=?,animal=?,\n"
                        + "is_display=?, stock=?\n"
                        + "WHERE product_id=?";

        return dbu.executeList(
                sql,
                data.getProductName(),
                data.getIntroduction(),
                data.getCategoryId(),
                data.getPrice(),
                data.getAnimal(),
                data.getIsDisplay(),
                data.getStock(),
                data.getProductId());
    }

    /**
     * 修改庫存數量
     * @param id 商品id
     * @param minusCount 要減去的庫存量
     */
    public static void updateStock(DbUtils dbu, int id, int minusCount) throws SQLException {
        String sql = "UPDATE product SET stock = stock - ? WHERE product_id = ?";
        dbu.executeList(sql, minusCount, id);
    }
}
