<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>正在充值中</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">

    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resource/images/mylogo.ico" />
    <script src="${ctx}/resource/js/sweetalert.min.js"></script>
    <style type="text/css">
        .center{
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        .myh1{
            margin-top: 100px;
            display: none;
            font-size: 35px;
        }
        .myh2{
            margin-top: 200px;
            text-align: center;
            font-size: 20px;
        }
        .active{
            display: inline-block;
            position: absolute;
            width: 500px;
            left: 7%;
        }


    </style>
</head>
<body>
<%@include file="/common/utop.jsp"%>
<!--导航条-->
<div class="width100" style="height: 45px;background: #0ab50a;margin-top: 40px;position: relative;z-index: 100;">
    <!--中间的部分-->
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav">
            <a href="${ctx}/login/uIndex">首页</a>
            <a href="${ctx}/news/list">公告</a>
            <a href="${ctx}/message/add">留言</a>
            <a href="${ctx}/question/quest">答题</a>
            <a href="${ctx}/nutrition/nutrition">营养分析</a>
            <a href="${ctx}/community/community">社区论坛</a>
        </div>
    </div>
</div>
<div class="center">
    <h1 class="myh1 active">正在交易中，请稍等 .    </h1>
    <h1 class="myh1">正在交易中，请稍等 . .  </h1>
    <h1 class="myh1">正在交易中，请稍等 . . .</h1>
    <h2 class="myh2">稍后将跳转到交易后的结果，请不要关闭该页面</h2>
</div>
</body>
<script>
    var i=0;
    window.onload=function(){
        window.parent.postMessage(document.body.clientHeight+100,'*')
        setInterval(function(){
            var myh1=document.querySelectorAll("h1");
            for(let k=0;k<myh1.length;k++){
                myh1[k].classList.remove("active")
            }
            myh1[i%3].classList.add("active")
            i+=1;
        },300)
        setTimeout(function(){
            window.location.href='${ctx}/car/res'
        },3000)
    }

</script>
</html>