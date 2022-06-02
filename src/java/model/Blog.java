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
 * @author Admin
 */
@Builder
@Getter
@Setter
@ToString
public class Blog {
    private int id;
    private String title;
    private int author_id;
    private Date updated_date;
    private String content;
    private String thumbnail;
    private String brief_info;
    private int categoryBlog_id;
}
