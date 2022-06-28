/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author GanKPoet
 */
@Builder
@Getter
@Setter
@ToString
public class User {
    private int user_Id;
    private String full_Name;
    private String password;
    private String avatar;
    private boolean gender;
    private String email;
    private String mobile;
    private String address;
    private boolean status;
    private String role_Id;

    
}
