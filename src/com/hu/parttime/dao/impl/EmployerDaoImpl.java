package com.hu.parttime.dao.impl;

import com.hu.parttime.dao.EmployerDao;
import com.hu.parttime.pojo.Employer;
import com.hu.parttime.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO（Data Access Object）数据库访问对象
 * DAO实际上是一种JavaEE设计模式
 * DAO 只负责数据库的增删改查（CRUD）
 * 一般一张表对应一个DAO对象
 * 属于Model
 */
public class EmployerDaoImpl implements EmployerDao {
    //增（注册账号）
    public int insert(Employer employer){
        int num = 0;
        String sql = "insert into employer(e_name, e_pwd, e_email) values(?, ?, ?)";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, employer.getE_name());
            ps.setString(2,employer.getE_pwd());
            ps.setString(3,employer.getE_email());
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
        String sql = "delete from employer where e_id = ?";

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
    public int update(Employer employer){
        int num = 0;
        String sql = "update employer set e_name = ?, e_pwd = ?, e_email = ? where e_id = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, employer.getE_name());
            ps.setString(2, employer.getE_pwd());
            ps.setString(3, employer.getE_email());
            ps.setInt(4, employer.getE_id());
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
    public Employer selectByName_Pwd(String name, String pwd){
        //声明一个Employer对象，作为返回结果
        Employer employer = null;
        String sql = "select e_id, e_name, e_pwd, e_email from employer where e_name = ? and e_pwd = ?";

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
                employer = new Employer();
                employer.setE_id(rs.getInt(1));
                employer.setE_name(rs.getString(2));
                employer.setE_pwd(rs.getString(3));
                employer.setE_email(rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return employer;
    }

    //全查
    public List<Employer> selectAll(){
        String sql = "select e_id, e_name, e_pwd, e_email from employer";
        List<Employer> employerList = new ArrayList<>();
        Employer employer = new Employer();

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                employer.setE_id(rs.getInt(1));
                employer.setE_name(rs.getString(2));
                employer.setE_pwd(rs.getString(3));
                employer.setE_email(rs.getString(4));
                employerList.add(employer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return employerList;
    }

    @Override
    public Employer selectByName(String name) {
        //声明一个Employer对象，作为返回结果
        Employer employer = null;
        String sql = "select e_name from employer where e_name = ? ";

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
                employer = new Employer();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return employer;
    }

    @Override
    public Employer selectByEmail(String email) {
        //声明一个Employer对象，作为返回结果
        Employer employer = null;
        String sql = "select e_email from employer where e_email = ? ";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()){
                employer = new Employer();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return employer;
    }

    @Override
    public int updateEmployerPwd(Employer employer) {
        int num = 0;
        String sql = "UPDATE employer SET e_pwd = ? WHERE e_email = ? AND e_name = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, employer.getE_pwd());
            ps.setString(2, employer.getE_email());
            ps.setString(3, employer.getE_name());
            num = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, null);
        }
        return num;
    }

    @Override
    public Employer selectByName_Email(String name, String email) {
        //声明一个Employer对象，作为返回结果
        Employer employer = null;
        String sql = "select e_id, e_name, e_pwd, e_email from employer where e_name = ? and e_email = ?";

        //连接数据库
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if (rs.next()){
                employer = new Employer();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn, ps, rs);
        }
        return employer;
    }
}


