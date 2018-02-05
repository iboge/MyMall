package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.UserService;
import com.hwua.common.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/addUser",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addUser(User user){
        JSONObject json = new JSONObject();
        int i = userService.addUser(user);
        if(i==1){
            json.put("success","添加成功！");
        }else{
            json.put("error","添加失败！");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String login(User user, HttpSession session){
        System.out.println("user = " + user);
        String s = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(s);
        JSONObject json = new JSONObject();
        Map<String, Object> user1 = userService.getUser(user);
        System.out.println("user1 = " + user1);
        System.out.println(user1.get("username"));
        System.out.println(user1.get("id"));
        if(user1.containsKey("error")){
            json.put("error",user1.get("error"));
        }else {
            json.put("success","success");
            session.setAttribute("id",user1.get("id"));
            session.setAttribute("username",user1.get("username"));
        }
        System.out.println("json.toJSONString() = " + json.toJSONString());
        return json.toJSONString();
    }

    @RequestMapping(value = "/changePWD",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changePWD(User user){
        JSONObject json = new JSONObject();
        int i = userService.changePassword(user);
        if(i==1){
            json.put("success","修改成功！");
        }else{
            json.put("error","修改失败！");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/index")
    public String goIndex(){

        return "index";
    }

    @RequestMapping(value = "/queryUser")
    public String queryUser(){

        return "user";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }

}
