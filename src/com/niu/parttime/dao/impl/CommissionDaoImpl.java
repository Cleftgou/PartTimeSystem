package com.niu.parttime.dao.impl;

import com.niu.parttime.dao.CommissionDao;
import com.niu.parttime.pojo.Commission;
import com.niu.parttime.utils.DBUtil;
import com.niu.parttime.utils.PageUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommissionDaoImpl implements CommissionDao {
    //增（新增委托到数据库）
    @Override
    public int insert(Commission commission) {
        int num = 0;
        String sql = "insert into commission(c_title, c_description, c_state, c_employer_id) values(?, ?, ?, ?)";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, commission.getC_title());
            ps.setString(2,commission.getC_description());
            ps.setString(3, commission.getC_state());
            ps.setInt(4, commission.getC_employer_id());
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    //删（删除委托）
    @Override
    public int deleteById(int id) {
        int num = 0;
        String sql = "delete from commission where c_id = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    //改（修改委托）
    @Override
    public int update(Commission commission) {
        int num = 0;
        String sql = "update commission set c_title = ?, c_description = ?, c_state = ? where c_id = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, commission.getC_title());
            ps.setString(2, commission.getC_description());
            ps.setString(3, commission.getC_state());
            ps.setInt(4, commission.getC_id());
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    //查
    //单查(根据委托名去查找具体的委托)
    @Override
    public Commission selectByTitle(String c_title) {
        //声明一个Commission对象，作为返回结果
        Commission commission = null;
        String sql = "select c_id, c_title, c_description, c_employer_id, c_state, w_id from commission where c_title = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, c_title);
            rs = ps.executeQuery();
            if (rs.next()){
                commission = new Commission();
                commission.setC_id(rs.getInt(1));
                commission.setC_title(rs.getString(2));
                commission.setC_description(rs.getString(3));
                commission.setC_employer_id(rs.getInt(4));
                commission.setC_state(rs.getString(5));
                commission.setW_id(rs.getInt(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return commission;
    }

    //全查（查询目前所有的委托信息）
    @Override
    public List<Commission> selectAll() {
        String sql = "select c_id, c_title, c_description, c_employer_id, c_state, w_id from commission";
        List<Commission> commissionList = new ArrayList<>();

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                Commission commission = new Commission();
                commission.setC_id(rs.getInt(1));
                commission.setC_title(rs.getString(2));
                commission.setC_description(rs.getString(3));
                commission.setC_employer_id(rs.getInt(4));
                commission.setC_state(rs.getString(5));
                commission.setW_id(rs.getInt(6));
                commissionList.add(commission);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return commissionList;
    }

    @Override
    public List<Commission> selectByE_name(String e_name) {
        String sql = "SELECT commission.*\n" +
                "FROM employer\n" +
                "JOIN commission ON employer.e_id = commission.c_employer_id\n" +
                "WHERE employer.e_name = ?";
        List<Commission> commissionList = new ArrayList<>();

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, e_name);
            rs = ps.executeQuery();
            while (rs.next()){
                Commission commission = new Commission();
                commission.setC_id(rs.getInt(1));
                commission.setC_title(rs.getString(2));
                commission.setC_description(rs.getString(3));
                commission.setC_employer_id(rs.getInt(4));
                commission.setC_state(rs.getString(5));
                commission.setW_id(rs.getInt(6));
                commissionList.add(commission);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return commissionList;
    }

    @Override
    public List<Commission> selectByW_name(String w_name) {
        String sql = "SELECT commission.*\n" +
                "FROM worker\n" +
                "JOIN commission ON worker.w_id = commission.w_id\n" +
                "WHERE worker.w_name = ?";
        List<Commission> commissionList = new ArrayList<>();

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, w_name);
            rs = ps.executeQuery();
            while (rs.next()){
                Commission commission = new Commission();
                commission.setC_id(rs.getInt(1));
                commission.setC_title(rs.getString(2));
                commission.setC_description(rs.getString(3));
                commission.setC_employer_id(rs.getInt(4));
                commission.setC_state(rs.getString(5));
                commission.setW_id(rs.getInt(6));
                commissionList.add(commission);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return commissionList;
    }

    //根据委托编号，修改委托状态以及所接人
    @Override
    public int updateStateWorkerId(String c_state, int c_id, int w_id) {
        int num = 0;
        String sql = "UPDATE commission SET c_state = ?, w_id = ? WHERE c_id = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, c_state);
            ps.setInt(2, w_id);
            ps.setInt(3, c_id);
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    @Override
    public int getCommissionCount() {
        int num = 0;
        String sql = "SELECT COUNT(*) FROM commission";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()){
                num = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return num;
    }

    @Override
    public List<Commission> getCommissionPage(PageUtil page) {
        List<Commission> commissionList = new ArrayList<>();
        String sql = "SELECT * FROM commission LIMIT ?,?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (page.getPageNow() - 1) * page.getPageSize());
            ps.setInt(2, page.getPageSize());
            rs = ps.executeQuery();
            while (rs.next()){
                Commission commission = new Commission();
                commission.setC_id(rs.getInt(1));
                commission.setC_title(rs.getString(2));
                commission.setC_description(rs.getString(3));
                commission.setC_employer_id(rs.getInt(4));
                commission.setC_state(rs.getString(5));
                commission.setW_id(rs.getInt(6));
                commissionList.add(commission);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return commissionList;
    }
}
