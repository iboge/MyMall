package com.hwua.common.po;

import java.util.List;

public class Auth {

    private Integer dbid;
    private String authname;
    private String authcode;
    private String authurl;
    private String type;
    private Integer parentid;
    private Integer orders;
    private String valid;
    private Integer layer;
    private List<Auth> children;
    private Integer id;
    private String text;

    public Integer getDbid() {
        return dbid;
    }

    public void setDbid(Integer dbid) {
        this.dbid = dbid;
    }

    public String getAuthname() {
        return authname;
    }

    public void setAuthname(String authname) {
        this.authname = authname;
    }

    public String getAuthcode() {
        return authcode;
    }

    public void setAuthcode(String authcode) {
        this.authcode = authcode;
    }

    public String getAuthurl() {
        return authurl;
    }

    public void setAuthurl(String authurl) {
        this.authurl = authurl;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public Integer getLayer() {
        return layer;
    }

    public void setLayer(Integer layer) {
        this.layer = layer;
    }

    public List<Auth> getChildren() {
        return children;
    }

    public void setChildren(List<Auth> children) {
        this.children = children;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Auth auth = (Auth) o;

        if (dbid != null ? !dbid.equals(auth.dbid) : auth.dbid != null) return false;
        if (authname != null ? !authname.equals(auth.authname) : auth.authname != null) return false;
        if (authcode != null ? !authcode.equals(auth.authcode) : auth.authcode != null) return false;
        if (authurl != null ? !authurl.equals(auth.authurl) : auth.authurl != null) return false;
        if (type != null ? !type.equals(auth.type) : auth.type != null) return false;
        if (parentid != null ? !parentid.equals(auth.parentid) : auth.parentid != null) return false;
        if (orders != null ? !orders.equals(auth.orders) : auth.orders != null) return false;
        if (valid != null ? !valid.equals(auth.valid) : auth.valid != null) return false;
        if (layer != null ? !layer.equals(auth.layer) : auth.layer != null) return false;
        if (children != null ? !children.equals(auth.children) : auth.children != null) return false;
        if (id != null ? !id.equals(auth.id) : auth.id != null) return false;
        return text != null ? text.equals(auth.text) : auth.text == null;
    }

    @Override
    public int hashCode() {
        int result = dbid != null ? dbid.hashCode() : 0;
        result = 31 * result + (authname != null ? authname.hashCode() : 0);
        result = 31 * result + (authcode != null ? authcode.hashCode() : 0);
        result = 31 * result + (authurl != null ? authurl.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (parentid != null ? parentid.hashCode() : 0);
        result = 31 * result + (orders != null ? orders.hashCode() : 0);
        result = 31 * result + (valid != null ? valid.hashCode() : 0);
        result = 31 * result + (layer != null ? layer.hashCode() : 0);
        result = 31 * result + (children != null ? children.hashCode() : 0);
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Auth{" +
                "dbid=" + dbid +
                ", authname='" + authname + '\'' +
                ", authcode='" + authcode + '\'' +
                ", authurl='" + authurl + '\'' +
                ", type='" + type + '\'' +
                ", parentid=" + parentid +
                ", orders=" + orders +
                ", valid='" + valid + '\'' +
                ", layer=" + layer +
                ", children=" + children +
                ", id=" + id +
                ", text='" + text + '\'' +
                '}';
    }
}
