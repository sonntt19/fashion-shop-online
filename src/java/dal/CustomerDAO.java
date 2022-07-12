/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.User;

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

    public List<Customer> getAllCustomerByRoleId() {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from [Customer]\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = Customer.builder()
                        .customer_id(rs.getInt(1))
                        .customer_name(rs.getString(2))
                        .customer_email(rs.getString(3))
                        .customer_mobile(rs.getString(4))
                        .updated_date(rs.getDate(5))
                        .build();
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Customer getCustomerById(String user_Id) {
        String sql = "select * from [Customer]\n"
                + "where customer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user_Id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = Customer.builder()
                        .customer_id(rs.getInt(1))
                        .customer_name(rs.getString(2))
                        .customer_email(rs.getString(3))
                        .customer_mobile(rs.getString(4))
                        .updated_date(rs.getDate(5))
                        .build();
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editCustomerProfile(String cname, String cemail, String cmobile, int cid, String cdate) {
        String sql = "update dbo.[Customer]\n"
                + "               set [customer_name] = ?,\n"
                + "               customer_email = ?,\n"
                + "               customer_mobile = ?,\n"
                + "			   updated_date = ?\n"
                + "               where customer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, cname);
            st.setString(2, cemail);
            st.setString(3, cmobile);
            st.setString(4, cdate);
            st.setInt(5, cid);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Customer checkCustomerExist(String email) {
        String sql = "select * from dbo.[Customer]\n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = Customer.builder()
                        .customer_id(rs.getInt(1))
                        .customer_name(rs.getString(2))
                        .customer_email(rs.getString(3))
                        .customer_mobile(rs.getString(4))
                        .updated_date(rs.getDate(5))
                        .build();
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addCustomer(String customer_name, String customer_email, String customer_moblie, String updated_date) {
        String sql = "insert into Customer\n"
                + "values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customer_name);
            st.setString(2, customer_email);
            st.setString(3, customer_moblie);
            st.setString(4, updated_date);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

}
