package com.niu.parttime.dao;

import com.niu.parttime.pojo.Worker;

import java.util.List;

public interface WorkerDao {
    //增（注册账号）
    int insert(Worker worker);

    //删
    int deleteById(int id);

    //改
    int update(Worker worker);

    //查
    //单查(登录功能)
    Worker selectByName_Pwd(String name, String pwd);

    //全查
    List<Worker> selectAll();

    //查(根据账户名检测数据库中是否已经注册过账号)
    Worker selectByName(String name);
}
