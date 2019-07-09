<template>
    <!-- 发现组件 -->
    <div class="container">
        <!-- 头部 -->
        <h1>发现频道</h1>
        <!-- 5个a标签跳转 -->
        <div class="firstJump">
            <a href="#"><img src="../../../static/img/headline.png"><p>商城公告</p></a>
            <a href="#"><img src="../../../static/img/companyBuy.png"><p>企业购</p></a>
            <a href="#"><img src="../../../static/img/fans.png"><p>粉丝互动</p></a>
            <a href="#"><img src="../../../static/img/video.png"><p>视频专区</p></a>
            <a href="#"><img src="../../../static/img/publicServer.png"><p>华为众测</p></a>
        </div>
        <!-- 商城头条 -->
        <div class="headLine">
            <span>商城头条</span>
            <a href="#"><p>声明</p><img src="../../../static/img/sigh.png"></a>
        </div>
        <!-- 5个图片a标签 -->
        <div class="secondJump">
            <a href="#"><img src="../../../static/img/news.png"></a>
            <a href="#"><img src="../../../static/img/playPhone.png"></a>
            <a href="#"><img src="../../../static/img/buyPhone.png"></a>
            <a href="#"><img src="../../../static/img/fans.jpg"></a>
            <a href="#"><img src="../../../static/img/photography.jpg"></a>
        </div>
        
        <!-- 图片 大标题 小标题 日期 阅读数    数据库读取-->
        <div class="news" v-for="(item,index) of findList" :key="index" @click="findDetail(item.findId,item.readCount)">
            <img v-bind:src="`../../static/img/${item.findUrl}`">
            <p class="findBTitle">{{item.findBTitle}}</p>
            <p class="findSTitle">{{item.findSTitle}}</p>
            <div class="findTime">
                <span>{{item.findDate|moment}}</span>
                <span>{{item.readCount}}&nbsp;阅读</span>
            </div>
        </div>
        <!-- 占位 -->
        <div style="margin-bottom:60px"></div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            findList:[]
        }
    },
    activated() {
        this.findLoad();
    },
    created() {
        this.findLoad();
    },
    methods: {
        // 数据加载
        findLoad(){
            var url="findLoad";
            this.axios.get(url).then(result=>{
                // console.log(result.data.data);
                this.findList=result.data.data;
            });
        },
        // 跳转到详情页
        findDetail(findId,readCount){
            this.$router.push({path:`/findDetails/${findId}`});           
            // console.log(readCount);
            var url="read";
            var obj={findId:findId,readCount:readCount};
            console.log(obj);
            this.axios.get(url,{params:obj}).then(result=>{
                console.log(result.data.msg);
            });
        }
    },
}
</script>
<style scoped>
    .container{
        margin: 0 2%;
    }
    /* 发现频道 商城头条样式 */
    h1{
        font-size: 18px;
        color:#191919;
    }
    .firstJump{
        display: flex;
        justify-content: space-around;
    }
    .secondJump{
        display: flex;
        justify-content: space-between;
        overflow-y:auto;
    }
    .firstJump img{
        width: 40px;
        height: 40px;
    }
    .secondJump img{
        width: 100px;
        height: 60px;
        padding:0 5px;
    }
    .firstJump a{
        text-decoration: none;
    }
    .firstJump p{
        font-size: 12px;
        color: #9b9b9b;
        margin-top:0;
    }
    .headLine{
        display: flex;
        justify-content: space-between;
        margin-left: 40%;
        margin-top:10px;
    }
    .headLine>span{
        font-size: 18px;
        color: #333333;
    }
    .headLine a{ 
        display: flex;
        text-decoration: none;
        font-size: 12px;
        color: #999999;  
        margin-right: 2%;
        margin-top:5px;
    }
    .headLine p{
        margin-top:0px;
    }
    .headLine img{
        width: 15px;
        height: 15px;
    }
    /* 发现频道 商城头条样式end */
    /* 大图片跳转 */
    .news{
        margin-top: 10px;
    }
    .news>img{
        width: 100%;
        height: 150px;
        border-radius: 10px;
    }
    .findBTitle{
        color:#333333;
        font-size: 15px;
        text-align: left;
        margin:10px 0 0 0;
    }
    .findSTitle{
        color:#666666;
        font-size:12px;
        text-align: left;
        margin:5px 0 0 0;
    }
    .findTime{
        display: flex;
        justify-content: space-between;
        margin-top:5px;
        color:#999;
        font-size: 12px;
    }
</style>

