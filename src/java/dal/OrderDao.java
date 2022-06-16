/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Cart;
import model.Order;

/**
 *
 * @author dongh
 */
public class OrderDao extends DBContext {

    public int createNewOrder(int sum, String fullname, String phone, String address, int user_id, String note) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([total_cost]\n"
                + "           ,[fullName]\n"
                + "           ,[mobile]\n"
                + "           ,[address]\n"
                + "           ,[userId]\n"
                + "           ,[note])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, sum);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setString(4, address);
            st.setInt(5, user_id);
            st.setString(6, note);

            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Order getOrderNew(int user_id) {
        String sql = "SELECT * FROM [dbo].[Order] where userId = ? and status_order is null";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order p = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .UserId(rs.getInt(8))
                        .saler_id(rs.getInt(9))
                        .note(rs.getString(10))
                        .build();

                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatusOrder(int orderID, int i) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [status_order] = ?\n"
                + " WHERE order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, i);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

}
