package com.zad.crud.controller;

import com.zad.crud.pojo.Department;
import com.zad.crud.pojo.Msg;
import com.zad.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    /**
     * 获取所有部门列表
     */
    @RequestMapping("/dept")
    @ResponseBody
    public Msg getDepartmentWithJson(){
        List<Department> departments = departmentService.findEmployeesAll();
        return Msg.success().addMap("dept", departments);
    }
}
