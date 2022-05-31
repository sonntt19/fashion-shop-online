package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class UserDAO extends DBContext {

    public User login(String email, String pass) {
        String sql = "select * from dbo.[User]\n"
                + "where email = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            st.setString(1, email);
            st.setString(2,pass);
            while (rs.next()) {
                User u = User.builder()
                        .role_Id(rs.getInt(1))
                        .full_Name(rs.getString(2))
                        .password(rs.getString(3))
                        .avatar(rs.getString(4))
                        .gender(rs.getBoolean(5))
                        .email(rs.getString(6))
                        .mobile(rs.getString(7))
                        .address(rs.getString(8))
                        .status(rs.getString(9))
                        .role_Id(rs.getInt(10))
                        .build();
                
            }
        } catch (Exception e) {
        }
        return null;
    }
}
