package com.zad.crud.service.impl;

import com.zad.crud.dao.EmployeesMapper;
import com.zad.crud.pojo.Employees;
import com.zad.crud.pojo.EmployeesExample;
import com.zad.crud.service.EmployeesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeesServiceImpl implements EmployeesService {
    @Autowired
    private EmployeesMapper employeesMapper;

    @Override
    public List<Employees> findEmployeesAll() {
        EmployeesExample example = new EmployeesExample();
        example.setOrderByClause("emp_name asc");
        return employeesMapper.selectByExampleWithDepartment(example);
    }

    @Override
    public void saveEmployees(Employees employees) {
        employeesMapper.insertSelective(employees);
    }

    @Override
    public boolean checkUser(String empName) {
        //创建标准类
        EmployeesExample example = new EmployeesExample();
        EmployeesExample.Criteria criteria = example.createCriteria();
        // 添加查询条件
        criteria.andEmpNameEqualTo(empName);
        // 返回与 empName 相同的数量
        long l = employeesMapper.countByExample(example);
        return l == 0;
    }

    @Override
    public Employees getEmpl(Integer id) {
        return employeesMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateEmpl(Employees employees) {
        employeesMapper.updateByPrimaryKeySelective(employees);
    }

    @Override
    public void deleteEmpl(Integer id) {
        employeesMapper.deleteByPrimaryKey(id);
    }

}
