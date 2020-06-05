package com.hrms.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrms.bean.TblEmp;
import com.hrms.service.UserServiceImpl;
import com.hrms.util.JsonMsg;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


/**
 * 注意：如果@Controller不指定其value【@Controller】，
 * 则默认的bean名字为这个类的类名首字母小写，如果指定value【@Controller(value=”UserAction”)】
 * 或者【@Controller(“UserAction”)】，
 * 则使用value作为bean的名字。
 * @author smfx1314
 *
 */
@Controller
@RequestMapping("/hrms")
public class UserController{

    @Autowired
    UserServiceImpl userServiceImpl;

    /**
     *
     * @return
     */
    @RequestMapping(value = "/changePasswordPage", method = RequestMethod.GET)
    public ModelAndView changePasswordPage(){
        ModelAndView mv = new ModelAndView("changePassword");
        return mv;
    }

    /**
     * 密码变更
     * @param request
     * @return
     */
    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg changePassword(HttpServletRequest request){
        HttpSession session = request.getSession();
        TblEmp tblEmp = (TblEmp) session.getAttribute("USER");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        int flag = userServiceImpl.changpassword(tblEmp.getLoginName(), password, newPassword);
        if (flag == 0){
            return JsonMsg.success();
        }else if(flag == 1){
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
        }else{
            return JsonMsg.fail().addInfo("login_error", "error");
        }
    }

    /**
     * 上传头像
     * @param upload
     * @return
     */
     @RequestMapping("/uploadAvatar")
     @ResponseBody
      public String uploadAvatar(MultipartFile upload){
          //fileService.upLoadFile(upload);
          return "ok";
      }
    
 
}