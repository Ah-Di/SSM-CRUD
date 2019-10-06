package com.zad.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zad.crud.pojo.Employees;
import com.zad.crud.pojo.Msg;
import com.zad.crud.service.EmployeesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeesController {
    @Autowired
    private EmployeesService employeesService;

    /**
     * 删除单个多个员工
     */
    @RequestMapping(value = "/deleteEmpl/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpl(@PathVariable String ids) {
        System.out.println(ids);
        //如果有连接符号是多个删除
        if (ids.contains("-")) {
            String[] id = ids.split("-");
            for(String s : id){
                employeesService.deleteEmpl(Integer.parseInt(s));
            }
            return Msg.success();
        } else {
            employeesService.deleteEmpl(Integer.parseInt(ids));
            return Msg.success();
        }

    }

    /**
     * 修改员工
     */
    @RequestMapping(value = "/updateEmpl", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmpl(@RequestBody Employees employees) {
        employeesService.updateEmpl(employees);
        return Msg.success();
    }

    /**
     * 按id查找员工
     */
    @RequestMapping(value = "/getEmpl/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpl(@PathVariable Integer id) {
        Employees employees = employeesService.getEmpl(id);
        return Msg.success().addMap("empl", employees);
    }

    /**
     * 校验名称是否重复
     */
    @RequestMapping(value = "/checkName")
    @ResponseBody
    public Msg checkName(String empName) {
        //校验 用户名是否重复
        boolean b = employeesService.checkUser(empName);
        if (b) return Msg.success();
        else return Msg.fail().addMap("msg", "用户名重复");
    }

    /**
     * 新增员工
     * @valid 用于验证注解是否符合要求
     * BindingResult类 用于返回错误信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmployees(@RequestBody @Valid Employees employees, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            //校验失败
            List<FieldError> list = bindingResult.getFieldErrors();
            Map<String, Object> map = new HashMap<>();
            for (FieldError f : list) {
                System.out.println("错误字段名" + f.getField());
                System.out.println("错误信息" + f.getDefaultMessage());
                map.put(f.getField(), f.getDefaultMessage());
            }
            return Msg.fail().addMap("errorField", map);
        } else {
            employeesService.saveEmployees(employees);
            return Msg.success();
        }

    }

    /**
     * 查询员工，分页查询
     */
    @RequestMapping(value = "/empl", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmployeesWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 查询之前需要先调用
        // 第一个参数：传入页码， 第二个参数：每页条数
        PageHelper.startPage(pn, 5);
        // 得到所有员工
        List<Employees> lists = employeesService.findEmployeesAll();
        // 使用pageinfo包装查询后的结果，只要将pageInfo发送给页面，封装了详细的分页信息
        // 第一个参数：list数据， 第二个参数：连续显示的页数
        PageInfo<Employees> pageInfo = new PageInfo<Employees>(lists, 5);

        return Msg.success().addMap("pageInfo", pageInfo);
    }

}
