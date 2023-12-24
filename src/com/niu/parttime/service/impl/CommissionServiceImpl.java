package com.niu.parttime.service.impl;

import com.niu.parttime.dao.CommissionDao;
import com.niu.parttime.dao.impl.CommissionDaoImpl;
import com.niu.parttime.pojo.Commission;
import com.niu.parttime.service.CommissionService;
import com.niu.parttime.utils.PageUtil;

import java.util.List;

public class CommissionServiceImpl implements CommissionService {

    private CommissionDao commissionDao = new CommissionDaoImpl();

    //新增委托
    @Override
    public boolean InsertCommission(Commission commission) {
        int num = commissionDao.insert(commission);
        if (num>0){
            //删除成功
            return true;
        }
        return false;
    }

    //根据委托编号删除委托
    @Override
    public boolean DeleteCommissionById(int id) {
        int num = commissionDao.deleteById(id);
        if (num>0){
            //删除成功
            return true;
        }
        return false;
    }

    @Override
    public boolean UpdateCommission(Commission commission) {
        int num = commissionDao.update(commission);
        if (num > 0){
            //修改成功
            return true;
        }
        return false;
    }

    //根据委托标题查询指定委托
    @Override
    public Commission SelectCommissionByTitle(String c_title) {
        return commissionDao.selectByTitle(c_title);
    }

    //查询全部委托
    @Override
    public List<Commission> SelectAllCommission() {
        return commissionDao.selectAll();
    }

    //根据商家账号名查询此商家的委托
    @Override
    public List<Commission> SelectCommissionByE_name(String e_name) {
        return commissionDao.selectByE_name(e_name);
    }

    @Override
    public List<Commission> SelectCommissionByW_name(String w_name) {
        return commissionDao.selectByW_name(w_name);
    }

    @Override
    public boolean UpdateStateWorkerId(String c_state, int c_id, int w_id) {
        int num = commissionDao.updateStateWorkerId(c_state, c_id, w_id);
        if (num > 0){
            //修改成功
            return true;
        }
        return false;
    }

    @Override
    public PageUtil GetCommissionPage(PageUtil page) {
        //获取委托总数
        int num = commissionDao.getCommissionCount();
        //设置委托总数
        page.setPageCount(num);
        //当前页数大与总页数
        if (page.getPageNow() > page.getPageSum()){
            page.setPageNow(page.getPageSum());
        }
        //把page数据传给得到分页数据
        List<Commission> commissionList = commissionDao.getCommissionPage(page);
        page.getList().addAll(commissionList);
        return page;
    }
}
