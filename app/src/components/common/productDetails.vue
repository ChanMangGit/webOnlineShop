<template>
    <!-- 商品详情页 -->
    <div class="container">
        <!-- 头部返回按钮 固定定位 滑动隐藏和显示-->
        <div class="detailHead">
            <!-- 默认显示，滑动隐藏 -->
            <div class="displayHead" v-show="display">
                <img src="../../../static/img/leftArrow.png" @click="$router.back(-1)">
                <img src="../../../static/img/ellipsis.png">
            </div>
            <!-- 默认隐藏，滑动显示 -->
            <div class="hideHead" v-show="hide">
                <img src="../../../static/img/leftArrow.png" @click="$router.back(-1)">
                <p>商品</p>
                <p>评价</p>
                <p>参数</p>
                <p>详情</p>
                <img src="../../../static/img/ellipsis.png">
            </div>
        </div>
        <!-- 轮播图 -->
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="(item,index) of picList" :key="index">
                <img v-bind:src="`../../../static/img/${item.picUrl}`" style="width:100%;height:100%"/>        
            </mt-swipe-item>            
        </mt-swipe> 
        <!-- 根据按钮数据的商品id显示其他数据 -->
        <div v-for="(item,index) of productList" :key="index">
            <!-- 价格 -->
            <div class="productPrice">
                <p>¥{{item.price}}</p>
            </div>
            <!-- 大标题 -->
            <div class="title">
                <p>{{item.title}}</p>
            </div>
            <!-- 小标题 -->
            <div class="subtitle">
                <p>{{item.subtitle}}</p>
            </div>
            <!-- 分割线 -->
            <hr style="margin:0 3%" color="#dbdbdb" size="1px">
            <!-- 促销 -->
            <div class="promotion">
                <!-- 左侧文字 -->
                <p>促销</p>
                <!-- 右侧 -->
                <div class="promotionRight">
                    <!-- promotionRightLeftP -->
                    <div class="promotionRLP">
                        <p>整点赠送</p>
                        <p>分期免息</p>
                        <p>赠送积分</p>
                    </div>
                    <!-- promotionRightRightP -->
                    <div class="promotionRRP">
                        <p>{{item.promotion1}}</p>
                        <p>{{item.promotion2}}</p>
                        <p>{{item.promotion3}}</p>                       
                    </div>
                </div>
            </div>
            <!-- 分隔 -->
            <hr size="10px" style="background-color:#dbdbdb;border:none">
            <!-- 规格 -->
            <div class="spec">
                <!-- 左侧文字 -->
                <p>版本</p>
                <!-- 右侧 按钮 -->
                <div class="specBtn">
                    <div v-for="(item2,index2) of productSpec" :key="index2" class="btnBorder" :class="active==index2 ? 'activeClass' : ''">
                        <div @click="loadProduct(item2.productId,index2)" >{{item2.spec}}</div>    
                    </div>
                </div>               
            </div>            
            <!-- 数量 -->
            <div class="buyCount">
                <p>数量</p>
                <div class="numBtn">
                    <div @click="sub" class="sub">
                        <img src="../../../static/img/sub.png">
                    </div>
                    <div class="num">{{number}}</div>
                    <div @click="add" class="add">
                        <img src="../../../static/img/add.png">
                    </div>
                </div>
            </div>
            <!-- 分割线 -->
            <hr style="margin:0 3%" color="#dbdbdb" size="1px">
            <!-- 保障 -->
            <div class="protection">
                <p>保障</p>
                <div>
                    {{item.promise}}
                </div>               
            </div>

            <!-- 占位55px -->
            <div style="height:55px;"></div>
            <!-- 底部导航栏 固定定位 4个按钮-->
            <mt-tabbar fixed>
                <div class="leftBar">
                    <!-- 返回主页 -->
                    <div class="foot">
                        <img src="../../../static/img/home_normal.png">
                        <p>主页</p>
                    </div>
                    <!-- 客服 -->
                    <div class="foot">
                        <img src="../../../static/img/chat.png">
                        <p>客服</p>
                    </div>
                    <!-- 购物车 -->
                    <div class="foot" @click="jumpCart">
                        <img src="../../../static/img/cart_normal.png" alt="">
                        <p>购物车</p>
                    </div>
                </div>
                
                <div class="rightBuy">
                    <!-- 加入购物车 -->
                    <div class="addCart" @click="addCart(item.productUrl,item.price,number,item.title,item.spec)">
                        <p>加入购物车</p>
                    </div>
                    <!-- 立即购买 -->
                    <div class="immediately">
                        <p>立即购买</p>
                    </div>
                </div>           
            </mt-tabbar>
        </div>
    </div>
</template>
<script>
export default {
    props:{
        "fid":{type:String}
    },
    data() {
        return {
            // 头部显示
            display:true,
            // 头部隐藏
            hide:false,
            // 规格按钮默认选中第一个
            active:0,
            // 购买数量默认为1
            number:1,
            // 保存数据库返回来的数据
            productList:[],
            picList:[],
            productSpec:[]
        }
    },
    created() {
        // 页面滚动时触发
        window.addEventListener("scroll",this.scroll,true);
        // this.active=0;
    },
    methods: {
        // 判断页面是否滚动
        scroll(){
            // 获取页面滚动高度
            let scrollHeight=document.documentElement.scrollHeight||document.body.scrollHeight
            // 获取页面滚动距离顶部的高度
            let scrollTop=document.documentElement.scrollTop||window.pageYOffset||document.body.scrollTop
            if(scrollHeight!=0){
                this.display=false;
                this.hide=true;
            }
            if(scrollTop==0){
                this.display=true;
                this.hide=false;
            }
        },
        // 加载商品信息 product表
        loadProduct(productId,index2){
            var obj={productId:productId};
            var url="selectSpec";
            this.axios.get(url,{params:obj}).then(result=>{
                this.productList=result.data.data;
            });
            this.active=index2;
        },
        // 购买数量减少按钮
        sub(){
            this.number=this.number>1?this.number-1:1;
        },
        // 购买数量增加按钮
        add(){
            this.number++;
        },
        // 加入购物车
        addCart(productUrl,price,number,title,spec){
            // 获取是否登录
            var uid=sessionStorage.getItem("uid");
            // 如果存在uid则保存在购物车中，否则跳转登录
            if(uid){
                var url="addCart";
                var obj={uid:uid,productUrl:productUrl,price:price,number:number,title:title,spec:spec};
                this.axios.get(url,{params:obj}).then(result=>{
                   this.$toast("加入成功"); 
                })               
                // console.log(obj);
            }else{
                this.$messagebox('消息','请先登录');
                this.$router.push("/Login");
            }
    
        },
        // 跳转到主页
        jumpCart(){
            this.$router.push("")
        }
    },
    beforeRouteLeave (to, from, next) {
        to.meta.keepAlive=true
        next()
    },
    mounted() {
        var url="productDetail";
        var obj={fid:this.fid};
        // console.log(obj);
        // prduct 表
        this.axios.get(url,{params:obj}).then(result=>{
            // console.log(result.data.data);
            this.productList=result.data.data;
        });
        // 加载图片
        this.axios.get("detailPic",{params:obj}).then(result=>{
            this.picList=result.data.data;
        });
        // 商品版本信息
        this.axios.get("productSpec",{params:obj}).then(result=>{
            this.productSpec=result.data.data;
        });
    },
    destroyed() {
        // 页面谢再师移除监听事件
        window.removeEventListener("scroll",this.scroll,true)
    },
}
</script>
<style scoped>
    .container{
        position: relative;
    }
    /* 头部样式 */
    .detailHead{
        position: fixed;
        z-index: 999;
        width: 100%;
    }
    .detailHead img{
        width: 25px;
        height: 25px;
        margin:15px 2%;
    }
    .displayHead{
        display: flex;
        justify-content: space-between;        
    }
    .displayHead>img{
        background-color: #eaeaea ;
        border-radius: 50%;
    }
    .hideHead{
        display: flex;
        justify-content: space-between;
        background-color: #fff;
    }
    /* 轮播图样式 */
    .mint-swipe{
        height: 350px;
    }
    /* 价格 */
    .productPrice>p{
        text-align: left;
        font-size: 20px;
        color: #ca141d;
        margin:20px 0 0 3%; 
    }

    /* 大标题 */
    .title{
        font-size: 16px;
        color:#333;
        font-weight:800;      
    }
    .title>p{
        margin:15px 3% 5px 3%;
    }
    /* 小标题 */
    .subtitle{
        font-size: 12px;
        color: #ca141d;       
    }
    .subtitle>p{
        margin: 0 3% 10px 3%;
    }
    /* 促销 */
    .promotion{
        display: flex;
        justify-content:space-between;
        padding-right: 10%;
    }
    .promotionRight{
        display: flex;
        justify-content: space-between;
    }
    .promotionRLP>p{
        width: 60px;
        font-size: 12px;
        color: #ef5a62;
        border: 1px solid #ef5a62;
        border-radius: 5px;       
    }
    .promotionRRP>p{
        font-size: 12px;
        color: #333;
        text-align: left;
        margin-left: 4px;
    }
    .promotionRRP>p:nth-child(2){
        margin-top:15px;
    }
    /* 版本 */
    .spec{
        display: flex;
        justify-content: space-between;      
    }
    .spec>p,.promotion>p,.buyCount>p,.protection>p{
        width: 50px;
        color: #888;
        font-size: 12px;
    }
    .specBtn{
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        color:#333;
        font-size: 12px;
        text-align: center;
        padding: 5px;      
    }
    .btnBorder{
        border: 1px solid #dbdbdb;
        border-radius: 20px;
        width: 40%;
        margin-top: 5px;
        height:25px;
        padding: 0 15px;
    }
    .btnBorder div{
        margin-top: 4px;
    }
    /* 选中的样式 */
    .activeClass{
        color:#ca151e;
        border: 1px solid #ca151e;
    }
    /* 购买数量 */
    .buyCount{
        display: flex;
        justify-content: space-between;
        padding-right: 65%;
    }
    .numBtn{
        display: flex;
        margin-top:10px; 
    }
    .num{
        width:25px;
        height:25px;
        margin-top:5px;
    }
    .sub>img,.add>img{
        width: 25px;
        height: 25px;
    }   
    /* 保障 */
    .protection{
        display:flex;
        justify-content: space-between;
        padding-right:65%; 
    }
    .protection>div{
        color: #333;
        font-size: 12px;
        margin-top: 13px;
    }
    /* 底部导航栏 */
    .mint-tabbar{
        display: flex;
        justify-content: space-between;
        height:50px;
        width: 100%;
    }
    .mint-tabbar img{
        width: 30px;
        height: 30px;
    }
    .leftBar{
        display: flex;
        justify-content: space-around;
        width: 50%;
    }
    .foot{
        display: flex;
        flex-direction: column;
        font-size: 12px;
    }
    .foot>p{
        margin:0;
    }
    .mint-tabbar .rightBuy{
        display: flex;
        justify-content: space-around;
        width: 50%;
        margin:5px 0;
        margin-right: 3%;
    }
    .addCart{
        width: 50%;
        background:linear-gradient(left,#ff7f49 0%,#f55634 100%);
        border-top-left-radius:15px;
        border-bottom-left-radius: 15px; 
        color:#fff;
    }
    .immediately{
        width: 50%;
        background:linear-gradient(left,#e23a2c 0%,#cc161e 100%);
        border-top-right-radius:15px;
        border-bottom-right-radius: 15px; 
        color:#fff;
    }
    .addCart>p,.immediately>p{
        margin:8px 0px;
    }
</style>

