package com.javapandeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nutrition")
public class NuController {
    @RequestMapping("/nutrition")
    public String getto(){
        return "nutrition/gpt";
    }

}
