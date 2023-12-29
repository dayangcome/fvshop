<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/resource/user/element-ui/index.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resource/images/mylogo.ico" />
    <script src="${ctx}/resource/user/element-ui/index.js"></script>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <script src="${ctx}/resource/js/sweetalert.min.js"></script>
    <style type="text/css">
        #user{
            float: right;
        }
        .el-page-header__left .el-icon-back{
            font-size: 30px;
            margin-right: 15px;
        }
        .el-page-header__title{
            font-size: 18px;
        }
        .smallicon{
            width: 50px;
        }
        svg{
            fill: #67C23A;
        }
        #second{
            display: inline-block;
            margin: 0 5px;
            color: red;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div id="app">
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
            </div>
        </div>
    </div>
    <div style="text-align: center;margin-top: 80px;">
        <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" class="icon-success" width="100" height="100">
            <path d="M24,4 C35.045695,4 44,12.954305 44,24 C44,35.045695 35.045695,44 24,44 C12.954305,44 4,35.045695 4,24 C4,12.954305 12.954305,4 24,4 Z M34.5548098,16.4485711 C33.9612228,15.8504763 32.9988282,15.8504763 32.4052412,16.4485711 L32.4052412,16.4485711 L21.413757,27.5805811 L21.413757,27.5805811 L21.4034642,27.590855 C21.0097542,27.9781674 20.3766105,27.9729811 19.9892981,27.5792711 L19.9892981,27.5792711 L15.5947588,23.1121428 C15.0011718,22.514048 14.0387772,22.514048 13.4451902,23.1121428 C12.8516033,23.7102376 12.8516033,24.6799409 13.4451902,25.2780357 L13.4451902,25.2780357 L19.6260786,31.5514289 C20.2196656,32.1495237 21.1820602,32.1495237 21.7756472,31.5514289 L21.7756472,31.5514289 L34.5548098,18.614464 C35.1483967,18.0163692 35.1483967,17.0466659 34.5548098,16.4485711 Z"></path>
        </svg>
        <h1>购买成功</h1><br><br>
        <h2>可以在个人中心-我的订单界面查看购买的商品</h2><br>
        <div style="font-size: 18px;margin: 25px 0;"><span id="second">10</span>秒后将自动返回商城主页面</div>
        <el-button type=primary @click="navto">返回商城主页面</el-button>
    </div>
</div>
<script>
    new Vue({
        el: '#app',
        data() {
            return{
                crash:0
            }
        },
        created() {
            this.crash = localStorage.getItem('crash');
            localStorage.removeItem('crash')
            let i=9;
            timer=setInterval(function(){
                document.querySelector("#second").innerText=i;
                i--;
                if(i==-1){
                    clearInterval(timer);
                    setTimeout(function(){
                        window.location.href="${ctx}/login/uIndex"
                    },1)
                }
            },1000)
        },
        methods: {
            navto(){
                window.location.href="${ctx}/login/uIndex"
            },
        }
    })
</script>
</body>
</html>