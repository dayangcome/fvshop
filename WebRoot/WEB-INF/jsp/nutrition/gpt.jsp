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
        .el-textarea__inner{
            font-size: 16px;
            font-weight: 550;
            color: black;
        }
        .slider-block {
            display: flex;
            align-items: center;
        }

        .slider-block .el-slider {
            margin-top: 0;
            margin-left: 12px;
        }

        .slider-block .slider-laber+.el-slider {
            flex: 0 0 70%;
        }
        .point:nth-last-child(1){
            border-bottom: 1px #DCDFE6 solid;
        }
        .point:hover{
            background-color: #f3f3f6;
        }
        .point:hover{
            cursor: pointer;
        }
        .el-loading-text{
            white-space: pre;
        }
        .el-loading-spinner .el-loading-text{
            font-size: 18px;
        }
        .el-loading-spinner{
            top:25%
        }


    </style>
</head>

<body>
<%@include file="/common/utop.jsp"%>
<div class="width100" style="height: 45px;background: #0ab50a;margin-top: 40px;position: relative;z-index: 100;">
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
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
<div id="app" style="margin-left: 150px;margin-right: 150px;margin-top: 30px">
    <el-container>
        <el-main>
            <el-row :gutter="40" v-loading="loading" :element-loading-text="mytext">
                <el-col :span="16" class="col-params">
                    <h1 style="margin-bottom: 25px">AI自助营养分析</h1>
                    <el-form>
                        <el-input v-model="prompt" placeholder="输入要进行营养分析的水果/蔬菜"></el-input>
                    </el-form>
                    <el-button size="large" style="float: right;margin: 10px 0" type="success" @click="submitForm">营养分析</el-button>

                    <div style="margin-top: 60px">
                        <h4>分析结果</h4>
                        <p id="result" style="color:red;white-space: pre-wrap;">{{ response }}</p>
                    </div>
                </el-col>
                <el-col :span="8" class="col-params">

                    <h3 style="margin-bottom: 20px">常见水果/蔬菜</h3>
                    <div class="point" v-for="i in questions" @click="addn(i)" style="padding: 10px;font-size: 16px;border-top: 1px #DCDFE6 solid;">
                        {{i}}
                    </div>

                </el-col>
            </el-row>
        </el-main>
    </el-container>
</div>

<script src="${ctx}/resource/user/axios/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data(){
            return {
                key: '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',
                prompt: '',
                temperature: 1,
                top_p: 1,
                max_tokens: 2048,
                frequency_penalty: 0,
                presence_penalty: 0,
                stop: ["Human:", "AI:"],
                model: 'text-davinci-003',
                response: '',
                loading:false,
                tips:[
                    '所谓多喝水是指每天喝够1500～1700毫升，大概一次性纸杯8杯的量。',
                    '运动时达到微微气喘、心跳加速但还能勉强说话交流的强度为最佳。',
                    '每天最好要喝够至少300克的牛奶或酸奶。',
                    '连续久坐超过90分钟，一定要起身活动一会再继续。',
                    '定期进行健康体检，疾病可以早发现。'
                ],
                questions:[
                    '苹果',
                    '菠萝',
                    '水蜜桃',
                    '西瓜',
                    '梨子',
                    '芒果',
                    '菠菜',
                    '西兰花',
                    '卷心菜',
                    '白菜',
                    '蘑菇',
                    '豆角'
                ],
                mytext:''
            }
        },
        mounted() {
            window.parent.postMessage(document.body.clientHeight-150,'*')
        },
        methods: {
            addn(i){
                this.prompt=i
            },
            submitForm(){
                this.mytext='请耐心等待AI进行分析......'+
                    '\n\n' +
                    '\n\n' +
'健康生活小贴士：'+this.tips[Math.floor(Math.random()* this.tips.length)]

                if(this.prompt==''){
                    this.$message.warning("请输入要分析的水果/蔬菜！")
                }else{
                    // let data = {
                    //     prompt: '请对'+this.prompt+'进行营养分析',
                    //     temperature: this.temperature,
                    //     top_p: this.top_p,
                    //     model: this.model,
                    //     max_tokens: this.max_tokens,
                    //     frequency_penalty: this.frequency_penalty,
                    //     presence_penalty: this.presence_penalty,
                    //     stop: this.stop
                    // }
                    this.loading = true
                    axios.get("/test1_war_exploded/gpt/getgpt?question=请对"+this.prompt+"进行营养分析，要求尽可能简略").then(res=>{
                        if(res.status==200){
                            this.loading = false
                            this.response = res.data;
                            console.log(this.response)
                        }else{
                            this.loading = false
                            this.response='在分析过程中出现了问题，请稍后进行重试...'
                        }
                    }).catch(err=>{
                        console.log(err)
                        this.loading = false
                        this.response = '非常抱歉！请求出现了异常... ';
                    })


                    // axios.post('https://api.openai.com/v1/completions', data, {
                    //     headers: {
                    //         'Content-Type': 'application/json',
                    //         'Authorization': `Bearer ` + this.key,
                    //     }
                    // }).then(response => {
                    //     this.loading = false
                    //     this.response = response.data.choices[0].text;
                    //
                    // }).catch(error => {
                    //     this.loading = false
                    //     this.response='在分析过程中出现了问题，请稍后进行重试...'
                    //     console.log(error);
                    // });
                }
            }
        },
    })
</script>
</body>
</html>
