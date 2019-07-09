<template>
    <!-- 三级导航栏组件 -->
    <div class="container">
        <!-- 官方商城 正品保证 售后无忧 -->
        <div class="promise">
            <div>
                <img src="../../../static/img/promise.png" alt="">
                <p>官方商城</p> 
            </div>
            <div>
                <img src="../../../static/img/promise.png" alt="">
                <p>正品保证</p> 
            </div>
            <div>
                <img src="../../../static/img/promise.png" alt="">
                <p>售后无忧</p> 
            </div>            
        </div>
        <!-- 邀请有礼 会员领劵 ... -->
        <div class="welfare">
            <a href="#">
                <img src="../../../static/img/invite.png" alt="">
                <p>邀请有礼</p>
            </a>
            <a href="#">
                <img src="../../../static/img/vip.png" alt="">
                <p>会员领劵</p>
            </a>
            <a href="#">
                <img src="../../../static/img/phone20.png" alt="">
                <p>荣耀 20</p>
            </a>
            <a href="#">
                <img src="../../../static/img/exchange.png" alt="">
                <p>以旧换新</p>
            </a>
            <a href="#">
                <img src="../../../static/img/new.png" alt="">
                <p>新品众测</p>
            </a>
            
        </div>
     </div>               
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {        
    },
    // 注册组件
    components:{        
    }
}
</script>
<style scoped>
    /* 承诺样式 */
    .promise{
        display: flex;
        justify-content: space-between;
        padding:0 20px;
        color:#b7b7b7;
        font-size: 10px;
        margin-top:10px;
    }
    .promise>div{
        display: flex;
    }
    .promise>div>img{
        width: 20px;
        height: 20px;
        margin-top: 0px;
    }
    .promise>div>p{
        color:#bbbbbb;
        margin-top:0px; 
        font-size: 15px;
    }
    .welfare{
        display: flex;
        justify-content: space-between;
        padding: 0 8px;
        
    }
    .welfare>a{
        display: flex;
        flex-direction: column;
        font-size: 13px;
        color:#9b9b9b;
        text-decoration: none;
    }
    .welfare>a>img{
        width: 45px;
        height: 45px;
    }
    .welfare>a>p{
        margin-top:3px;
    }
    
</style>
