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
        .a1{
            color:#a6a4a4;
            font-size: 18px;
        }
        .a11{
            font-size: 18px;
            display: inline-block;
            margin-right: 50px;
        }
        .a3{
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
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
        .el-button--primary:focus {
            background-color: #409EFF;
            border-color: #409EFF;
            color: #FFF;
        }

        .el-button--primary:hover {
            background: #66b1ff;
            border-color: #66b1ff;
            color: #FFF;
        }

        .el-button--primary.is-active, .el-button--primary:active {
            background: #3a8ee6;
            border-color: #3a8ee6;
            color: #FFF;
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
<div id="app" style="margin:30px 380px;">
    <el-dialog title="答题挑战" :visible.sync="userinfoVisible" width="35%" top="27vh">
        欢迎来到答题挑战，在这里你将有<strong>90秒</strong>的时间回答我们精选的<strong>10道</strong>题目，答对<strong>6道</strong>及以上将会有奖品！
        点击开始答题即可开始！
        <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="begin">开始答题</el-button>
            <el-button  @click="back">返回主页</el-button>
        </div>
    </el-dialog>

    <h1 style="text-align: center;">答题挑战</h1>
    <div style="display: flex;justify-content: space-between">
        <div class="a1">
            第{{index}}题
        </div>
        <div class="a11">
            剩余时间：<span id="second" style="display:inline-block;color: red;margin-right:5px">90</span>秒
        </div>
    </div>
    <div class="a2">
        <h3>{{title}}</h3>
    </div>
    <div class="a3">
        <el-radio v-model="radio1" label="A" border>A.{{ansa}}</el-radio>
        <el-radio v-model="radio1" label="B" border>B.{{ansb}}</el-radio>
        <el-radio v-model="radio1" label="C" border>C.{{ansc}}</el-radio>
        <el-radio v-model="radio1" label="D" border>D.{{ansd}}</el-radio>
    </div>
    <div>
        <el-button :disabled="index==1" @click="last"  type="primary" icon="el-icon-arrow-left">上一题</el-button>
        <el-button :disabled="index==10" @click="next"   type="primary" style="margin-left: 50px">下一题<i class="el-icon-arrow-right el-icon--right"></i></el-button>
        <el-button :disabled="index!=10" @click="submit"  type="success" style="margin-left: 50px">提交</el-button>
    </div>
</div>

</body>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                questions:[
                    {
                        id:"1",
                        title:"下列哪种营养素在人体内不能合成而必须从食物中摄入？",
                        ansa:"蛋白质",
                        ansb:"脂肪",
                        ansc:"碳水化合物",
                        ansd:"维生素",
                        rightans:"D",
                        prepared:"维生素是一种人体无法自己合成而必须从食物中摄入的营养素。蛋白质、脂肪和碳水化合物虽然也是重要的营养素，但是人体可以通过代谢和吸收来合成它们，所以不是必须从食物中摄入的。相比之下，维生素是一类必需的有机化合物，它们在人体内发挥着许多重要的生理功能，包括调节新陈代谢、支持免疫系统等，而且只能通过食物或补充剂摄入。"
                    },{
                        id:"2",
                        title:"某种水果含有丰富的维生素C，常吃可以预防哪种疾病？",
                        ansa:"坏血病",
                        ansb:"糖尿病",
                        ansc:"高血压",
                        ansd:"骨折",
                        rightans:"A",
                        prepared:"维生素C是一种对人体非常重要的营养素，它是一种抗坏血病的必需物质。坏血病是由于缺乏维生素C造成的一种疾病，常见的症状包括出血、牙齿松动、皮肤出现瘀斑等。维生素C可以促进胶原蛋白的合成，这是一种在皮肤、血管和骨骼中起关键作用的蛋白质。因此，经常摄入富含维生素C的水果可以预防坏血病。"
                    },{
                        id:"3",
                        title:"以下哪种蔬菜富含维生素A，有助于保护视力？",
                        ansa:"菠菜",
                        ansb:"胡萝卜",
                        ansc:"洋葱",
                        ansd:"西红柿",
                        rightans:"B",
                        prepared:"维生素A是维护视力和免疫系统健康的重要营养素。胡萝卜是一种富含β-胡萝卜素的蔬菜，这是维生素A的一种前体物质。在人体内，β-胡萝卜素可以转化为活性的维生素A，有助于保护视网膜和维持正常的视觉功能。因此，经常食用胡萝卜对保护视力非常有益。"
                    },{
                        id:"4",
                        title:"下列水果中哪种含有最多的纤维素，有助于促进消化？",
                        ansa:"苹果",
                        ansb:"香蕉",
                        ansc:"橙子",
                        ansd:"梨",
                        rightans:"B",
                        prepared:"纤维素是一种对促进消化和维持肠道健康非常有益的营养素。虽然许多水果中都含有纤维素，但香蕉是其中的佼佼者。香蕉富含可溶性和不可溶性纤维素，这两种纤维素都有助于保持正常的肠道运动和便秘预防。所以，常吃香蕉可以促进消化系统的健康。"
                    },{
                        id:"5",
                        title:"以下哪种水果是维生素C的良好来源？",
                        ansa:"草莓",
                        ansb:"哈密瓜",
                        ansc:"柠檬",
                        ansd:"葡萄",
                        rightans:"C",
                        prepared:"维生素C是一种强大的抗氧化剂，有助于增强免疫系统和维持健康的皮肤。柠檬是维生素C的良好来源之一，它富含这种营养素，尤其是柠檬的果皮含有更多的维生素C。常吃柠檬或饮用柠檬水可以帮助补充维生素C，促进免疫力和整体健康。"
                    },{
                        id:"6",
                        title:"以下哪种水果含有丰富的钾元素，有助于维持正常的心脏功能？",
                        ansa:"草莓",
                        ansb:"苹果",
                        ansc:"香蕉",
                        ansd:"蓝莓",
                        rightans:"C",
                        prepared:"钾是一种对维持正常心脏功能和血压至关重要的矿物质。香蕉是一种富含钾元素的水果，常吃香蕉可以帮助平衡体内的电解质，维持正常的心脏节律和血压水平。"
                    },{
                        id:"7",
                        title:"以下哪种蔬菜富含维生素K，有助于血液凝结和骨骼健康？",
                        ansa:"菠菜",
                        ansb:"西兰花",
                        ansc:"茄子",
                        ansd:"生菜",
                        rightans:"B",
                        prepared:"维生素K是一种对于血液凝结和骨骼健康至关重要的营养素。西兰花是一种富含维生素K的蔬菜，经常食用西兰花可以有助于维持血液凝结功能和骨骼密度。"
                    },{
                        id:"8",
                        title:"以下哪种水果含有丰富的抗氧化剂，有助于抵抗自由基损伤？",
                        ansa:"桃子",
                        ansb:"橘子",
                        ansc:"葡萄柚",
                        ansd:"猕猴桃",
                        rightans:"D",
                        prepared:"抗氧化剂是一类有助于抵抗自由基损伤的营养素，它们可以保护细胞免受氧化应激的损害。猕猴桃是一种富含抗氧化剂的水果，尤其是维生素C和维生素E，这两种营养素都具有强大的抗氧化功效，有助于维护健康的细胞功能。"
                    },{
                        id:"9",
                        title:"以下哪种蔬菜含有丰富的纤维素，有助于降低胆固醇水平？",
                        ansa:"洋葱",
                        ansb:"芹菜",
                        ansc:"南瓜",
                        ansd:"菜花",
                        rightans:"C",
                        prepared:"纤维素是一种对降低胆固醇水平和促进消化健康有益的营养素。南瓜是一种富含纤维素的蔬菜，特别是可溶性纤维素，它可以帮助减少胆固醇的吸收并促进胆固醇排出体外，从而有助于维持良好的心血管健康。"
                    },{
                        id:"10",
                        title:"以下哪种水果富含维生素E，有助于保护细胞膜免受氧化损伤？",
                        ansa:"菠萝",
                        ansb:"荔枝",
                        ansc:"杏子",
                        ansd:"杏仁",
                        rightans:"D",
                        prepared:"维生素E是一种脂溶性维生素，具有强大的抗氧化功效，有助于保护细胞膜免受氧化损伤。杏仁是一种富含维生素E的坚果，常吃杏仁可以帮助提供足够的维生素E，维护细胞健康和延缓衰老过程。"
                    },{
                        id:"11",
                        title:"以下哪种水果富含植物纤维，有助于促进肠道健康？",
                        ansa:"梨",
                        ansb:"草莓",
                        ansc:"橙子",
                        ansd:"葡萄",
                        rightans:"A",
                        prepared:"梨是一种富含植物纤维的水果，植物纤维有助于促进肠道健康，预防便秘和其他消化问题。梨的纤维含量较高，常食用可以帮助维持肠道正常运动和排便。"
                    },{
                        id:"12",
                        title:"以下哪种蔬菜含有丰富的叶酸，对孕妇和胎儿发育很重要？",
                        ansa:"土豆",
                        ansb:"菜花",
                        ansc:"菠菜",
                        ansd:"胡萝卜",
                        rightans:"C",
                        prepared:"叶酸是一种对胎儿神经管发育非常重要的营养素，特别是对孕妇来说尤为重要。菠菜是一种富含叶酸的蔬菜，常食用可以帮助预防胎儿神经管缺陷，维护胎儿健康。"
                    },{
                        id:"13",
                        title:"以下哪种水果富含抗氧化剂番茄红素，有助于预防心血管疾病？",
                        ansa:"草莓",
                        ansb:"蓝莓",
                        ansc:"西瓜",
                        ansd:"樱桃",
                        rightans:"C",
                        prepared:"西瓜是一种富含抗氧化剂番茄红素的水果，番茄红素是一种强大的抗氧化剂，有助于减少氧化应激和预防心血管疾病。"
                    },{
                        id:"14",
                        title:"以下哪种蔬菜富含维生素B6，有助于神经功能和蛋白质代谢？",
                        ansa:"洋葱",
                        ansb:"芹菜",
                        ansc:"土豆",
                        ansd:"胡萝卜",
                        rightans:"B",
                        prepared:"芹菜是一种富含维生素B6的蔬菜，维生素B6在神经功能和蛋白质代谢中起着重要的作用，经常摄入芹菜可以有助于维持这些生理功能的正常运作。"
                    },{
                        id:"15",
                        title:"以下哪种水果富含维生素K，有助于骨骼健康和凝血功能？",
                        ansa:"桃子",
                        ansb:"橙子",
                        ansc:"香蕉",
                        ansd:"李子",
                        rightans:"D",
                        prepared:"李子是一种富含维生素K的水果，维生素K对于骨骼健康和凝血功能非常重要，经常食用李子可以帮助维持这些生理功能的正常运作。"
                    }
                ],
                selectedque:[],
                myans:[],
                index:1,
                title:'',
                ansa:'',
                ansb:'',
                ansc:'',
                ansd:'',
                score:0,
                radio1: '1',
                userinfoVisible:true,
                errlist:[]
            }
        },
        mounted() {
            this.init()
        },
        methods: {
            async init(){
                for(let i=0;i<10;i++){
                    let len=this.questions.length
                    let thenum=Math.floor(Math.random()*len)
                    this.selectedque.push(this.questions[thenum])
                    this.questions.splice(thenum,1)
                }
                this.getque(1)
            },
            begin(){
                this.userinfoVisible = false
                let i=89
                timer=setInterval(function(){
                    document.querySelector("#second").innerText=i;
                    i--;
                    if(i==-1){
                        clearInterval(timer);
                        setTimeout(function(){
                        },1)
                    }
                },1000)
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
                this.myans[9]=this.radio1
                let right=0
                console.log(this.selectedque)
                for(let i=0;i<10;i++){
                    if(this.myans[i]==this.selectedque[i].rightans){
                        right+=1
                    }else{
                        this.errlist.push(this.selectedque[i])
                    }
                }
                window.localStorage.setItem("right",right)
                window.localStorage.setItem("errlist",JSON.stringify(this.errlist))
                window.location.href="${ctx}/question/ans"
            }
        },
    })
</script>
</html>
