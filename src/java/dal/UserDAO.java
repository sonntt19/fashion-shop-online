package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO extends DBContext {

    public User login(String email, String password) {
        String sql = "select * from dbo.[User]\n"
                + "where email = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
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

    public User checkUserExist(String email) {
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

    public void register(String fullName, String password, String gender, String email, String mobile) {
        String sql = "insert into [User]\n"
                + "values (?,?,0,?,?,?,0,0,'1')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, password);
            st.setString(3, gender);
            st.setString(4, email);
            st.setString(5, mobile);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editUserProfile(String uname, String uavatar, String ugender, String umobile, String uaddress, int uid) {
        String sql = "update dbo.[User]\n"
                + "set [fullName] = ?,\n"
                + "avatar = ?,\n"
                + "gender = ?,\n"
                + "mobile = ?,\n"
                + "[address] = ?\n"
                + "where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, uname);
            st.setString(2, uavatar);
            st.setString(3, ugender);
            st.setString(4, umobile);
            st.setString(5, uaddress);
            st.setInt(6, uid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changePassword(int userId, String new_pass1) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET \n"
                    + "      [password] = ?\n"
                    + " WHERE userId = ?\n";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, new_pass1);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUser(int userId, String old_pass) {
        try {
            String sql = "select * from [User] where userId = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, old_pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = User.builder()
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
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByEmail(String email) {
        try {
            String sql = "select * from [User] where email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = User.builder()
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
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserById(int uid) {
        try {
            String sql = "select * from [User] where userId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = User.builder()
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
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]";
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

    public void createNewUser(String fname, String password, String email, String phone, String address, String status, String role_id, String gender) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fullName]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[mobile]\n"
                + "           ,[address]\n"
                + "           ,[status]\n"
                + "           ,[role_id]\n"
                + "		   ,[gender])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fname);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, phone);
            st.setString(5, address);
            st.setString(6, status);
            st.setString(7, role_id);
            st.setString(8, gender);
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

//    public void deleteUser(int userId) {
//        String sql = "DELETE FROM [dbo].[User]\n"
//                + "      WHERE userId = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, userId);
//            st.executeUpdate();
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
    public void UpdateStatusUser(int status, int user_Id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [status] = ?\n"
                + " WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, user_Id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String getAuthorById(int author_id) {
        String sql = "select * from [User] where userId = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, author_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return rs.getString(2);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<User> getAllAuthor() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User] where role_id = 2";
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

    public List<User> getAllSaler() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User] where role_id = 3";
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

    public String getUrlImageById(int id) {
        String sql = "SELECT [avatar]\n"
                + "  FROM [Fashion_Shop_Online].[dbo].[User]\n"
                + "  Where userId = 7";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

}
