package com.javapandeng.controller;

import com.alibaba.dashscope.aigc.conversation.Conversation;
import com.alibaba.dashscope.aigc.conversation.ConversationParam;
import com.alibaba.dashscope.aigc.conversation.ConversationResult;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.alibaba.dashscope.utils.Constants;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/gpt")
public class GPTController {

    @RequestMapping(value = "/getgpt",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public String getanswer(String question) throws NoApiKeyException, InputRequiredException {
        Constants.apiKey="sk-b8876154e7e74210bbdace3e65bd4cfa";
        Conversation conversation = new Conversation();
        String prompt = question;
        ConversationParam param = ConversationParam
                .builder()
                .model(Conversation.Models.QWEN_MAX)
                .prompt(prompt)
                .build();
        ConversationResult result = conversation.call(param);
        return result.getOutput().getText();
    }
}
