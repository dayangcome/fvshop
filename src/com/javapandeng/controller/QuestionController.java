package com.javapandeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/question")
public class QuestionController {
    @RequestMapping("/quest")
    public String getto(){
        return "question/question";
    }
    @RequestMapping("/ans")
    public String getans(){
        return "question/ans";
    }
    @RequestMapping("/feedback")
    public String getfeedback(){
        return "question/feedback";
    }
}
