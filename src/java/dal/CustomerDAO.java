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
import model.Customer;

/**
 *
 * @author son22
 */
public class CustomerDAO extends DBContext {

    public Customer checkCustomer(String fullName, String email, String mobile) {
        String sql = "SELECT [customer_id]\n"
                + "      ,[customer_name]\n"
                + "      ,[customer_email]\n"
                + "      ,[customer_mobile]\n"
                + "  FROM [dbo].[Customer]\n"
                + "  WHERE customer_name = ? and customer_email = ? and customer_mobile = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, email);
            st.setString(3, mobile);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = Customer.builder()
                        .customer_id(rs.getInt(1))
                        .customer_name(rs.getString(2))
                        .customer_email(rs.getString(3))
                        .customer_mobile(rs.getString(4))
                        .build();
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void storedNewCustomer(String fullName, String email, String mobile) {
        try {
            String sql = "INSERT INTO [dbo].[Customer]\n"
                    + "           ([customer_name]\n"
                    + "           ,[customer_email]\n"
                    + "           ,[customer_mobile])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, email);
            st.setString(3, mobile);
            st.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}
