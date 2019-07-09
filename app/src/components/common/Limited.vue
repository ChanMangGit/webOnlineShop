<template>
    <!-- 限时购组件 -->
    <div class="container">
        <div>
            <span class="firstSpan">限时购</span>
            <img src="../../../static/img/lightning.png" alt="">
            <!-- 倒计时 -->
            <span class="secondSpan">{{date}}天{{hour}}:{{minute}}:{{second}}</span>
            <span class="thirdSpan">后结束</span> 
        </div>
        <!-- 限时抢购商品列表 -->
        <div class="goodsList">
            <div v-for="(item,index) of product" :key="index">
            <a href="#">
                <img v-bind:src="`../../../static/img/${item.pcurl}`" style="width:60px;height:60px;"/>
                <h4>{{item.title}}</h4>
                <h5>{{item.goodsDesc}}</h5>
            </a>
            </div>
        </div>
        
    </div>
</template>
<script>
export default {
    data() {
        return {
            date:"",
            hour:"",
            minute:"",
            second:"",
            product:""  //保存服务器数据
        }
    },
    methods: {
        // 倒计时
        countTime(){
            // 获取当前时间
            var date=new Date();
            var now=date.getTime();
            // 设置截止时间
            var endDate=new Date("2019-8-1 23:59:59");
            var end=endDate.getTime();
            // 时间差
            var time=end-now;
            // 定义变量date,hour,minute,second
            if(time>=0){
                this.date=Math.floor(time/1000/60/60/24);
                this.hour=Math.floor(time/1000/60/60%24);
                this.minute=Math.floor(time/1000/60%60);
                this.second=Math.floor(time/1000%60);
                this.date=this.date<10?"0"+this.date:this.date;
                this.hour=this.hour<10?"0"+this.hour:this.hour;
                this.minute=this.minute<10?"0"+this.minute:this.minute;
                this.second=this.second<10?"0"+this.second:this.second;
            }
            // 递归每秒调用countTime方法，显示动态时间效果
            setTimeout(this.countTime,1000)
        },
        // 加载商品数据
        loadProduct(){
            // 创建url请求地址
            var url="limited";
            // 发送ajax
            this.axios.get(url).then(result=>{
                this.product=result.data.data;
            })
        }
    },
    created() {
        this.countTime();
        this.loadProduct();
    },
}
</script>
<style scoped>
    .container{
        background-color: #fafafa;
    }
    .firstSpan{
        font-size: 18px;
        color:#4d4d4d;
    }
    .secondSpan{
        font-size: 20px;
        color: #4d4d4d;
    }
    .container>img{
        margin-top: 2px;
    }
    .thirdSpan{
        font-size: 12px;
        color: #9b9b9b;
    }
    /* 限时抢购商品列表样式 */
    .goodsList{
        display: flex;
        justify-content: space-between;
        white-space: nowrap;
        margin:5px 2%;
    }
    .goodsList a{
        text-decoration: none;
        font-size: 12px;
        color:#999999;
    }
    .goodsList a>h4{
        margin-top:0;
        margin-bottom: 2px;
    }
    .goodsList a>h5{
        margin-top:0;
        color:#ca141d;
    }
</style>
