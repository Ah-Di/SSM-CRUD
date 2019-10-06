package com.zad.crud.test;

import com.zad.crud.dao.DepartmentMapper;
import com.zad.crud.dao.EmployeesMapper;
import com.zad.crud.pojo.Department;
import com.zad.crud.pojo.Employees;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

//RunWith表示使用哪个测试类
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    // 部门DAO
    @Autowired
    private DepartmentMapper departmentMapper;
    // 员工DAO
    @Autowired
    private EmployeesMapper employeesMapper;
    //SqlSessionTemplate
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Test
    public void testCRUD() {
        //插入部门两条数据
//        departmentMapper.insertSelective(new Department("开发部"));
//        departmentMapper.insertSelective(new Department("开发部"));

        //得到可以执行批量操作的mapper
        EmployeesMapper mapper = sqlSessionTemplate.getMapper(EmployeesMapper.class);
        //插入员工一千条数据
        for (int i = 0; i < 100; i++) {
            //得到姓名和邮箱
            String mail = UUID.randomUUID().toString().substring(0, 6);
            String name = mail.substring(0, 4);
            //执行插入操作
            mapper.insertSelective(new Employees(null, name, "男",
                    mail + "@163.com", 1, null));
        }

    }

}
