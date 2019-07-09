<template>
    <!-- 登录组件 -->
    <!-- 外包div -->
    <div class="container">
        <!-- 头顶huawei logo -->
        <div class="logo">
            <img src="../../static/img/logo.jpg" alt="">
            <h3>Online Shop</h3>
            <h2>登录</h2>
        </div>
        <!-- 操作区域 operate-->
        <div class="operateDiv">
            <!-- 手机或邮箱登录输入框 -->
            <mt-field :placeholder="accountInput" v-model="uaccount" class="myInput" ></mt-field>
            <!-- 密码输入框 -->
            <mt-field type="password" placeholder="请输入密码" v-model="upass" class="myInput"></mt-field>
            <!-- 登录按钮 -->
            <mt-button type="danger" class="myButton" @click="login">登录</mt-button>
        </div>
        <!-- 其他登录方式/注册 -->
        <div class="otherDiv">
            <a>其他登录方式</a>
            <span @click="registerVue">注册</span>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            accountInput:"请输入手机号码/邮箱",
            uaccount:"",
            upass:"",
            uname:[]
        }
    },
    methods: {
        // 跳转到注册组件
        registerVue(){
            this.$router.push("/Register");
        },
        login(){
            // 账户为手机号码或邮箱
            // 获取账户--手机号码或邮箱
            var account = this.uaccount;
            // 获取密码
            var password = this.upass;
            // 判断所输入是否为空
            if(!account){
                this.$toast("账号不能为空！");
                return;
            }
            if(!password){
                this.$toast("密码不能为空！");
                return;
            }
            // 获取登录判断条件
            var uname=sessionStorage.getItem("uname");
            if(uname){
                this.$messagebox("","你已登录").then(confirm=>{
                    this.$router.push("/Home")
                })
                return
            }
             // 创建两个正则表达式
            var preg = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;  //手机号码
            var ereg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;  //邮箱，不允许中文
            // 用正则表达式判断所输入的账户是手机号码还是邮箱
            // 根据账户的不同进行ajax验证
            if(preg.test(account)){
                console.log("手机登录");
                // 手机号码作为账户
                //将手机号码和密码发送 ajax请求
                var url = "phoneLogin";
                var obj = {uphone:account,upass:password};
                //并且获取服务器返回结果
                this.axios.get(url,{params:obj}).then(result=>{
                    //result 对象服务器返回结果
                    console.log(result.data.uname+"111111");
                    if(result.data.code == 1){   
                        
                        sessionStorage.setItem("uname",result.data.uname);
                        sessionStorage.setItem("uid",result.data.uid);
                        
                        this.$toast("登录成功！");
                        //跳转指定组件
                        this.$router.push("/Home");
                        
                    }else{
                        this.$messagebox("消息",result.data.msg);
                    }
                });
            }else if(ereg.test(account)){
                console.log("邮箱登录");
                //邮箱作为账户
                // 发送ajax请求
                var url="emailLogin";
                var obj={uemail:account,upass:password};
                // 获取服务器返回结果
                this.axios.get(url,{params:obj}).then(result=>{
                    //result 对象服务器返回结果
                    if(result.data.code == 1){
                    //跳转指定组件
                    this.$router.push("/Home");
                    }else{
                    this.$messagebox("消息",
                    result.data.msg);
                    }
                });
            }else{
                this.$messagebox("","请输入手机号码或邮箱！")
            }           
        }
    },
}
</script>
<style scoped>
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
        margin:0 50px;
    }
    /* 登录按钮样式 */
    .operateDiv>.myButton{
        margin:20px auto;
        width: 315px;
    }
    /* 其他登录方式/注册样式 span文字 */
    .otherDiv{
        display: flex;
        justify-content: space-between;
        margin:0 50px;
    }
</style>

