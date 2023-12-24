package com.niu.parttime.dao;

import com.niu.parttime.pojo.Commission;
import com.niu.parttime.utils.PageUtil;

import java.util.List;

public interface CommissionDao {
    //增（新增委托到数据库）
    int insert(Commission commission);

    //删（删除委托）
    int deleteById(int id);

    //改（修改委托）
    int update(Commission commission);

    //查
    //单查(根据委托名去查找具体的委托)
    Commission selectByTitle(String c_title);

    //全查（查询目前所有的委托信息）
    List<Commission> selectAll();

    //查(根据雇主账号名检测数据库中当前账号对应的委托信息)
    List<Commission> selectByE_name(String e_name);

    //查(根据员工账号名检测数据库中当前账号对应的委托信息)
    List<Commission> selectByW_name(String w_name);

    //修改委托状态UPDATE commission SET c_state = 'false' WHERE c_id = 1002;
    //设置指定委托的个人账号UPDATE commission SET w_id = 20003 WHERE c_id = 1007;
    int updateStateWorkerId(String c_state, int c_id, int w_id);

    //分页功能
    //获取总数量
    int getCommissionCount();
    //获取分页数据
    List<Commission> getCommissionPage(PageUtil page);
}