package com.hrms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hrms.bean.TblEmp;
import com.hrms.service.UserServiceImpl;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/hrms")
public class RegistrationController {

    @Autowired
    UserServiceImpl userServiceImpl;

    /**
     * 注册
     * @param request
     * @return
     */
    @RequestMapping(value = "/doregiste", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg dologin(HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username + password);

        if (userServiceImpl.userIsExists(username)){
            return JsonMsg.fail().addInfo("login_error", "用户名已存在");
        }
        TblEmp tblEmp = new TblEmp();
        tblEmp.setLoginName(username);
        tblEmp.setLoginPassword(password);
        boolean flag = userServiceImpl.registe(tblEmp);
        if (flag) {
            tblEmp = userServiceImpl.login(username, password);
            HttpSession session = request.getSession();
            session.setAttribute("USER",tblEmp);
            return JsonMsg.success();
        }else {
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
        }
    }
	
	
}
