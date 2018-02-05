package com.hwua.common.po;

public class Favorites {

    private Integer id;
    private Integer mid;
    private Integer pid;
    private String valid;
    private String name;
    private Double price;
    private String image;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    @Override
    public String toString() {
        return "Favorites{" +
                "id=" + id +
                ", mid=" + mid +
                ", pid=" + pid +
                ", valid='" + valid + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                '}';
    }
}
