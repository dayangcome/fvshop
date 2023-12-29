<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8" />
    <title>首页</title>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resource/images/mylogo.ico" />
    <link rel="stylesheet" href="${ctx}/resource/user/element-ui/index.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${ctx}/resource/user/element-ui/index.js"></script>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <style type="text/css">

        h2{
            display: block;
            margin-top: 20px;
        }
        h1{
            display: block;
            margin-bottom:30px;
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
<%@include file="/common/utop.jsp"%>
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
<div id="app">

    <div style="text-align: center;margin-top: 30px">
        <h1>答题挑战</h1>
        <h2>答题结束！您答对的题数为：<span style="color: red;margin-right: 5px">{{right}}</span> 题！</h2>
        <h2 v-if="right<6">很遗憾，您没有获得答题奖励</h2>
        <h2 v-if="right==6||right==7">恭喜！您获得了三等奖：2元消费券！</h2>
        <h2 v-if="right==8||right==9">恭喜！您获得了二等奖：5元消费券！</h2>
        <h2 v-if="right==10">恭喜！您获得了一等奖：10元消费券！</h2>
        <el-button type="success" @click="navto2" style="margin-top: 30px">查看错题</el-button>
        <el-button type=primary @click="navto">返回主页面</el-button>
    </div>
</div>
<script>
    new Vue({
        el: '#app',
        data() {
            return{
                right:0,
                errlist:[]
            }
        },
        created() {
            this.right = localStorage.getItem('right');
            localStorage.removeItem('right')
            this.errlist = JSON.parse(localStorage.getItem('errlist'));
            console.log("错误的题目为：",this.errlist)
            window.parent.postMessage(document.body.clientHeight-100,'*')
        },
        methods: {
            navto(){
                window.location.href='${ctx}/login/uIndex'
            },
            navto2(){
                window.location.href='${ctx}/question/feedback'
            },
            goBack() {
                window.location.href='${ctx}/login/uIndex'
            }
        }
    })
</script>
</body>
</html>
