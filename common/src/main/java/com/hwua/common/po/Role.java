package com.hwua.common.po;

public class Role {

    private Integer dbid;
    private String rolename;
    private String rolecode;
    private String valid;
    private Integer orders;

    public Integer getDbid() {
        return dbid;
    }

    public void setDbid(Integer dbid) {
        this.dbid = dbid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRolecode() {
        return rolecode;
    }

    public void setRolecode(String rolecode) {
        this.rolecode = rolecode;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "Role{" +
                "dbid=" + dbid +
                ", rolename='" + rolename + '\'' +
                ", rolecode='" + rolecode + '\'' +
                ", valid='" + valid + '\'' +
                ", orders=" + orders +
                '}';
    }
}
