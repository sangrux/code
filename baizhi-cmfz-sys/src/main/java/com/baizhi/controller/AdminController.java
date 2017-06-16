package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.URLUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/6/12.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin, HttpSession session){
        String msg;

        try {
            admin= adminService.checkById(admin);
            session.setAttribute("admin",admin);
            return "redirect:/pages/main.jsp";
        }catch (Exception e){
            e.printStackTrace();
            msg=URLUtils.getEncoder(e.getMessage());
        }
        return "redirect:/pages/login.jsp?msg="+msg;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/pages/main.jsp";
    }


    @RequestMapping("/add")
    @ResponseBody
    public void add(Admin admin){
        adminService.add(admin);
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Admin> findAll(){
        List<Admin> admins = adminService.queryAll();
        return admins;
    }
    @RequestMapping("/findOne")
    @ResponseBody
    public Admin findOne(String id){
        Admin admin = adminService.queryById(id);
        return admin;
    }

    @RequestMapping("/update")
    @ResponseBody
    public void update(Admin admin){
        adminService.change(admin);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public void delete(String id){
        adminService.delete(id);
    }

}
