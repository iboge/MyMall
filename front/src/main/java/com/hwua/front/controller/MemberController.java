package com.hwua.front.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.common.po.Member;
import com.hwua.common.po.RecipientInfo;
import com.hwua.front.service.MemberService;
import com.hwua.front.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private PayService payService;

    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String login(Member member, HttpSession session){
        String s = DigestUtils.md5DigestAsHex(member.getPassword().getBytes());
        member.setPassword(s);
        Map<String, Object> member1 = memberService.getMember(member);
        JSONObject json = new JSONObject();
        if(member1.containsKey("error")){
            json.put("error",member1.get("error"));
        }else{
            json.put("success",member1.get("success"));
            session.setAttribute("id",member1.get("id"));
            session.setAttribute("member",member1);
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping(value = "/register",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String register(Member member){
        String password = member.getPassword();
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        member.setPassword(s);
        int i = memberService.addMember(member);
        JSONObject json = new JSONObject();
        if(i==1){
            Map<String, Object> member1 = memberService.getMember(member);
//            payService.addRecipient((Integer) member1.get("id"));
            json.put("success","注册成功！");
        }else if(i==2){
            json.put("error","注册失败！");
        }else if(i==3){
            json.put("error","用户名已被注册！");
        }else if(i==4){
            json.put("error","邮箱已被注册！");
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping(value = "/lookFor",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String lookFor(Member member){
        String password = member.getPassword();
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        member.setPassword(s);
        int i = memberService.changePWD(member);
        JSONObject json = new JSONObject();
        if(i==1){
            json.put("success","重置密码成功！");
        }else if(i==2){
            json.put("error","用户名和邮箱不匹配！");
        }else if(i==3){
            json.put("error","用户名不存在！");
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping(value = "/person")
    public String person(HttpSession session,Map<String,Object> map){
        Object id = session.getAttribute("id");
        Integer mid = (Integer) id;
        Member member = memberService.getMemberById(mid);
        List<RecipientInfo> addr = payService.getAddr(mid);
        map.put("member",member);
        map.put("addr",addr);
        return "person";
    }

    @RequestMapping(value = "/changeMember",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeMember(Member member,HttpSession session){
        JSONObject json = new JSONObject();
        Integer id = (Integer)session.getAttribute("id");
        member.setId( id);
        Map<Object, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("name",member.getMembername());
        map.put("email",member.getEmail());
        int i = memberService.changeMember(member);
        session.setAttribute("member",map);
        if(i==1){
            json.put("msg","保存成功!");
        }else{
            json.put("msg","保存失败!");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/changeAddr",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeAddr(RecipientInfo recipientInfo,HttpSession session){
        JSONObject json = new JSONObject();
        Object id = session.getAttribute("id");
        recipientInfo.setMid((Integer) id);
        int i = payService.doUpdateRecipientInfo(recipientInfo);
        if(i!=0){
            json.put("msg","修改成功!");
        }else{
            json.put("msg","修改失败!");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/changePWD",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changePWD(String password,HttpSession session){
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        JSONObject json = new JSONObject();
        Integer id = (Integer) session.getAttribute("id");
        Member memberById = memberService.getMemberById(id);
        Member member = new Member();
        member.setId(id);
        member.setPassword(s);
        member.setEmail(memberById.getEmail());
        member.setMembername(memberById.getMembername());
        int i = memberService.changePWD(member);
        if(i==1){
            json.put("msg","修改成功!");
        }else{
            json.put("msg","修改失败!");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/del",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String del(Integer id){
        System.out.println("id = " + id);
        JSONObject json = new JSONObject();
        int i = payService.doDeleteRecipientInfo(id);
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "edit")
    public String edit(Integer id,Map<String,Object> map){
        RecipientInfo recipientInfo = payService.queryRecipientInfo(id);
        map.put("addr",recipientInfo);
        return "editperson";
    }

    @RequestMapping(value = "/addr",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addr(RecipientInfo recipientInfo,HttpSession session){
        System.out.println("recipientInfo = " + recipientInfo);
        Integer id = (Integer) session.getAttribute("id");
        recipientInfo.setMid(id);
        JSONObject json = new JSONObject();
        int i = payService.addRecipient(recipientInfo);
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/delEvaluate",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delEvaluate(Integer id){
        System.out.println("id = " + id);
        JSONObject json = new JSONObject();
        int i = memberService.doUpdateEvaluate(id);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "queryEvaluate")
    public String queryEvaluate(HttpSession session,Map<String,Object> map){
        List<Map<String, Object>> evaluate = memberService.queryEvaluateByMid((Integer) session.getAttribute("id"));
        map.put("evaluate",evaluate);
        return "evaluate";
    }

    @RequestMapping(value = "/logout")
    public String end(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }

}
