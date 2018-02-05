package com.hwua.common.po;

public class MemberCart {

    private Integer id;
    private Integer mid;
    private Integer pid;
    private Integer quantity;
    private String valid;
    private String name;
    private String image;
    private Double price;

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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "memberCart{" +
                "id=" + id +
                ", mid=" + mid +
                ", pid=" + pid +
                ", quantity=" + quantity +
                ", valid='" + valid + '\'' +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                '}';
    }
}
