package com.hwua.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {

    @RequestMapping(value = "/queryRole")
    public String queryRole(){

        return "role";
    }

}
