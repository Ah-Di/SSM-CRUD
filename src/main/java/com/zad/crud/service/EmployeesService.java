package com.zad.crud.service;

import com.zad.crud.pojo.Employees;

import java.util.List;

public interface EmployeesService {

    //查找员工
    public List<Employees> findEmployeesAll();

    //添加
    public void saveEmployees(Employees employees);

    //检验姓名是否存在
    boolean checkUser(String empName);

    Employees getEmpl(Integer id);

    void updateEmpl(Employees employees);

    void deleteEmpl(Integer id);
}
