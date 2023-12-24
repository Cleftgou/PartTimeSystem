package com.niu.parttime.utils;

import java.util.ArrayList;
import java.util.List;

//分页的工具类
public class PageUtil {
    //属性
    //每一页显示的数据数量(pageSize)
    private Integer pageSize = 8;

    //信息总数量(pageCount)
    private Integer pageCount;

    //总页数(pageSum)
    private Integer pageSum;

    //当前页(pageNow)
    private Integer pageNow;

    //当前界面数据的集合
    private List<Object> list = new ArrayList<>();

    public Integer getPageCount() {
        return pageCount;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public Integer getPageSum() {
        return pageSum;
    }

    public List<Object> getList() {
        return list;
    }

    public void setPageCount(Integer pageCount) {
        //计算总页数
        if (pageCount == 0){
            pageSum = 1;
        } else {
            pageSum = pageCount % pageSize == 0? pageCount/pageSize : (pageCount/pageSize)+1;
        }
        this.pageCount = pageCount;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public void setPageSum(Integer pageSum) {
        this.pageSum = pageSum;
    }
}
