package com.hwua.common.po;

import java.sql.Timestamp;

public class Evaluate {

    private Integer id;
    private Integer pid;
    private Integer mid;
    private String evaluates;
    private Timestamp createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getEvaluates() {
        return evaluates;
    }

    public void setEvaluates(String evaluates) {
        this.evaluates = evaluates;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "Evaluate{" +
                "id=" + id +
                ", pid=" + pid +
                ", mid=" + mid +
                ", evaluates='" + evaluates + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
