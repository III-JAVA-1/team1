package com.web.pet.store.dao;

import com.web.pet.store.dto.table.FavoriteDTO;
import com.web.pet.util.DbUtils;

import java.sql.SQLException;

public class FavoriteDAO {

    public static void insert(DbUtils dbu, FavoriteDTO data) throws SQLException {
        String sql = "INSERT INTO favorite (customer_id, product_id) VALUES (?,?)";
        dbu.executeList(sql, data.getCustomerId(), data.getProductId());
    }

    public static void delete(DbUtils dbu, FavoriteDTO data) throws SQLException {
        String sql = "DELETE FROM favorite WHERE customer_id=? AND product_id=?";
        dbu.executeList(sql, data.getCustomerId(), data.getProductId());
    }

    public static void deleteProduct(DbUtils dbu, int productId) throws SQLException {
        String sql = "DELETE FROM favorite WHERE product_id=?";

        dbu.executeList(sql, productId);
    }
}
