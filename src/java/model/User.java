/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author GanKPoet
 */
public class User {
    private int user_Id,role_Id;
    private String full_Name,password,avatar,email,mobile,address,status;
    private boolean gender;

    public User() {
    }

    public User(int user_Id, int role_Id, String full_Name, String password, String avatar, String email, String mobile, String address, String status, boolean gender) {
        this.user_Id = user_Id;
        this.role_Id = role_Id;
        this.full_Name = full_Name;
        this.password = password;
        this.avatar = avatar;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.status = status;
        this.gender = gender;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getRole_Id() {
        return role_Id;
    }

    public void setRole_Id(int role_Id) {
        this.role_Id = role_Id;
    }

    public String getFull_Name() {
        return full_Name;
    }

    public void setFull_Name(String full_Name) {
        this.full_Name = full_Name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
    
     
}
