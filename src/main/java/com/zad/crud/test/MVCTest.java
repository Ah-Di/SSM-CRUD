package com.zad.crud.test;

import com.github.pagehelper.PageInfo;
import com.zad.crud.pojo.Employees;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

// 2.添加注解可以获取到 WebApplicationContext
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc-config.xml"})
public class MVCTest {
    // 3.有了注解可以注入springmvc的ioc
    @Autowired
    WebApplicationContext context;

    // 1.获取虚拟MVC，取到处理结果
    MockMvc mockMvc;

    // 4.得到 WebApplicationContext, 每次获取虚拟mvc,都会执行初始化
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    // 5.得到controller传递过来的PageInfo
    @Test
    public void testPage() throws Exception {
        // 模拟请求拿到返回值
        MvcResult  mvcResult= mockMvc.perform(MockMvcRequestBuilders.get("/empl").param("pn", "2")).andReturn();
        PageInfo pageInfo = (PageInfo) mvcResult.getRequest().getAttribute("pageInfo");
        System.out.println("当前页码"+ pageInfo.getPageNum());
        System.out.println("每页的数量"+ pageInfo.getPageSize());
        System.out.println("当前页的数量"+ pageInfo.getSize());
        System.out.println("当前页面第一个元素在数据库中的行号"+ pageInfo.getStartRow());
        System.out.println("当前页面最后一个元素在数据库中的行号"+ pageInfo.getEndRow());
        System.out.println("总行数"+ pageInfo.getTotal());
        System.out.println("总页数"+ pageInfo.getPages());
        System.out.println("页面中需要连续显示的页码"+ pageInfo.getNavigatepageNums());
        //获取员工数据
        List<Employees> list = pageInfo.getList();
        for (Employees employee:list){
            System.out.println("ID："+employee.getEmpId()+"===>Name："+employee.getEmpName()+"===>dept："+employee.getDepartment());
        }
    }

}
