package com.zad.crud.pojo;

import javax.validation.constraints.Pattern;

public class Employees {
    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",
            message = "用户名为4-16英文数字组合或者2-5位中文")
    private String empName;

    private String gender;
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "请输入正确的邮箱")
    private String mail;

    private Integer dId;

    private Department department;

    public Employees(){}

    public Employees(Integer empId, String empName, String gender, String mail, Integer dId, Department department) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.mail = mail;
        this.dId = dId;
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employees{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", mail='" + mail + '\'' +
                ", dId=" + dId +
                ", department=" + department +
                '}';
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}