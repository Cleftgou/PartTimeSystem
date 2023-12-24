package com.niu.parttime.dao.impl;

import com.niu.parttime.dao.WorkerDao;
import com.niu.parttime.pojo.Worker;
import com.niu.parttime.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WorkerDaoImpl implements WorkerDao {
    //增（注册账号）
    public int insert(Worker worker){
        int num = 0;
        String sql = "insert into worker(w_name, w_pwd) values(?, ?)";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, worker.getW_name());
            ps.setString(2,worker.getW_pwd());
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    //删
    public int deleteById(int id){
        int num = 0;
        String sql = "delete from worker where w_id = ?";

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

    //改
    public int update(Worker worker){
        int num = 0;
        String sql = "update worker set w_name = ?, w_pwd = ? where w_id = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, worker.getW_name());
            ps.setString(2, worker.getW_pwd());
            ps.setInt(3, worker.getW_id());
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    //查
    //单查(登录功能)
    public Worker selectByName_Pwd(String name, String pwd){
        //声明一个Employer对象，作为返回结果
        Worker worker = null;
        String sql = "select w_id, w_name, w_pwd from worker where w_name = ? and w_pwd = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pwd);
            rs = ps.executeQuery();
            if (rs.next()){
                worker = new Worker();
                worker.setW_id(rs.getInt(1));
                worker.setW_name(rs.getString(2));
                worker.setW_pwd(rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return worker;
    }

    //全查
    public List<Worker> selectAll(){
        String sql = "select w_id, w_name, w_pwd from worker";
        List<Worker> workerList = new ArrayList<>();
        Worker worker = new Worker();

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                worker.setW_id(rs.getInt(1));
                worker.setW_name(rs.getString(2));
                worker.setW_pwd(rs.getString(3));
                workerList.add(worker);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return workerList;
    }

    @Override
    public Worker selectByName(String name) {
        //声明一个Worker对象，作为返回结果
        Worker worker = null;
        String sql = "select w_name from worker where w_name = ? ";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if (rs.next()){
                worker = new Worker();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return worker;
    }
}
