<template>
    <!-- 我的页面组件 -->
    <div class="container">
        <!-- 头部红色背景 -->
        <div class="meHead">
            <!-- 头部右侧2张图片 -->
            <div class="headImg">
                <img src="../../../static/img/meSet.png">
                <img src="../../../static/img/meMsg.png">
            </div>
            <!-- 头像 登录 -->
            <div class="avatarLogin">
                <img src="../../../static/img/avatar.png">
                <div class="meLogin">
                    <!-- 登录按钮 -->
                    <div class="meLoginBtn" @click="login">
                        <span id="loginr">登录/注册</span>
                    </div>
                    <div class="sign">
                        <img src="../../../static/img/sign.png" alt="">
                        <p>签到领积分</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
    activated() {
        this.changeName();
    },
    methods: {
        // 跳转到登录组件
        login(){
            this.$router.push("/Login")
        },
        changeName(){
            // 获取登录判断条件
            var uname=sessionStorage.getItem("uname");
            if(uname){
                var change=document.getElementById("loginr");
                change.innerHTML=uname;
            }
        }
    },
    mounted() {
        this.changeName();
    },
}
</script>
<style scoped>
    .meHead{
        width: 100%;
        height: 200px;
        background-color: #e1282e;
        border-bottom-left-radius: 25px;
        border-bottom-right-radius: 25px;
        position: relative;
    }
    .headImg{
        display: flex;
        justify-content: space-between;
        width: 70px;       
        margin-left: 80%;
    }
    .headImg>img{
        width:30px;
        height:30px;
        margin-top: 5px;
    }
    /* 头像和登录按钮 */
    .avatarLogin{
        display: flex;
        width: 180px;
        justify-content: space-between;
        margin-left: 5%;
    }
    .avatarLogin>img{
        width: 69px;
        height: 69px;
    }
    .meLogin{
        display: flex;
        flex-direction: column;
    }
    .meLoginBtn>span{
        color: #fff;
        font-size: 23px;
        width: 100px;
        margin-bottom: 5px;
    }
    .sign{
        font-size: 13px;     
        color: #fff;  
        display: flex;
        width: 82px;
        justify-content: space-between;
    }
    .sign>p{
        margin: 0px;
    }
    .sign>img{
        width: 15px;
        height: 15px;
    }
</style>
