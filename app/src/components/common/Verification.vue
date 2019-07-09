<template>
    <!-- 验证码组件 -->
    <div class="container">
        <!-- 输入框和验证码生成 -->
        <div class="vBody">
            <!-- 输入框 -->
            <input type="text" placeholder="请输入验证码" v-model="inputCode" class="inputcode" maxlength="4" style="border:none;outline:none;font-size:inherit;">
            <!-- 验证码生成 -->
            <input type="button" v-model="checkCode" class="verification" @click="createCode">
        </div>
    </div>
</template>
<script>
var code="";
export default {
    
    data() {
        return {
            checkCode:"",
            inputCode:""
        }
    },
    methods: {
        // 生成验证码
        createCode(){
            // 先清空验证码输入
            this.code="";
            this.checkCode="";
            this.inputCode="";
            // 验证码长度
            var codeLength=4;
            // 随机数数组
            var random=new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            // 创建循环
            for(var i=0;i<codeLength;i++){
                // 获得随机数索引(0~35)
                var index=Math.floor(Math.random()*36);
                // 把取得的随机数累加到code上
                this.code+=random[index];
            }
            // 把code值赋给验证码
            this.checkCode=this.code;
        },
        check(){
            if(this.inputCode !=this.checkCode){
                this.$toast("验证码输入不正确");
                return;
            }
        }
    },
    // 组件刷新自动调用方法
    mounted() {
        this.createCode();
    },
}
</script>
<style scoped>
    .container>.vBody{
        display: flex;
        justify-content: space-between;
        margin:5px 0;
        border-bottom: 1px solid #ff5000;
        width: 265px;
        padding: 0 10px;
    }
    .vBody>.inputCode{
        color: #fff;
        outline: none;
        border-radius: 12px;
        letter-spacing: 1px;
        font-size: 17px;
        font-weight: normal;
        background-color: rgba(82, 56, 76, 0.15);
        padding: 5px 0 5px 10px;
        height: 30px; 
        width:50px;
         /* outline:none;  */
        /* margin-top: 25px; */

    }
    .vBody>.verification{
        border-radius: 12px;
        width:80px;
        letter-spacing:5px;
        margin-left: 20px; 
        height: 40px;
        transform: translate(-15px,0);
        outline:none;
    }
</style>

