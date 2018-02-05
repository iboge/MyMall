package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.MemberService;
import com.hwua.common.po.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping("/queryMember")
    public String queryMember(Map<String,Object> map){
        List<Member> allMember = memberService.getAllMember();
        map.put("members",allMember);
        map.put("count",allMember.size());;
        return "member";
    }

    @RequestMapping("/queryDelMember")
    public String queryDelMember(Map<String,Object> map){
        List<Member> memberByValid = memberService.getMemberByValid();
        map.put("members",memberByValid);
        map.put("count",memberByValid.size());
        return "delmember";
    }

    @RequestMapping(value = "/changeValid",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeValid(Integer id,String valid){
        System.out.println("id = " + id);
        System.out.println("valid = " + valid);
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("valid",valid);
        int i = memberService.changeValidById(map);
        JSONObject json = new JSONObject();
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

}
