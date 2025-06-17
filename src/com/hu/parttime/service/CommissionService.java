package com.hu.parttime.service;

import com.hu.parttime.pojo.Commission;
import com.hu.parttime.utils.PageUtil;

import java.util.List;

/**
 * service业务类接口
 * Commission处理委托的业务
 * 在该类中编写纯业务代码，只专注业务，并且控制事务（解决事务问题）
 * 属于Model
 */
public interface CommissionService {
    //新增委托
    boolean InsertCommission(Commission commission);

    //删除委托
    boolean DeleteCommissionById(int id);

    //修改委托
    boolean UpdateCommission(Commission commission);

    //根据委托标题查询指定委托
    Commission SelectCommissionByTitle(String c_title);

    //查询全部委托
    List<Commission> SelectAllCommission();

    //查(根据雇主账号名检测数据库中当前账号对应的委托信息)
    List<Commission> SelectCommissionByE_name(String e_name);

    //查(根据求职者账号名检测数据库中当前账号对应的委托信息)
    List<Commission> SelectCommissionByW_name(String w_name);

    //修改委托状态
    //设置指定委托的个人账号
    boolean UpdateStateWorkerId(String c_state, int c_id, int w_id);

    //获取分页数据
    PageUtil GetCommissionPage(PageUtil page);

    // 获取已完成的委托
    List<Commission> getCompletedCommissionsByWorkerId(int workerId);
}
