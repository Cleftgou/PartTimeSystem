package com.niu.parttime.service.impl;

import com.niu.parttime.dao.WorkerDao;
import com.niu.parttime.dao.impl.WorkerDaoImpl;
import com.niu.parttime.pojo.Employer;
import com.niu.parttime.pojo.Worker;
import com.niu.parttime.service.WorkerService;

public class WorkerServiceImpl implements WorkerService {
    private WorkerDao workerDao = new WorkerDaoImpl();

    //注册
    @Override
    public int WorkerRegister(Worker worker) {
        return workerDao.insert(worker);
    }

    @Override
    public Worker WorkerLogin(String w_name, String w_pwd) {
        return workerDao.selectByName_Pwd(w_name, w_pwd);
    }

    @Override
    public int WorkerUpdate(Worker worker) {
        return workerDao.update(worker);
    }

    @Override
    public Boolean WorkerSelectByName(String name) {
        Worker worker = workerDao.selectByName(name);
        if (worker != null){
            //说明存在相同账号，不允许注册
            return false;
        }else {
            //允许注册
            return true;
        }
    }
}
