<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resource/images/mylogo.ico" />
    <link rel="stylesheet" href="${ctx}/resource/user/element-ui/index.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${ctx}/resource/user/element-ui/index.js"></script>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <style>
        body{
            background-color: white;
            margin: 0px 8px;
        }

        .a3{
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: 550;
        }
        .a3 div{
            margin: 10px 0;
        }
        .el-radio, .el-radio--medium.is-bordered .el-radio__label{
            font-size: 16px;
            font-weight: 550;
        }
        .el-dialog__body{
            font-size: 16px;
        }
        .el-radio{
            margin: 15px 0;
            width: 600px;
        }
        .el-radio.is-bordered+.el-radio.is-bordered{
            margin-left: 0px;
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
<div id="app" style="margin:0px 380px;">


    <h1 style="text-align: center;margin-top: 30px">错题回顾</h1>

    <div class="a2">
        <h3>{{title}}</h3>
    </div>
    <div class="a3">
        <div>A.{{ansa}}</div>
        <div>B.{{ansb}}</div>
        <div>C.{{ansc}}</div>
        <div>D.{{ansd}}</div>
        <div style="color: red">
            正确答案为：{{rightan}}
        </div>
        <div>
            答案解析：{{exp}}
        </div>
    </div>
    <div>
        <el-button :disabled="index==1" @click="last"  type="primary" icon="el-icon-arrow-left">上一题</el-button>
        <el-button  :disabled="index==selectedque.length" @click="next"   type="primary" style="margin-left: 50px">下一题<i class="el-icon-arrow-right el-icon--right"></i></el-button>
        <el-button  @click="submit"  type="success" style="margin-left: 50px">返回</el-button>
    </div>
</div>

</body>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                questions:[],
                selectedque:[],
                myans:[],
                index:1,
                title:'',
                ansa:'',
                ansb:'',
                ansc:'',
                ansd:'',
                rightan:'',
                exp:'',
                errlist:[]
            }
        },
        mounted() {
            this.errlist = JSON.parse(localStorage.getItem('errlist'));
            console.log("错误的题目为：",this.errlist)
            localStorage.removeItem('errlist')
            window.parent.postMessage(document.body.clientHeight-100,'*')
            this.init()
        },
        methods: {
            async init(){
                this.selectedque=this.errlist
                this.getque(1)
            },
            back(){
                window.location.href="${ctx}/login/uIndex"
            },
            getque(mynum){
                this.title=this.selectedque[mynum-1].title
                this.ansa=this.selectedque[mynum-1].ansa
                this.ansb=this.selectedque[mynum-1].ansb
                this.ansc=this.selectedque[mynum-1].ansc
                this.ansd=this.selectedque[mynum-1].ansd
                this.rightan=this.selectedque[mynum-1].rightans
                this.exp=this.selectedque[mynum-1].prepared
            },
            next(){
                this.myans[this.index-1]=this.radio1
                this.index=this.index+1
                this.getque(this.index)
                this.radio1=this.myans[this.index-1]
            },
            last(){
                this.myans[this.index-1]=this.radio1
                this.index=this.index-1
                this.getque(this.index)
                this.radio1=this.myans[this.index-1]
            },
            submit(){
                window.location.href='${ctx}/login/uIndex'
            }
        },
    })
</script>
</html>
