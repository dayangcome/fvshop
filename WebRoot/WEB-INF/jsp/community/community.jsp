<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/resource/user/element-ui/index.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resource/images/mylogo.ico" />
    <script src="${ctx}/resource/user/element-ui/index.js"></script>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <style>
        .el-message-box__wrapper{
            bottom: 350px;
        }
        .left{
            display: inline-block;
            width: 190px;
            height: 961px;
            background-color: white;
            border-radius:5px;
        }
        .button_dialog{
            width: 60px;
            height: 35px;
        }
        .hide{
            display: none;
        }
        .el-card__body{
            padding: 0;
        }
        .c1{
            position: fixed;
            top:0;
            bottom: 0;
            left:0;
            right: 0;
            background: rgba(0,0,0,.5);
            z-index: 2;
        }
        .c2{
            background-color: white;
            position: fixed;
            width: 420px;
            height: 220px;
            top:50%;
            left: 50%;
            z-index: 3;
            margin-top: -150px;
            margin-left: -200px;
        }
        #modal p {
            margin-left:80px;
        }
        .center{
            display: inline-block;
            width: 835px;
            height: 955px;
            background-color:  #fff;
            vertical-align: top;
            margin-left: 5px;

        }
        .center_top{
            display: inline-block;
            width: 835px;
            height: 205px;
            margin-left: 30px;
            background-color:#fff;
            border-radius:5px;
        }
        .center_bottom{
            overflow-y:auto;
            width: 835px;
            height: 707px;
            margin-top: 10px;
            margin-left: 30px;
            overflow-x: hidden;
            border-radius:5px;
            vertical-align: top;
        }
        .center_bottom_item{
            display: inline-block;
            width: 835px;
            margin: 24px 0;
            background-color: white;
            border-radius:5px;
            vertical-align: top;
        }
        .person_picture_site{
            vertical-align: top;
            width: 40px;
            height: 40px;
            display: inline-block;
            margin-left: 5px;
            margin-top: 5px;
        }
        .person_picture{
            vertical-align: top;
            width: 40px;
            height: 40px;
            display: inline-block;
            margin-left: 2px;
            margin-top: 5px;
        }
        .info_send{
            width:765px;
            height: 150px;
            background-color: white;
            display: inline-block;
            border-radius:5px;
        }
        .comment{
            display: inline-block;
            width: 662px;
            height: 30px;
            margin-left: 5px;
            margin-top: 5px;
            border-radius:5px;
            resize: none;
        }
        .right{
            display: inline-block;
            width: 220px;
            height: 784px;
            background-color: #fff;
            vertical-align: top;
            margin-left: 5px;
            overflow: hidden;
        }
        .right_group_name{
            margin-top: 20px;
            width: 220px;
            height: 100px;
            background-color: white;
            border-radius:5px;
        }
        .right_group_mark{
            width: 220px;
            background-color: white;
            border-radius:5px;
            margin-top: 10px;
            overflow-y:auto;
        }
        .right_mark_detail{
            display: block;
            color: skyblue;
            text-decoration: none;
            font-size: 20px;
            text-align: center;
        }
        .right_info{
            width: 220px;
            height: 150px;
            background-color: white;
            border-radius:5px;
            margin-top: 10px;
            overflow-y:auto;
        }
        .el-menu-item{
            font-size: 16px;
        }
        .right_rank{
            margin-top: 10px;
            height: 341px;
            background-color:white;
            border-radius:5px;
            width: 226px;
            overflow: auto;
        }
        .person{
            width: 200px;
            height: 60px;
            margin-top: 3px;
            background-color: white;
        }
        .el-divider{
            height: 1px;
            color: #e2e2e2;
        }

        .el-textarea__inner{
            font-size: 17px;
            color: black;
            font-weight: 500;
        }
        .el-checkbox{
            font-size: 16px;
            margin-bottom: 8px;
        }
        .mybutton{
            width: 100px;
            height: 100px;
            background-size: cover;
            cursor: pointer;
            margin: 0 5px;
        }
        .active{
            border:4px solid #F56C6C;
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
<div id="app" style="margin-left: 50px;margin-right: 50px;margin-top: 30px;margin-bottom: 40px;display: flex;">
    <div style="width: 200px;   display: inline-block;">

    </div>

    <div class="left" style="box-shadow: 4px 4px 8px rgba(0, 0, 0, .1), -4px -4px 8px rgba(0, 0, 0, .1);">
        <br>
        <div>
            <a style="color: black; text-decoration: none; font-size: 25px;" href="#" target="_blank"></a>
        </div>
        <el-menu
                default-active="7"
                class="el-menu-vertical-demo"
                @select="handleSelect"
        >
            <el-menu-item index="0">
                <i class="el-icon-s-custom"></i>
                <span slot="title">社区公告</span>
            </el-menu-item>

            <el-menu-item index="4">
                <i class="el-icon-data-board"></i>
                <span slot="title">社区反馈</span>
            </el-menu-item>

        </el-menu>

    </div>


    <el-dialog
            title="社区公告"
            :visible.sync="centerDialogVisible"
            width="30%"
            :lock-scroll="sclock"
            center>
        <div>
            <h3>请各位友善发言，创建和谐社区！</h3>
        </div>

        <span slot="footer" class="dialog-footer">
                <el-button @click="centerDialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="centerDialogVisible = false">确 定</el-button>
            </span>
    </el-dialog>



    <el-dialog
            title="社区反馈"
            :visible.sync="changeshow"
            width="30%"
            :lock-scroll="sclock"
    >
        <el-input
                type="textarea"
                placeholder="请在这里输入给我们社区的建议和反馈"
                :autosize="{ minRows: 3, maxRows: 8}"
                v-model="theshow"
                maxlength="200"
                show-word-limit
        >
        </el-input>
        <span slot="footer" class="dialog-footer">
    <el-button @click="changeshow = false">取 消</el-button>
    <el-button type="primary" @click="mychange(3)">发 送</el-button>
  </span>
    </el-dialog>


    </el-card>

    <div class="center" style="box-shadow: 4px 4px 8px rgba(0, 0, 0, .1), -4px -4px 8px rgba(0, 0, 0, .1);">
        <el-card class="box-card">
            <div class="center_top">
                <div style="margin: 10px 0px 10px 0px;text-align: center;padding-right: 40px">
                    <h2 style="display: inline-block">社区交流板块</h2>
                </div>
                <div class="info_send">

                    <div style="margin-bottom: 12px">
                        <textarea class="el-textarea__inner" v-model="mytext" style="width: 740px; height: 76px; margin-left: 5px; margin-top: 5px; border-radius:5px; resize: none; " placeholder="在这里输入你想要交流的内容，发布实时动态"></textarea>
                    </div>
                    <div @click="talk" style="display: inline-block;margin-left: 10px;">
                        <label>
                            <img style="width: 40px; height: 40px;cursor: pointer;" src="${ctx}/resource/images/pic2.png" alt="pSylOJS.jpg" border="0" />
                            <div style="display: inline-block;cursor: pointer;margin-left: 2px;  vertical-align:top; margin-top: 8px;">话题</div>
                        </label>
                    </div>
                    <el-popover
                            placement="bottom"
                            width="458"
                            trigger="click">
                        <div>
                            <div style="margin:0 5px;font-size: 15px">请选择发布动态的配图：</div>
                            <button class="mybutton b1" @click="b11" style="background-image: url('${ctx}/resource/images/R-C.jpg');">
                            </button>
                            <button class="mybutton b2" @click="b22" style="background-image: url('${ctx}/resource/images/a.jpg');">
                            </button>
                            <button class="mybutton b3" @click="b33" style="background-image: url('${ctx}/resource/images/b.jpg');">
                            </button>
                            <button class="mybutton b4" @click="b44"  style="background-image: url('${ctx}/resource/images/c.jpg');">
                            </button>
                        </div>
                        <label slot="reference" style="display: inline-block;margin-left: 30px;vertical-align: bottom">
                            <img style="width: 40px;cursor: pointer; height: 40px;" src="${ctx}/resource/images/pic1.png" alt="pSylOJS.jpg" border="0" />
                            <div style="display: inline-block;cursor: pointer; vertical-align:top;margin-left: 5px; margin-top: 8px;">图片</div>
                        </label>
                    </el-popover>


                    <div style="display: inline-block;cursor: pointer; float: right; width: 90px; height: 40px;margin-top:15px;cursor: pointer;" > <el-button @click="mysend" type="primary" plain>发布</el-button></div>
                </div>
            </div>
            <el-divider></el-divider>
            <div class="center_bottom"  >
                <div v-for="item in dylist" class="center_bottom_item" style="margin-top: 0px;">
                    <div>
                        <div class="person_picture_site" ><img style="width: 40px; height: 40px;border-radius: 50%" :src="item.avatar" alt="" title=""></div>
                        <div style="display: inline-block; ">
                            <div style=" font-size: 15px; margin-top: 4px;">{{item.name}}</div>
                            <div style=" font-size: 15px; margin-top: 4px;">{{item.createdate.toLocaleString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')}}</div>
                        </div>
                        <el-popconfirm
                                title="确定要删除这条动态吗？"
                                @confirm="del(item.id)"
                        >
                            <el-button slot="reference" v-if="item.name=='123'" style="float: right;margin-right: 96px;margin-top: 12px;" type="text" >删除动态</el-button>
                        </el-popconfirm>

                    </div>
                    <div style="font-size: 20px; margin-top: 15px; margin-left:3px;margin-bottom: 15px"><span v-html="topic(item.content)"></span></div>
                    <div  v-if="item.prepare1!='pic'" style=" vertical-align: top;width: 40px; display: inline-block; margin-left: 5px; margin-top: 5px; "><img style="width: 200px; height: 140px;" :src="item.prepare1" alt="" title=""></div>
                    <div>
                        <el-input class="comment"  placeholder="写下评论"></el-input>
                        <div style="display: inline-block; width: 90px; height: 40px; margin-left: 2px; margin-top: 3px;"><el-button type="primary" plain>发送</el-button></div>
                    </div>
                </div>
            </div>
        </el-card>
    </div>


<%--    <div class="right" style="box-shadow: 4px 4px 8px rgba(0, 0, 0, .1), -4px -4px 8px rgba(0, 0, 0, .1);">--%>
<%--        <div class="right_group_name">--%>
<%--            <div style="font-size: 25px; text-align: center;"><el-avatar :size="50" :src="mygroup.avatar"></el-avatar></div>--%>
<%--            <div style="font-size: 20px;font-weight: 550; text-align: center;">{{mygroup.name}}</div>--%>
<%--        </div>--%>
<%--        <el-divider></el-divider>--%>
<%--        <div class="right_group_mark">--%>
<%--            <div style="font-size: 25px; text-align: center;">小组标签</div>--%>

<%--            <a v-for="item in gtags" class="right_mark_detail">{{item}}</a>--%>
<%--        </div>--%>
<%--        <el-divider></el-divider>--%>
<%--        <div class="right_info">--%>
<%--            <div style="font-size: 25px; text-align: center;">小组公告</div>--%>

<%--            <div style="font-size: 20px; margin-left: 3px;">{{mygroup.introduction}}</div>--%>
<%--        </div>--%>
<%--        <el-divider></el-divider>--%>
<%--        <div class="right_rank">--%>
<%--            <div style="font-size: 25px; text-align: center;">消耗热量排行榜</div>--%>
<%--            <el-divider></el-divider>--%>
<%--            <div class="person" v-for="(u,o) in members">  <div style="font-size: 20px; display: inline-block;" >--%>
<%--                &nbsp;  {{o+1}} &nbsp;    </div>  <div class="person_picture"><img style="width: 40px; height: 40px;border-radius: 50%;" :src="u.avatar" alt="" title=""></div> {{u.username}}</div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div style="width: 200px;   display: inline-block;">

    </div>
</div>
<script src="${ctx}/resource/user/axios/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                mygroup: {},
                userInfo:{},
                userInfo2:{},
                gtags:[],
                centerDialogVisible:false,
                circleUrl:"",
                circleUrl2:"",
                circleUrl3:"",
                changename:false,
                sclock:false,
                newname:'',
                changetag:false,
                checklist:[],
                changeshow:false,
                theshow:'',
                mytext:'',
                dylist:[
                ],
                piclist:[
                    "./R-C.jpg",
                    "./a.jpg",
                    "./b.jpg",
                    "./c.jpg"
                ],
                checkpic:'pic',
                touxiang:[
                    '${ctx}/resource/img/img.png',
                    '${ctx}/resource/img/img_1.png',
                    '${ctx}/resource/img/img_2.png',
                ]
            }
        },
        computed: {},
        created() {
            // var userInfo = window.localStorage.getItem('userInfo')
            // userInfo = JSON.parse(userInfo)
            // this.userInfo=userInfo
            // var userInfo2 = window.localStorage.getItem('userInfo2')
            // userInfo2 = JSON.parse(userInfo2)
            // this.userInfo2=userInfo2
            // this.mygroup=JSON.parse(window.localStorage.getItem("mygroup"))
            // window.localStorage.removeItem("mygroup")
            // this.gtags=this.mygroup.tags.split(' ')
            // this.gtags.pop()
            <%--axios({--%>
            <%--    url:'${ctx}/user/myView',--%>
            <%--    method: 'get',--%>
            <%--}).then(res=>{--%>
            <%--    console.log(res)--%>
            <%--}).catch(e=>{--%>
            <%--    //接受异常错误信息--%>
            <%--})--%>
            <%--var value = sessionStorage.getItem('obj');--%>
            <%--console.log(value)--%>
        },
        mounted() {
            window.parent.postMessage(document.body.clientHeight-350,'*')
            // this.newname=this.mygroup.name
            // this.checklist=this.gtags
            // this.theshow=this.mygroup.introduction
            // this.init()
            // this.getmems()
            this.dylist.unshift(
                {
                    name:'懒懒',
                    createdate:'2023-07-14 20:34:23',
                    prepare1:'pic',
                    content:'感觉苹果不错',
                    avatar:this.touxiang[0]
                }
            )
            this.dylist.unshift(
                {
                    name:'peamaker',
                    createdate:'2023-07-19 14:08:20',
                    prepare1:'pic',
                    content:'买了西红柿，想做番茄炒蛋，可是不太会😥',
                    avatar:this.touxiang[2]
                }
            )

        },
        methods: {
            b11(){
                this.checkpic=this.piclist[0]
                document.querySelector(".b1").classList.add("active")
                document.querySelector(".b2").classList.remove("active")
                document.querySelector(".b3").classList.remove("active")
                document.querySelector(".b4").classList.remove("active")
            },
            b22(){
                this.checkpic=this.piclist[1]
                document.querySelector(".b2").classList.add("active")
                document.querySelector(".b1").classList.remove("active")
                document.querySelector(".b3").classList.remove("active")
                document.querySelector(".b4").classList.remove("active")
            },
            b33(){
                this.checkpic=this.piclist[2]
                document.querySelector(".b3").classList.add("active")
                document.querySelector(".b2").classList.remove("active")
                document.querySelector(".b1").classList.remove("active")
                document.querySelector(".b4").classList.remove("active")
            },
            b44(){
                this.checkpic=this.piclist[3]
                document.querySelector(".b4").classList.add("active")
                document.querySelector(".b2").classList.remove("active")
                document.querySelector(".b3").classList.remove("active")
                document.querySelector(".b1").classList.remove("active")
            },
            del(id){
                delete this.dylist[id]
            },
            // getmems(){
            //     getmymem(this.mygroup.id).then(res=>{
            //         if(String(res.code) === '1'){
            //             this.members=res.data
            //             this.members1=this.members.filter(e =>
            //                 e.uid!=this.mygroup.leader&&
            //                 e.uid!=this.mygroup.deputyleader1&&
            //                 e.uid!=this.mygroup.deputyleader2
            //             )
            //         }else {
            //             this.$message.error(res.msg)
            //         }
            //     })
            // },
            mysend(){
                if(this.mytext==''){
                    this.$message.warning("请输入发布内容！")
                }else{
                    console.log(this.checkpic)
                    this.mytext=this.mytext.replaceAll("#","@")
                    this.$message.success("发布成功")
                    this.dylist.unshift({
                        name:'123',
                        createdate:new Date(),
                        prepare1:'pic',
                        content:this.mytext,
                        avatar:this.touxiang[1],
                        id:this.dylist.length
                    })
                    this.mytext=''
                    }
                },

            // logout(){
            //     this.$confirm('确认要退出小组吗?', '提示', {
            //         'confirmButtonText': '确定',
            //         'cancelButtonText': '取消',
            //         'type': 'warning'
            //     }).then(() => {
            //         lout(this.userInfo.uid).then(res=>{
            //             if(String(res.code) === '1'){
            //                 this.$message.success("成功退出小组")
            //                 window.location.href='../search/search1.html'
            //             }else {
            //                 this.$message.error("退出失败")
            //             }
            //         })
            //     })
            // },
            // mychange(num){
            //     let str=''
            //     for(let i=0;i<this.checklist.length;i++){
            //         str+=this.checklist[i]
            //         str+=' '
            //     }
            //     const params = {
            //         id: this.mygroup.id,
            //         name: this.newname,
            //         introduction: this.theshow,
            //         tags:str
            //     }
            //     if(this.checklist.length<1){
            //         this.$message.warning("请至少选择一个标签！")
            //     }else if(this.checklist.length>5){
            //         this.$message.warning("最多选择5个标签！")
            //     }else{
            //         changeinfo(params).then(res=>{
            //             if(String(res.code) === '1'){
            //                 this.$message.success("修改成功")
            //                 if(num==1){
            //                     this.mygroup.name=this.newname
            //                     this.changename=false
            //                 }else if(num==2){
            //                     this.gtags=this.checklist
            //                     this.changetag=false
            //                 }else if(num==3){
            //                     this.mygroup.introduction=this.theshow
            //                     this.changeshow=false
            //                 }
            //             }else {
            //                 this.$message.error("修改失败")
            //             }
            //         })
            //     }
            // },
            talk(){
                this.mytext='#'+this.mytext+'# '
            },
            pict(){},
            init(){
                getinfo(this.mygroup.id).then(res=>{
                    if(String(res.code) === '1'){
                        this.dylist=res.data
                    }else {
                        this.$message.error("发布失败")
                    }
                })
            },
            topic(v){
                return v.replaceAll(/@([^@]*)@/g, `<span style="color:dodgerblue;cursor: pointer">#$1#</span>`)
            },
            handleSelect(key, keyPath) {
                console.log(key)
                if(key==0){
                    this.centerDialogVisible=true
                }
                if(key==2){
                    this.changename=true;
                }
                if(key==3){
                    this.changetag=true
                }
                if(key==4){
                    this.changeshow=true
                }
                if(key==6){
                }
            },
        },
    })
</script>
</body>
</html>
