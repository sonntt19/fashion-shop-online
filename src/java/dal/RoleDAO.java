/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author dongh
 */
public class RoleDAO extends DBContext{

    public List<Role> getAllRole() {
       List<Role> list = new ArrayList<>();
        String sql = "select * from Role and status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = Role.builder()
                        .role_id(rs.getInt(1))
                        .role_name(rs.getString(2))
                        .build();
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }



    
}
