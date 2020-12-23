package com.web.pet.store.dao;

import com.web.pet.store.dto.table.OrderDTO;
import com.web.pet.util.DbUtils;

import java.sql.SQLException;
import java.util.Date;

public class OrderDAO {

    public static int insert(DbUtils dbu, OrderDTO data) throws SQLException {
        String sql =
                "INSERT INTO [order] (date, customer_id, cost, order_status, address, remarks,ecp_no, pay_type) \n"
                        + "OUTPUT inserted.order_id\n"
                        + "VALUES (?,?,?,?,?,?,?,?)";

        return dbu.selectIntList(
                sql,
                new Date(),
                data.getCustomerId(),
                data.getCost(),
                data.getOrderStatus(),
                data.getAddress(),
                data.getRemarks(),
                data.getEcpNo(),
                data.getPayType());

    }




}
