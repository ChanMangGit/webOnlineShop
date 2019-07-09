<template>
    <!-- 分类页面组件 -->
    <div class="container">
        <!-- 头部 -->
        <sorthead fixed></sorthead>        
        <!-- 导航 -->
        <div class="nav">            
            <mt-navbar class="page-part" v-model="selected">
                <mt-tab-item id="propose"><p>为您推荐</p></mt-tab-item>
                <mt-tab-item id="huaweiP"><p>华为手机</p></mt-tab-item>
                <mt-tab-item id="rongyaoP"><p>荣耀手机</p></mt-tab-item>
                <mt-tab-item id="computer"><p>笔记本&平板</p></mt-tab-item>
                <mt-tab-item id="wear"><p>智能穿戴</p></mt-tab-item>
                <mt-tab-item id="smartHome"><p>智能家居</p></mt-tab-item>
                <mt-tab-item id="EXfitting"><p>专属配件</p></mt-tab-item>
                <mt-tab-item id="COfitting"><p>通用配件</p></mt-tab-item>
                <mt-tab-item id="ecology"><p>生态产品</p></mt-tab-item>
                <mt-tab-item id="service"><p>增值服务</p></mt-tab-item>
                <mt-tab-item id="calc"><p>智能计算</p></mt-tab-item>
            </mt-navbar>
            <!-- tabcontainer -->
            <mt-tab-container v-model="selected" class="tabcontainer">              
                <!-- 推荐按钮 -->
                <mt-tab-container-item id="propose">
                    <p>华为手机按钮跳转详情</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="huaweiP">
                    <!-- 标题 -->
                    <h3>HUAWEI P系列</h3>
                    <!-- 图片加文字 跳转到详情 -->
                    <div class="secondNav">
                        <div class="imgP" v-for="(item,index) of productNames" :key="index" @click="productDetails(item.fid)">
                            <img class="imgNav" v-bind:src="`../../../static/img/${item.picURL}`">
                            <!-- 文字 商品名 -->
                            <p class="textNav">{{item.name}}</p>
                        </div>
                    </div>
                    <h3>HUAWEI Mate系列</h3>
                </mt-tab-container-item>
                <mt-tab-container-item id="rongyaoP">
                    <p>荣耀手机</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="computer">
                    <p>笔记本&平板</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="wear">
                    <p>智能穿戴</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="smartHome">
                    <p>智能家居</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="EXfitting">
                    <p>专属配件</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="COfitting">
                    <p>通用配件</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="ecology">
                    <p>生态产品</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="service">
                    <p>增值服务</p>
                </mt-tab-container-item>
                <mt-tab-container-item id="calc">
                    <p>智能计算</p>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
    </div>
</template>
<script>
import SortHead from "./SortHead"
export default {
    data() {
        return {
            selected:"huaweiP",
            // 保存商品名
            productNames:[],
        }
    },
    created() {
        this.loadNames()
    },
    methods: {
        // 加载商品名
        loadNames(){
            var url="loadName";
            this.axios.get(url).then(result=>{
                if(result.data.code==1){
                    this.productNames=result.data.data;
                }else{
                    console.log("获取数据失败");
                }
            })
        },
        // 跳转
        productDetails(fid){       
            // history.pushState(null,null,`/productDetails/${fid}`);
            // history.replaceState(null, null, `/productDetails/${fid}`);
            this.$router.push({path:`/productDetails/${fid}`});
        }
    },
    components:{
        "sorthead":SortHead
    }
}
</script>
<style scoped>
    .nav{
        display: flex;
        justify-content:left;
        margin: 0 2%;
    }
    
    /* 修改mt-navbar默认样式 */
    /* 导航取消弹性 */
    .mint-navbar{
        display: inline-block;
        width:105px;
    }
    /* 按钮选中字体颜色 */
    .mint-navbar .mint-tab-item.is-selected{
        color:#e01d20;
        background-color: #f5f5f5;
        border-bottom: none;
    }
    /* 按钮默认 */
    .mint-navbar .mint-tab-item{
        padding: 2px 0;
        height: 40px;
        text-align: left;
        padding-left:15px; 
    }
    /* 按钮字体大小 */
    .page-part>>>.mint-tab-item-label{
       font-size:15px; 
    }
    .mint-navbar .mint-tab-item.is-selected>>>.mint-tab-item-label{
        border-right: 3px solid #e01d20;
    }
    /* tabcontainer样式 */
    .tabcontainer{
        width: 100%;
    }
    .tabcontainer>>> h3{
        font-size: 15px;
        color: #333;
        text-align: center;
    }
    .secondNav{
        display: flex;
        justify-content: space-between; 
        flex-wrap:wrap;
    }
    .imgP{
        width: 33%;
    }
    .imgNav{
        width: 50px;
        height: 50px;
    }
    .textNav{
        color: #666;
        font-size: 12px;
    }
</style>
