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

    public void createNewOrder(int sum, String fullname, String phone, String address, int user_id, String note) {
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
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sum);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setString(4, address);
            st.setInt(5, user_id);
            st.setString(6, note);

            st.executeUpdate();

            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
