package com.hrms.test;

import com.hrms.bean.Employee;
import com.hrms.bean.TblEmp;
import com.hrms.mapper.EmployeeMapper;
import com.hrms.mapper.TblEmpMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author GenshenWang.nomico
 * @date 2018/3/5.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class TblEmpMapperTest {

    @Autowired
    TblEmpMapper tblEmpMapper;

    @Test
    public void selectOneByIdTest(){
        TblEmp tblEmp = tblEmpMapper.selectByPrimaryKey("admin");
        System.out.println(tblEmp.getLoginName());
        System.out.println(tblEmp.getLoginPassword());
    }


}
