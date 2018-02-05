package com.hwua.common.po;

public class RecipientInfo {

    private Integer id;
    private Integer mid;
    private String name;
    private String tel;
    private String addr;
    private String valid;
    private Integer type;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    @Override
    public String toString() {
        return "RecipientInfo{" +
                "id=" + id +
                ", mid=" + mid +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", addr='" + addr + '\'' +
                ", valid='" + valid + '\'' +
                ", type=" + type +
                '}';
    }
}
