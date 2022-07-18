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
import java.util.ArrayList;
import java.util.List;
import model.Setting;
import model.TypeSetting;

/**
 *
 * @author son22
 */
public class SettingDAO extends DBContext {

    public int getTotalSetting(String searchKey, String typeId, String status) {
        String sql = "Select count(*) from Setting "
                + "where [type] " + typeId + " and [status] " + status + " and [value] like N'%" + searchKey + "%'\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Setting> getSettingWithPaging(int page, int PAGE_SIZE, String searchKey, String typeId, String type, String value, String status) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from Setting \n"
                + "where [type] " + typeId + " and [status] " + status + " and [value] like N'%" + searchKey + "%' \n"
                + " order by " + value + " " + type + " offset (?-1)*? row fetch next ? row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, PAGE_SIZE);
            st.setInt(3, PAGE_SIZE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting c = Setting.builder()
                        .setting_id(rs.getInt(1))
                        .type(rs.getInt(2))
                        .order(rs.getInt(3))
                        .value(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getBoolean(6))
                        .build();

                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<TypeSetting> getAllSettingType() {
        List<TypeSetting> list = new ArrayList<>();
        String sql = "select * from Setting_Type ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TypeSetting c = TypeSetting.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .build();

                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Setting getSettingById(int setting_id) {
        String sql = "select * from Setting s join Setting_Type st on s.type = st.setting_type_id where setting_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, setting_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting c = Setting.builder()
                        .setting_id(rs.getInt(1))
                        .type(rs.getInt(2))
                        .order(rs.getInt(3))
                        .value(rs.getString(4))
                        .description(rs.getString(5))
                        .status(rs.getBoolean(6))
                        .type_String(rs.getString(8))
                        .build();

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateSettingById(int settingId, String value, String description, int status) {
        String sql = "UPDATE [dbo].[Setting]\n"
                + "   SET [value] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE setting_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            st.setString(2, description);
            st.setInt(3, status);
            st.setInt(4, settingId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCategory(int order, String value, int status) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [category_name] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            st.setInt(2, status);
            st.setInt(3, order);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCategoryBlog(int order, String value, int status) {
        String sql = "UPDATE [dbo].[Category_Blog]\n"
                + "   SET [categoryBlog_name] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE categoryBlog_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            st.setInt(2, status);
            st.setInt(3, order);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateOrderStatus(int order, String value, int status) {
        String sql = "UPDATE [dbo].[Status_Order]\n"
                + "   SET [status_name] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE status_order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            st.setInt(2, status);
            st.setInt(3, order);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRole(int order, String value, int status) {
        String sql = "UPDATE [dbo].[Role]\n"
                + "   SET [role_name] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE role_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            st.setInt(2, status);
            st.setInt(3, order);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int addCategory(String value, int status) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([category_name]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, value);
            st.setInt(2, status);
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

    public int addCategoryBlog(String value, int status) {
        String sql = "INSERT INTO [dbo].[Category_Blog]\n"
                + "           ([categoryBlog_name]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, value);
            st.setInt(2, status);
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

    public int addOrderStatus(String value, int status) {
        String sql = "INSERT INTO [dbo].[Status_Order]\n"
                + "           ([status_name]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, value);
            st.setInt(2, status);
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

    public int addRole(String value, int status) {
        String sql = "INSERT INTO [dbo].[Role]\n"
                + "           ([role_name]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, value);
            st.setInt(2, status);
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

    public void addSettingBy(int type, int order, String value, String description, int status) {
        String sql = "INSERT INTO [dbo].[Setting]\n"
                + "           ([type]\n"
                + "           ,[order]\n"
                + "           ,[value]\n"
                + "           ,[description]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, type);
            st.setInt(2, order);
            st.setString(3, value);
            st.setString(4, description);
            st.setInt(5, status);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
