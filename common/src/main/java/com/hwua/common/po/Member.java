package com.hwua.common.po;

import java.sql.Timestamp;

public class Member {

    private Integer id;
    private String membername;
    private String password;
    private String email;
    private String valid;
    private Timestamp createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", membername='" + membername + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", valid='" + valid + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
