package com.niu.parttime.service.impl;

import com.niu.parttime.dao.EmployerDao;
import com.niu.parttime.dao.impl.EmployerDaoImpl;
import com.niu.parttime.pojo.Employer;
import com.niu.parttime.service.EmployerService;

/**
 * service业务实现类
 * 在该类中编写纯业务代码，只专注业务，并且控制事务（解决事务问题）
 * 属于Model
 */
public class EmployerServiceImpl implements EmployerService {
    //因为后面的每个业务（方法）可能需要链接数据库，所以起一个私有的dao对象，用来链接数据库
    private EmployerDao employerDao = new EmployerDaoImpl();

    @Override
    public int EmployerRegister(Employer employer) {
        return employerDao.insert(employer);
    }

    @Override
    public Employer EmployerLogin(String e_name, String e_pwd) {
        return employerDao.selectByName_Pwd(e_name, e_pwd);
    }

    @Override
    public int EmployerUpdate(Employer employer) {
        return employerDao.update(employer);
    }

    @Override
    public Boolean EmployerSelectByName(String name) {
        Employer employer = employerDao.selectByName(name);
        if (employer != null){
            //说明存在相同账号，不允许注册
            return false;
        }else {
            //允许注册
            return true;
        }
    }

    @Override
    public Boolean EmployerSelectByEmail(String email) {
        Employer employer = employerDao.selectByEmail(email);
        if (employer != null){
            //说明存在相同账号，不允许注册
            return false;
        }else {
            //允许注册
            return true;
        }
    }

    @Override
    public boolean EmployerUpdatePwdByNameEmail(Employer employer) {
        int i = employerDao.updateEmployerPwd(employer);
        if (i > 0){
            //修改成功
            return true;
        }
        return false;
    }

    @Override
    public boolean EmployerSelectByName_Email(String name, String email) {
        Employer employer = employerDao.selectByName_Email(name, email);
        if (employer != null){
            //说明账户存在，可以找回密码
            return true;
        }
        return false;
    }
}
