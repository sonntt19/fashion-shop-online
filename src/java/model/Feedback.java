/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString

public class Feedback {
    private int id;
    private String fullName;
    private int rated_star;
    private String feedback;
    private String image;
    private boolean status;
    private int product_id;
    private int user_id;
    private Date date;
    private String product_name;
    private String email;
    private String phone;
}
