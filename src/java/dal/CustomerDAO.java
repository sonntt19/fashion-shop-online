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

    public List<User> getAllCustomerByRoleId() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]\n"
                + "where role_id = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = User.builder()
                        .user_Id(rs.getInt(1))
                        .full_Name(rs.getString(2))
                        .password(rs.getString(3))
                        .avatar(rs.getString(4))
                        .gender(rs.getBoolean(5))
                        .email(rs.getString(6))
                        .mobile(rs.getString(7))
                        .address(rs.getString(8))
                        .status(rs.getBoolean(9))
                        .role_Id(rs.getString(10))
                        .build();
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public User getCustomerById(String user_Id) {
        String sql = "select * from [User]\n"
                + "where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user_Id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = User.builder()
                        .user_Id(rs.getInt(1))
                        .full_Name(rs.getString(2))
                        .password(rs.getString(3))
                        .avatar(rs.getString(4))
                        .gender(rs.getBoolean(5))
                        .email(rs.getString(6))
                        .mobile(rs.getString(7))
                        .address(rs.getString(8))
                        .status(rs.getBoolean(9))
                        .role_Id(rs.getString(10))
                        .build();
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editCustomerProfile(String uname, String uemail, String ugender, String umobile, String uaddress, int uid, String ustatus) {
        String sql = "update dbo.[User]\n"
                + "set [fullName] = ?,\n"
                + "email = ?,\n"
                + "gender = ?,\n"
                + "mobile = ?,\n"
                + "[address] = ?,\n"
                + "[status] = ?\n"
                + "where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, uname);
            st.setString(2, uemail);
            st.setString(3, ugender);
            st.setString(4, umobile);
            st.setString(5, uaddress);
            st.setString(6, ustatus);
            st.setInt(7, uid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public User checkCustomerExist(String email) {
        String sql = "select * from dbo.[User]\n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = User.builder()
                        .user_Id(rs.getInt(1))
                        .full_Name(rs.getString(2))
                        .password(rs.getString(3))
                        .avatar(rs.getString(4))
                        .gender(rs.getBoolean(5))
                        .email(rs.getString(6))
                        .mobile(rs.getString(7))
                        .address(rs.getString(8))
                        .status(rs.getBoolean(9))
                        .role_Id(rs.getString(10))
                        .build();
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void addCustomer(String fullName, String address, String gender, String email, String mobile, String status) {
        String sql = "insert into [User]\n"
                + "values (?,0,0,?,?,?,?,?,'1')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, gender);
            st.setString(3, email);
            st.setString(4, mobile);
            st.setString(5, address);
            st.setString(6, status);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
}
