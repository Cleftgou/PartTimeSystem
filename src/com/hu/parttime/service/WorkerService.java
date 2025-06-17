package com.hu.parttime.service;

import com.hu.parttime.pojo.Worker;

public interface WorkerService {
    //求职者注册的业务
    int WorkerRegister(Worker worker);

    //求职者登录的业务（单查）
    Worker WorkerLogin(String w_name, String w_pwd);

    //求职者账号删除的业务

    //求职者账号修改的业务
    int WorkerUpdate(Worker worker);
    //查看全部的雇主信息

    //查(根据账户名检测数据库中是否已经注册过账号)
    Boolean WorkerSelectByName(String name);
}
