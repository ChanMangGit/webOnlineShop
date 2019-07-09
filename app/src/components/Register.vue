<template>
    <!-- 注册组件 -->
    <!-- 外包div -->
    <div class="container">
        <!-- 头顶huawei logo -->
        <div class="logo">
            <img src="../../static/img/logo.jpg" alt="">
            <h3>Online Shop</h3>
            <h2>注册</h2>
        </div>
        <!-- 操作区域 operate-->
        <div class="operateDiv">
            <!-- 用户名 -->
            <mt-field :placeholder="accountInput" v-model="uname" class="myInput" :attr="{maxlength:8}"></mt-field>    <!--:attr="{maxlength:8}最大输入长度-->
            <!-- 手机号码 -->
            <mt-field placeholder="请输入手机号码" v-model="uphone" class="myInput"></mt-field>
            <!-- 邮箱 -->
            <mt-field placeholder="请输入邮箱" v-model="uemail" class="myInput"></mt-field>
            <!-- 密码输入框 -->
            <mt-field type="password" placeholder="请输入密码(6-10个字母/数字/下划线)" v-model="upass" class="myInput"></mt-field>
            <!-- 密码确认输入框 -->
            <mt-field type="password" placeholder="请再次输入密码" v-model="confirmpass" class="myInput"></mt-field>
            <!-- 验证码 -->
            <div class="verification">
                <verification ref="verification"></verification>
            </div>
            <!-- 登录按钮 -->
            <mt-button type="danger" class="myButton" @click="register">注册</mt-button>
        </div>
        <!-- 登录跳转 -->
        <div class="otherDiv">
            <span @click="loginVue">登录</span>
        </div>
    </div>
</template>
<script>
// 引入验证码组件
import Verification from "./common/Verification.vue"
export default {
    data() {
        return {
            accountInput:"请输入用户名",
            uname:"",
            uphone:"",
            uemail:"",
            upass:"",
            confirmpass:"",
        }
    },
    // 注册组件
    components:{
        "verification":Verification,
    },
    methods: {
        loginVue(){
            //跳转指定组件
            this.$router.push("/Login");
        },
        // 注册按钮
        register(){
            // 获取用户名
            var name = this.uname;
            // 获取手机号码
            var phone = this.uphone;
            // 获取邮箱
            var email = this.uemail;
            // 获取密码
            var password = this.upass;
            // 判断各输入框是否为空
            if(!name){
                this.$toast("用户名不能为空！");
                return;
            }
            if(!phone){
                this.$toast("手机号码不能为空！");
                return;
            }
            if(!email){
                this.$toast("电子邮件不能为空！");
                return;
            }
            if(!password){
                this.$toast("密码不能为空！");
                return;
            }
            // 创建三个正则表达式
            var preg = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;  //手机号码
            var ereg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;  //邮箱，不允许中文
            var psreg = /^(\w){6,10}$/;   //密码
            // 用正则表达式判断所输入信息是否合法
            //判断手机号码格式不正确 提示出错
            if(!preg.test(phone)){
                this.$toast("手机格式不正确");
                return;
            }
            //判断邮箱格式不正确 提示出错
            if(!ereg.test(email)){
                this.$toast("请输入正确邮箱");
                return;
            }
            //判断密码格式不正确 提示出错
            if(!psreg.test(password)){
                this.$messagebox("","密码格式：6-10个字母/数字/下划线");
                return;
            }
            // 判断两次密码输入是否相同
            if(this.upass!=this.confirmpass){
                this.$toast("两次输入密码不一样！");
                return;
            }
            //调用Verification组件方法,判断输入验证码是否正确
            this.$refs.verification.check();  

            // 验证注册账户是否已存在 crul cobj 不存在再注册
            // 将验证账户信息发送ajax请求  /checkAcc
            var url = "register";
            // 验证账户是否存在obj
            var obj = {uname:name,uphone:phone,uemail:email,upass:password};
            
            // 获取服务器返回结果
            this.axios.get(url,{params:obj}).then(result=>{
                // result对象 服务器返回结果
                // code==1 手机号码、邮件已存在
                if(result.data.code==1){
                    // 提示账户已存在
                    this.$messagebox("","所输入手机号码或邮箱已存在，请直接登录！");
                    return;
                }else{
                    // 账户不存在，向数据库插入数据
                    this.$messagebox("","注册成功！").then(result=>{
                        if("confirm"==result){
                            // 跳转到登录组件
                            this.$router.push("/Login"); 
                        }
                    });
                }
            });     
        },
    },
}
</script>
<style>
    /* logo样式 */
    .logo{
        width:100px;
        height:100px; 
        margin:0 auto; /*图标居中*/ 
    }
    /* logo下文字 */
    .logo>h3{
        font-family: "FangSong";
        font-size: 15px;
        font-style:italic;
        text-align: center;
        margin: 0;
    }
    .logo>h2{
        color:#fe0003;
        font-family: "webfont" !important;
        font-size: 25px;
        font-style:normal;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        margin-top: 5px;
        text-align: center;
        margin: 0;
    }
    
    .logo>img{
        width:100%;
    }
    /* 输入框底边框样式 */
    .mint-cell-wrapper  {
        border-bottom: 1px solid #ff5000;
    }
    /* 操作区域样式 */
    .operateDiv{
        display: flex;
        flex-direction: column;
        margin-top:20px;
    }
    /* 输入框样式 */
    .myInput{
        margin:0 45px;
    }
    .myInput:first-child{
        margin-top:5px;
    }
    /* 登录按钮样式 */
    .myButton{
        margin:20px auto;
        width: 286px;
    }
    /* 其他登录方式/注册样式 span文字 */
    .otherDiv{
        display: flex;
        justify-content: space-between;
        margin:0 45px;
        color:#ff5000;
    }
    /* 验证码样式 */
    .verification{
        margin-bottom: 5px;
        margin:0 45px;

    }
</style>