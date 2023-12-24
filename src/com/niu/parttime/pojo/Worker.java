package com.niu.parttime.pojo;

//工人的实体类
public class Worker {
    private Integer w_id;
    private String w_name;
    private String w_pwd;

    public Worker(){}

    public Worker(Integer w_id, String w_name, String w_pwd){
        this.setW_id(w_id);
        this.setW_name(w_name);
        this.setW_pwd(w_pwd);
    }

    public void setW_id(Integer w_id) {
        this.w_id = w_id;
    }

    public void setW_name(String w_name) {
        this.w_name = w_name;
    }

    public void setW_pwd(String w_pwd) {
        this.w_pwd = w_pwd;
    }

    public Integer getW_id() {
        return w_id;
    }

    public String getW_name() {
        return w_name;
    }

    public String getW_pwd() {
        return w_pwd;
    }

    @Override
    public String toString() {
        return "Worker{" +
                "w_id=" + w_id +
                ", w_name='" + w_name + '\'' +
                ", w_pwd='" + w_pwd + '\'' +
                '}';
    }
}
