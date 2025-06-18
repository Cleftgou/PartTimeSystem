package com.hu.parttime.pojo;

import java.util.Date;

public class CommissionEvaluation {

    private Integer eval_id;
    private String job_id;
    private String user_id;
    private String score;
    private String comment;
    private Date create_time;
    private String user_type;

    @Override
    public String toString() {
        return "CommissionEvaluation{" +
                "eval_id=" + eval_id +
                ", job_id='" + job_id + '\'' +
                ", user_id='" + user_id + '\'' +
                ", score='" + score + '\'' +
                ", comment='" + comment + '\'' +
                ", create_time=" + create_time +
                ", user_type='" + user_type + '\'' +
                '}';
    }

    public Integer getEval_id() {
        return eval_id;
    }

    public void setEval_id(Integer eval_id) {
        this.eval_id = eval_id;
    }

    public String getJob_id() {
        return job_id;
    }

    public void setJob_id(String job_id) {
        this.job_id = job_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
}
