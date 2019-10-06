package com.zad.crud.service.impl;

import com.zad.crud.dao.DepartmentMapper;
import com.zad.crud.pojo.Department;
import com.zad.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public List<Department> findEmployeesAll() {
        return departmentMapper.selectByExample(null);
    }
}
