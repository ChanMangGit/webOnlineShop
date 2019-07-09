<template>
    <!-- 头部组件 -->
    <div class="container">
        <!-- 头部 固定定位-->
        <div class="head">
           <!-- 顶部搜索 -->
            <div class="page-head">
                <div class="LogoDiv">
                    <!-- 左侧logo -->
                    <img src="../../../static/img/logo_vmall.png" alt="" width="50px" height="15px">
                </div>
                <!-- 中间搜索框 输入框左侧有图片-->
                <div>
                    <!-- 搜索输入框 -->
                    <mt-search v-model="value"></mt-search>
                </div>
                <!-- 右侧图片+登录 -->
                <div class="headRight" @click="login">
                    <img src="../../../static/img/message.png" alt="" width="25px" height="25px">
                    <span id="login">登录</span>
                </div>
            </div>
                       
        </div>
    </div>
</template>
<script>

    
    
export default {
    data() {
        return {
            value:""
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
                var change=document.getElementById("login");
                // console.log(change);
                // console.log(uname);
                change.innerHTML=uname;
                // console.log(change.innerHTML);
            }
        }
    },
    mounted() {
        this.changeName();
    },
}


</script>
<style>
    .container{
        position: relative;
    }
    /* 头部大div */
    .head{
        position: fixed;
        width: 100%;
        height:50px;
        z-index: 999;
        background-color: #fafafa;
    }
    /* 设置头部 弹性*/
    .page-head{
        display: flex;
        justify-content: space-between;
        height:48px;   
        margin:0 1%; 
    }
    /* 头部左侧logo图片 */
    .LogoDiv>img{
        margin: 20px 0 0 8px;
    }
     /* 修改搜索框内放大镜图片 */
    .mintui-search:before{
        content: url("../../../static/img/search.png") !important;
    }
    /* 修改搜索框默认样式 */
    .mint-searchbar{
        background-color: #fafafa !important;
        border-radius: 15px;
    }
    .mint-search{
        height: 100% !important;
    }
    /* 头部右侧样式 */
    .headRight{
        display: flex;
        padding: 15px 8px 0 0;
        justify-content: space-between;
        white-space: nowrap; 
    }
    /* 头部右侧图片 */
    .headRight>img{
        margin-right:5px; 
    }
    /* 头部右侧文字 */
    .headRight>span{
        margin-top: 2px;
        color:#4c4c4c;
    }
</style>
