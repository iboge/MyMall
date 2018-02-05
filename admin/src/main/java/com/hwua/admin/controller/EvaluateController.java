package com.hwua.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {

    @Autowired
    private EvaluateService evaluateService;

    @RequestMapping("/queryEvaluate")
    public String queryEvaluate(Map<String, Object> map){
        List<Map<String, Object>> evaluate = evaluateService.getEvaluate();
        map.put("evaluate",evaluate);
        map.put("size",evaluate.size());
        return "evaluate";
    }

    @RequestMapping(value = "/delEvaluate",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delEvaluate(Integer id){
        JSONObject json = new JSONObject();
        int i = evaluateService.delEvaluate(id);
        if(i!=0){
            json.put("msg","删除成功！");
        }else{
            json.put("msg","删除失败！");
        }
        return "evaluate";
    }

}
