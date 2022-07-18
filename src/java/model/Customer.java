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

/**
 *
 * @author son22
 */
@Builder
@Getter
@Setter
@ToString
public class Customer {
    private int customer_id;
    private String customer_name;
    private String customer_email;
    private String customer_mobile;
    private Date updated_date;
    private boolean status;
}
