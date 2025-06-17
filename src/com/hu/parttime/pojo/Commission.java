package com.hu.parttime.pojo;

/**
 * -- 创建委托表，并添加雇主ID作为外键
  CREATE TABLE commission (
    c_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      c_title VARCHAR(100) NOT NULL,
     c_description VARCHAR(255) NOT NULL,
      c_employer_id INT NOT NULL,
      FOREIGN KEY (c_employer_id) REFERENCES employer(e_id)
  );

  INSERT INTO commission VALUES (1, '委托标题', '委托描述', 10001);
 */

//委托实体类，封装委托信息
public class Commission {
    private Integer c_id;
    private String c_title;
    private String c_description;
    private String c_state;
    private Integer c_employer_id;
    private Integer w_id;
    private String employerName;
    public Commission(){}

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public String getC_title() {
        return c_title;
    }

    public void setC_title(String c_title) {
        this.c_title = c_title;
    }

    public String getC_description() {
        return c_description;
    }

    public void setC_description(String c_description) {
        this.c_description = c_description;
    }

    public String getC_state() {
        return c_state;
    }

    public void setC_state(String c_state) {
        this.c_state = c_state;
    }

    public Integer getC_employer_id() {
        return c_employer_id;
    }

    public void setC_employer_id(Integer c_employer_id) {
        this.c_employer_id = c_employer_id;
    }

    public Integer getW_id() {
        return w_id;
    }

    public void setW_id(Integer w_id) {
        this.w_id = w_id;
    }

    public String getEmployerName() {
        return employerName;
    }

    public void setEmployerName(String employerName) {
        this.employerName = employerName;
    }

    @Override
    public String toString() {
        return "Commission{" +
                "c_id=" + c_id +
                ", c_title='" + c_title + '\'' +
                ", c_description='" + c_description + '\'' +
                ", c_state='" + c_state + '\'' +
                ", c_employer_id=" + c_employer_id +
                ", w_id=" + w_id +
                ", employerName='" + employerName + '\'' +
                '}';
    }
    /**?/
     */
    public Integer getId() {
        return c_id;
    }

    public void setId(Integer id) {
        this.c_id = id;
    }

    public String getTitle() {
        return c_title;
    }

    public void setTitle(String title) {
        this.c_title = title;
    }

    public String getDescription() {
        return c_description;
    }

    public void setDescription(String description) {
        this.c_description = description;
    }

    public Integer getEmployerId() {
        return c_employer_id;
    }

    public void setEmployerId(Integer employerId) {
        this.c_employer_id = employerId;
    }
}

