package com.zad.crud.dao;

import com.zad.crud.pojo.Employees;
import com.zad.crud.pojo.EmployeesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeesMapper {
    long countByExample(EmployeesExample example);

    int deleteByExample(EmployeesExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Employees record);

    int insertSelective(Employees record);

    List<Employees> selectByExample(EmployeesExample example);

    Employees selectByPrimaryKey(Integer empId);

    //包括部门的查找
    List<Employees> selectByExampleWithDepartment(EmployeesExample example);
    //包括部门的查找
    Employees selectByPrimaryKeyWithDepartment(Integer empId);

    int updateByExampleSelective(@Param("record") Employees record, @Param("example") EmployeesExample example);

    int updateByExample(@Param("record") Employees record, @Param("example") EmployeesExample example);

    int updateByPrimaryKeySelective(Employees record);

    int updateByPrimaryKey(Employees record);
}