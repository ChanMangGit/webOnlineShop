<template>
    <!-- 商品子组件 -->
    <div class="container">
        <!-- 推荐 -->
        <div>
            <!-- 标题 -->
            <h2>精品推荐</h2>
            <!-- 商品信息 -->
            <div class="recommend" >
                <div class="recomendGoods" v-for="(item,index) of recommendGoods" :key="index">
                    <a href="#">
                        <div class="bg">
                            <!-- 推荐理由 -->
                            <div class="reason">
                                <p>{{item.reason}}</p>
                            </div>                        
                            <!-- 图片 -->
                            <img v-bind:src="`../../../static/img/${item.recommendurl}`" alt="">
                            <!-- 优惠详情 -->
                            <p>{{item.reasondetail}}</p>
                        </div>  
                        <!-- 标题 -->
                        <p class="title">{{item.recommendtitle}}</p>
                        <!-- 优惠价格和原价-->
                        <p class="price">
                            <span>¥{{item.recommendprice}}</span>
                            <span>¥{{item.delprice}}</span>
                        </p>
                    </a>
                </div>                   
            </div>
            <!-- 分隔线div -->
            <div class="separate"></div>
            <!-- 手机推荐 -->
            <!-- 标题 -->
            <h3>手机</h3>
            <div class="phone">
                <div class="phoneList" v-for="(item,index) of phones" :key="index">
                    <a href="#">
                        <!-- 图片 -->
                        <div class="imgBody">
                            <div class="pReason">
                                <p>{{item.pReason}}</p>
                            </div>                            
                            <img v-bind:src="`../../../static/img/${item.pUrl}`" alt="">
                            <div class="prDetail">
                                <p>{{item.prDetail}}</p>
                            </div>                           
                        </div>
                        <!-- 商品名 -->
                        <p class="title">{{item.pName}}</p>
                        <!-- 价格 -->
                        <p class="price">¥{{item.pPrice}}</p>
                    </a>
                </div>
            </div>
            <!-- 更多按钮 -->
            <button @click="phoneProduct()"><span>加载更多手机</span><img src="../../../static/img/down.png"></button>
            <!-- 分隔线div -->
            <div class="separate"></div>
            <!-- 电脑 -->
            <h3>笔记本</h3>
            <div class="laptop">
                <div class="laptopList" v-for="(item,index) of laptops" :key="index">
                    <a href="#">
                        <!-- 图片 -->
                        <div class="limgBody">
                            <div class="cReason">
                                <p>{{item.cReason}}</p>
                            </div>                            
                            <img v-bind:src="`../../../static/img/${item.cUrl}`" alt="">
                            <div class="crDetail">
                                <p>{{item.crDetail}}</p>
                            </div>                           
                        </div>
                        <!-- 商品名 -->
                        <p class="title">{{item.cName}}</p>
                        <!-- 价格 -->
                        <p class="price">¥{{item.cPrice}}</p>
                    </a>
                </div>
            </div>
            <!-- 更多按钮 -->
            <button @click="laptopProduct()"><span>加载更多电脑</span><img src="../../../static/img/down.png"></button>
            <!-- 占位div -->
            <div style="margin-bottom:80px;"></div>
        </div>

    </div>
</template>
<script>
export default {
    data(){
        return{
            // 保存服务器数据--推荐商品
            recommendGoods:[],
            // 保存服务器数据--手机
            phones:[],
            // 保存服务器数据--笔记本
            laptops:[],
            // 页码
            pno:0,
            // 页大小
            pageSize:4
        }
    },
    created() {
        this.recommendProduct();
        this.phoneProduct();
        this.laptopProduct();
    },
    methods:{
        // 推荐商品方法
        recommendProduct(){
            // 创建url
            var url="productRecommend";
            // 发送ajax
            this.axios.get(url).then(result=>{
                // console.log(result.data.data);
                this.recommendGoods=result.data.data;
            });
        },
        // 手机方法
        phoneProduct(){
            // 获取当前页面加1
            this.pno++;
            // 创建url
            var url="phone";
            // 创建参数对象
            var obj={pno:this.pno,pageSize:this.pageSize};
            // 发送ajax
            this.axios.get(url,{parms:obj}).then(result=>{
                // 拼接返回来的数组
                var rows=this.phones.concat(result.data.data);
                this.phones=rows;
            });
        },
        // 笔记本
        laptopProduct(){
            // 获取当前页面加1
            this.pno++;
            // 创建url
            var url="laptop";
            // 创建参数对象
            var obj={pno:this.pno,pageSize:this.pageSize};
            // 发送ajax请求
            this.axios.get(url,{parms:obj}).then(result=>{
                // 拼接返回来的数据
                var rows=this.laptops.concat(result.data.data);
                this.laptops=rows;
            });
        }
    },
    
}
</script>
<style scoped>
    .container{
        margin:0 2%;
    }
    h2{
        font-size: 18px;
        color: #444;
        background-color: #f0f0f0;
        margin-bottom: 0px;
    } 
    /* 分割线 */
    .separate{
        margin:0;
        width: 100%;
        height: 20px;
        background-color:#f9f9f9; 
    }
    /* 推荐商品样式 */
    .recommend{
        display: flex;
        justify-content: space-between;
        white-space: nowrap;
    }
    .recomendGoods{
        display: flex;
        flex-direction: column;
        width: 48%;
        box-sizing: border-box;
        
    }
    .recomendGoods a{
        text-decoration: none;
        
    }
    .recomendGoods img{
        width:100px;
        height:100px;
    }
    .reason{
        margin:0 auto;
        background-color: #FF6A6E;
        width: 40px;
        height: 20px;
        color: #fff;  
        margin-bottom: 5px;   
        border-radius: 5px;      
    }
    .reason p{
        text-align: center;
        transform:scale(0.7);
    }
    .bg{
        background-color: #f9f9f9;
        border-radius: 10px;
    }
    .bg>p{
        background-color: #f0f0f0;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        color:#9b9b9b;
        font-size: 12px;
        margin-bottom: 0;
    }
    .title{
        font-size: 12px;
        color:#333;
        margin: 5px 0;
    }
    .price{
        font-size: 13px;
        color: #ca141d;
        margin-top:0px;
    }
    span:last-child{
        color:#999;
        text-decoration:line-through;
    }
    /* 推荐样式end */
    /* 手机样式 */    
    .phone,.laptop{
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .phoneList,.laptopList{
        display: flex;
        flex-direction: column;
        width: 49%;
        box-sizing: border-box;
    }
    .phoneList>a,.laptopList>a{
        text-decoration: none;
    }
    .imgBody{
        position: relative;
    }
    .limgBody{
        position: relative;
        background-color: #f9f9f9;
        border-radius: 10px;
    }
    .pReason,.cReason{
        margin:0 auto;
        background-color: #FF6A6E;
        width: 40px;
        height: 20px;
        color: #fff;
        position: absolute;
        top:0px;
        left:50%;
        margin-left:-20px;
        border-radius: 3px;
    }
    .cReason{
        width:60px;
        margin-left:-30px;
    }
    .prDetail,.crDetail{
        background-color: rgba(0, 0, 0, 0.2);
        font-size: 12px;
        position: absolute;
        top:140px;
        left:3px;
        height: 25px;
        width: 170px;
        padding-top:5px;
        color: rgba(255, 255, 255, 0.9);
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .crDetail{
        background-color: rgba(155, 155, 155, 0.1);
        color:#9b9b9b;
        width: 176px;
        left:0;
        top:144px;
    }
    .pReason>p,.cReason>p{
        transform:scale(0.7);
        margin:0;
    }
    .prDetail>p,.crDetail>p{
        margin:0;
    }
    .imgBody img,.limgBody img{
        width: 170px;
        height: 170px;
        border-radius: 10px;
    }
    button{
        color:#FF6A6E;
        border:none;
        background-color:#fff;
        font-size:15px;
        margin-bottom: 10px;
        width:100%;
        display: flex;
        justify-content: center;
    }
    button>img{
        width:20px;
        height:20px;        
    }
</style>

