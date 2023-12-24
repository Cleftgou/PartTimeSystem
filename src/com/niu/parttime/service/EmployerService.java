package com.niu.parttime.service;

import com.niu.parttime.pojo.Employer;

/**
 * service业务类接口
 * Employer处理雇主的业务
 * 在该类中编写纯业务代码，只专注业务，并且控制事务（解决事务问题）
 * 属于Model
 */
public interface EmployerService {
    //雇主注册的业务
    int EmployerRegister(Employer employer);

    //雇主登录的业务（单查）
    Employer EmployerLogin(String e_name, String e_pwd);

    //雇主账号删除的业务

    //雇主账号修改的业务
    int EmployerUpdate(Employer employer);
    //查看全部的雇主信息

    //查(根据账户名检测数据库中是否已经注册过账号)
    Boolean EmployerSelectByName(String name);

    //查(根据邮箱检测数据库中是否已经注册过账号)
    Boolean EmployerSelectByEmail(String email);

    //根据账号和邮箱修改密码
    boolean EmployerUpdatePwdByNameEmail(Employer employer);

    //查，根据账号名和邮箱找回账户
    boolean EmployerSelectByName_Email(String name, String email);
}