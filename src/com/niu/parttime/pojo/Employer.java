package com.niu.parttime.pojo;

/**
 * -- 创建雇主表
 * CREATE TABLE employer (
 *     e_id INT PRIMARY KEY AUTO_INCREMENT,
 *     e_name VARCHAR(50) NOT NULL,
 *     e_pwd VARCHAR(50) NOT NULL,
 *     e_email VARCHAR(50) NOT NULL
 * );
 *
 * INSERT INTO employer VALUES (10001, '小牛', '123456', '120@qq.com');
 */

//（Plain Old Java Object 又普通又老的对象）
//雇主实体类，封装雇主信息
//一般是一张表对应一个实体类。这是因为Java是一门面向对象的语言
//属于Model
public class Employer {

    //一般使用包装类，避免null异常
    //private int e_id = null;
    private Integer e_id;//自动生成的雇主编号
    private String e_name;//雇主用来登录的账号名
    private String e_pwd;//雇主用来登录的密码
    private String e_email;//雇主详细信息里的邮箱

    public Employer(){}

    public Employer(Integer e_id, String e_name, String e_pwd, String e_email){
        this.setE_id(e_id);
        this.setE_name(e_name);
        this.setE_pwd(e_pwd);
        this.setE_email(e_email);
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public void setE_pwd(String e_pwd) {
        this.e_pwd = e_pwd;
    }

    public void setE_email(String e_email) {
        this.e_email = e_email;
    }

    public String getE_email() {
        return e_email;
    }

    public Integer getE_id() {
        return e_id;
    }

    public String getE_name() {
        return e_name;
    }

    public String getE_pwd() {
        return e_pwd;
    }

    @Override
    public String toString() {
        return "Employer{" +
                "e_id=" + e_id +
                ", e_name='" + e_name + '\'' +
                ", e_pwd='" + e_pwd + '\'' +
                ", e_email='" + e_email + '\'' +
                '}';
    }
}
