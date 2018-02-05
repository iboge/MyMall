package com.hwua.admin.controller;

import com.hwua.admin.service.InfoCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/infoCount")
public class InfoCountController {

    @Autowired
    private InfoCountService infoCountService;

    @RequestMapping(value = "/welcome")
    public String goWelcome(Map<String,Object> map){
        List<Map<String, Object>> count = infoCountService.getCount();
        List<Map<String, Object>> count1 = infoCountService.getCount1();
        List<Map<String, Object>> count2 = infoCountService.getCount2();
        List<Map<String, Object>> count7 = infoCountService.getCount7();
        List<Map<String, Object>> count30 = infoCountService.getCount30();
        map.put("count",count);
        map.put("count1",count1);
        map.put("count2",count2);
        map.put("count7",count7);
        map.put("count30",count30);
        return "welcome";
    }

}
