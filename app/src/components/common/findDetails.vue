<template>
    <!-- 发现 详情页 -->
    <div class="container">
        <!--头部固定定位 -->
        <div class="findHead">
            <!-- 左侧返回按钮图片 -->
            <div class="headImg" @click="returnFind">
                <img src="../../../static/img/leftArrow.png">
            </div>
            <h1>商城头条</h1>
        </div>
        <div  v-for="(item,index) of data" :key="index">
            
            <!-- 大标题 -->
            <p class="bigTitle">{{item.findBTitle}}</p>
            <!-- 日期 -->
            <div class="time">
                <img src="../../../static/img/onlineshop.png">
                <p class="onlineP" @click="toHome">在线商城</p>
                <p class="fansP">粉丝互动</p>
                <p class="timeP">{{item.findDate|moment}}</p>
            </div>
            <!-- 小标题 -->
            <div class="STbg">
               <p class="smallTitle">{{item.findSTitle}}</p> 
            </div>           
            <!-- 图片 -->
            <img class="bodyImg" v-bind:src="`../../static/img/${item.findUrl}`">
        </div>
        
    </div>
</template>
<script>
export default {
    props:{
        "findId":{type:String}
    },
    data() {
        return {
            // list:{},
            data:[]
        }
    },
    mounted() {
        // let that=this;
        var url="findDetail";
        // console.log(this.findId);
        var obj={findId:this.findId};
        console.log(obj);
        this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data.data);
            this.data=result.data.data;
        })
    },
    methods: {
        // 返回上一页
        returnFind(){
            this.$router.back();
        },
        // 跳转到主页
        toHome(){
            this.$router.push("/Home");
        }
    },
    beforeRouteLeave (to, from, next) {
        to.meta.keepAlive=true
        next()
    }

}
</script>
<style scoped>
    /* 头部样式 */
    .findHead{
        display: flex;
        justify-content:center;  
        background-color: #f5f5f5;    
        width: 100%;
    }
    .headImg>img{
        margin-top:8px;
        margin-left:5px;
        margin-right:120px;
        width:30px;
        height: 30px;
    }
    .findHead>h1{
        font-size: 19px;
        color:#191919;
        margin-right:38%;
    }
    /* 头部样式end */
    /* 大标题 */
    .bigTitle{
        color:#2e2e2e;
        font-size:18px;
        text-align: left;
        margin:10px 4%;
    }
    /* 日期 */
    .time{
        display: flex;
        justify-content: space-between;
        width: 60%;
        font-size: 12px;
    }
    .time>img{
        width: 25px;
        height: 25px;
        margin:6px 0 0 10px;
    }
    .onlineP{
        color: #337ab7;
        
    }
    .fansP,.timeP{
        color: #888;
    }
    .timeP{
        margin-top:14px;
    }
    /* 日期end */
    /* 小标题 */
    .STbg{
        background-color: #f6f6f6;
        height:30px;
        margin:0 4%;
        padding-top:5px; 
    }
    .smallTitle{
        color: #888;
        font-size: 14px;
        text-align: left;
        margin: 0;
    }
    .bodyImg{
        width: 100%;
    }
</style>
