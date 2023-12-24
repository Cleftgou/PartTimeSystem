package com.niu.parttime.dao;

import com.niu.parttime.pojo.Employer;
import java.util.List;

/**
 * DAO（Data Access Object）数据库访问对象
 * DAO实际上是一种JavaEE设计模式
 * DAO 只负责数据库的增删改查（CRUD）
 * 一般一张表对应一个DAO对象
 * 属于Model
 */
public interface EmployerDao {
    //增（注册账号）
    int insert(Employer employer);

    //删
    int deleteById(int id);

    //改
    int update(Employer employer);

    //查
    //单查(登录功能)
    Employer selectByName_Pwd(String name, String pwd);

    //全查
    List<Employer> selectAll();

    //查(根据账户名检测数据库中是否已经注册过账号)
    Employer selectByName(String name);

    //查(根据邮箱检测数据库中是否已经注册过账号)
    Employer selectByEmail(String email);

    //根据账号和邮箱修改密码
    int updateEmployerPwd(Employer employer);

    //查，根据账号名和邮箱找回账户
    Employer selectByName_Email(String name, String email);
}

