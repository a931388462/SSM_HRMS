package com.hrms.service;

import com.hrms.bean.TblEmp;
import com.hrms.bean.TblEmpExample;
import com.hrms.mapper.TblEmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl {

    @Autowired
    TblEmpMapper tblEmpMapper;

    /**
     * login
     * @param username
     * @param password
     * @return
     */
    public TblEmp login(String username,String password){
        TblEmpExample tblEmpExample = new TblEmpExample();
        TblEmpExample.Criteria criteria = tblEmpExample.createCriteria();
        criteria.andLoginNameEqualTo(username);
        criteria.andLoginPasswordEqualTo(password);
        List<TblEmp> tblEmps = tblEmpMapper.selectByExample(tblEmpExample);
        if (tblEmps.size()==0){
            return null;
        }
        return tblEmps.get(0);
    }

    /**
     * registe
     * @param tblEmp
     * @return
     */
    public boolean registe(TblEmp tblEmp){
        int i = tblEmpMapper.insertSelective(tblEmp);
        if (i!=0){
            return  true;
        }
        return false;
    }

    /**
     * 判断用户是否存在
     * @param username
     * @return true 存在
     */
    public boolean userIsExists(String username){
        TblEmp tblEmp = tblEmpMapper.selectByPrimaryKey(username);
        if (tblEmp == null){
            return false;
        }
        return true;
    }

    /**
     *
     * @param username
     * @param password
     * @param newPassword
     * @return 1密码错误 0成功
     */
    public int changpassword(String username,String password,String newPassword){
        TblEmp tblEmp = login(username, password);
        if (tblEmp==null){
            return 1;
        }
        tblEmp.setLoginPassword(newPassword);
        tblEmpMapper.updateByPrimaryKeySelective(tblEmp);
        return 0;
    }

    /**
     * 更新用户信息
     * @param tblEmp
     * @return
     */
    public void updateUserInfo(TblEmp tblEmp){
        tblEmpMapper.updateByPrimaryKeySelective(tblEmp);
    }




}
