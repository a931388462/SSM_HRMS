package com.hrms.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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