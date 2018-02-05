package com.hwua.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @RequestMapping(value = "/queryAuth")
    public String queryAuth(){

        return "auth";
    }

}
