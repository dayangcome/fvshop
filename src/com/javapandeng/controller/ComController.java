package com.javapandeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class ComController {
    @RequestMapping("/community")
    public String getto(){
        return "community/community";
    }
}
