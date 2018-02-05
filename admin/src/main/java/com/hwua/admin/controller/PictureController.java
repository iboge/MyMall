package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/picture")
public class PictureController {

    @Autowired
    private PictureService pictureService;

    @RequestMapping("/queryPicture")
    public String queryPicture(Map<String,Object> map){
        List<Map<String, Object>> picture = pictureService.getPicture();
        map.put("picture",picture);
        map.put("count",picture.size());
        System.out.println("picture = " + picture);
        return "picture";
    }

    @RequestMapping(value = "/changeValid",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeValid(Integer id,String status){
        System.out.println("id = " + id);
        System.out.println("status = " + status);
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("status",status);
        int i = pictureService.changeValid(map);
        JSONObject json = new JSONObject();
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping("/addPicture")
    public String addPicture(){
        return "picture-add";
    }

    @RequestMapping(value = "/addPicture1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addPicture1(String image){
        JSONObject json = new JSONObject();

        return json.toJSONString();
    }

}
