package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO extends DBContext {

    public User check_Password_Exsit(String old_pass, int user_Id) {
        String sql = "select * from Account where password = ? and id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, old_pass);
            ps.setInt(2, user_Id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("displayName"),
                        rs.getString("address"),
                        rs.getString("email"),
                        sql, sql, old_pass, sql, true)
                return user;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
}
