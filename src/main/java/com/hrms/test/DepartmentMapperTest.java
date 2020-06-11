package com.hrms.test;

import com.hrms.bean.Department;
import com.hrms.mapper.DepartmentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class DepartmentMapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Test
    public void insertDeptTest(){
        Department department = new Department(null, "榛庢槑3", "娴嬭瘯閮�2020");
        int res = departmentMapper.insertDept(department);
        System.out.println(res);
    }

    @Test
    public void updateDeptTest(){
        Department department = new Department(null, "Tomsom", "鐮斿彂閮111�");
        int res = departmentMapper.updateDeptById(1, department);
        System.out.println(res);
    }

    @Test
    public void deleteDeptTest(){
        int res = departmentMapper.deleteDeptById(7);
        System.out.println(res);
    }

    @Test
    public void selectOneByIdTest(){
        Department department = departmentMapper.selectOneById(1);
        System.out.println(department);
    }

    @Test
    public void selectOneByLeaderTest(){
        Department department = departmentMapper.selectOneByLeader("椹簯");
        System.out.println(department);
    }

    @Test
    public void selectOneByNameTest(){
        Department department = departmentMapper.selectOneByName("CEO");
        System.out.println(department);
    }

    @Test
    public void selectDeptListTest(){
        List<Department> departmentList = departmentMapper.selectDeptList();
        for (int i = 0; i < departmentList.size(); i++) {
            System.out.println(departmentList.get(i));
        }
    }

    @Test
    public void selectDeptsByLimitAndOffsetTest(){
        List<Department> departments = departmentMapper.selectDeptsByLimitAndOffset(2,5);
        System.out.println(departments.size());
        for (int i = 0; i < departments.size(); i++) {
            System.out.println(departments.get(i));
        }
    }

    @Test
    public void countDeptsTest(){
        int count = departmentMapper.countDepts();
        System.out.println(count);
    }

}
