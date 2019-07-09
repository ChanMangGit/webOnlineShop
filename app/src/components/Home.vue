<template>
    <!-- 主页 -->
    <div class="container">
        <!-- 切换面板 -->
        <mt-tab-container v-model="active">
            <!-- 主页 -->
            <mt-tab-container-item id="home">
                <!-- 头部导航栏 -->
                <titlebar></titlebar>
                <!-- 占位div -->
                <div style="margin-top:50px"></div>
                <!-- 二级导航栏 -->
                <div class="secondNav">
                    <mt-navbar class="page-part" v-model="selected">
                        <mt-tab-item id="recommend"><p>推荐</p></mt-tab-item>
                        <mt-tab-item id="huawei"><p>华为</p></mt-tab-item>
                        <mt-tab-item id="rongyao"><p>荣耀</p></mt-tab-item>
                        <mt-tab-item id="new"><p>新品</p></mt-tab-item>
                        <mt-tab-item id="benefit"><p>数码惠</p></mt-tab-item>
                    </mt-navbar>
                              
                    <!-- tabcontainer -->
                    <mt-tab-container v-model="selected">
                        <!-- 推荐按钮 -->
                        <mt-tab-container-item id="recommend">
                            <!-- 占位div -->
                            <div style="margin-top:58px"></div>
                            <!-- 轮播图子组件 -->
                            <slide></slide>
                            <!-- 三级导航子组件 -->
                            <thirdnav></thirdnav>
                            <!-- 商城头条 轮播文字 -->
                            <slidetext></slidetext>
                            <!-- 倒计时 -->
                            <limited></limited>
                            <!-- 商品 -->
                            <product></product>
                        </mt-tab-container-item>
                        <mt-tab-container-item id="huawei">
                            <!-- 占位div -->
                            <div style="margin-top:58px"></div>
                            <p>华为</p>
                        </mt-tab-container-item>
                        <mt-tab-container-item id="rongyao">
                            <!-- 占位div -->
                            <div style="margin-top:58px"></div>
                            <p>荣耀</p>
                        </mt-tab-container-item>
                        <mt-tab-container-item id="new">
                            <!-- 占位div -->
                            <div style="margin-top:58px"></div>
                            <p>新品</p>
                        </mt-tab-container-item>
                        <mt-tab-container-item id="benefit">
                            <!-- 占位div -->
                            <div style="margin-top:58px"></div>
                            <p>数码惠</p>
                        </mt-tab-container-item>
                    </mt-tab-container>
                </div>
                
                
                
            </mt-tab-container-item>
            <!-- 分类 -->
            <mt-tab-container-item id="sort">
                <!-- 分类 -->
                <sort></sort>               
            </mt-tab-container-item>
            <!-- 发现 -->
            <mt-tab-container-item id="find">
                <find></find>
            </mt-tab-container-item>
            <!-- 购物车 -->
            <mt-tab-container-item id="cart">
                <cart></cart>
            </mt-tab-container-item>
            <!-- 我的 -->
            <mt-tab-container-item id="me">
                <me></me>
            </mt-tab-container-item>
        </mt-tab-container>

        <!-- tabbar组件 底部导航栏 -->
        <!-- 为每个按钮绑定点击事件 -->
        <!-- 当前按钮isSelect:true -->
        <!-- 其他按钮isSelect:false -->
        <mt-tabbar v-model="active" fixed class="tabbar">
            <!-- 首页按钮 -->
            <mt-tab-item id="home" @click.native="changeState(0)">
                <!-- 自定义底部导航栏组件 -->
                <tabbaricon 
                :selectedImage="require('../../static/img/home_selected.png')"
                :normalImage="require('../../static/img/home_normal.png')"
                :focused="currentIndex[0].isSelect" ></tabbaricon>
                首页
            </mt-tab-item>
            <!-- 分类按钮 -->
            <mt-tab-item id="sort" @click.native="changeState(1)">
                <tabbaricon
                :selectedImage="require('../../static/img/sort_selected.png')"
                :normalImage="require('../../static/img/sort_normal.png')"
                :focused="currentIndex[1].isSelect"
                ></tabbaricon>
                分类
            </mt-tab-item>
            <!-- 发现按钮 -->
            <mt-tab-item id="find" @click.native="changeState(2)">
                <tabbaricon
                :selectedImage="require('../../static/img/find_selected.png')"
                :normalImage="require('../../static/img/find_normal.png')"
                :focused="currentIndex[2].isSelect"
                ></tabbaricon>
                发现
            </mt-tab-item>
            <!-- 购物车按钮 -->
            <mt-tab-item id="cart" @click.native="changeState(3)">
                <tabbaricon
                :selectedImage="require('../../static/img/cart_selected.png')"
                :normalImage="require('../../static/img/cart_normal.png')"
                :focused="currentIndex[3].isSelect"
                ></tabbaricon>
                购物车
            </mt-tab-item>
            <!-- 我的按钮 -->
            <mt-tab-item id="me" @click.native="changeState(4)">
                <tabbaricon
                :selectedImage="require('../../static/img/me_selected.png')"
                :normalImage="require('../../static/img/me_normal.png')"
                :focused="currentIndex[4].isSelect"
                ></tabbaricon>
                我的
            </mt-tab-item>
        </mt-tabbar>   
    </div>
</template>
<script>
// 头部导航栏
import TitleBar from "./common/TitleBar"
// 轮播图
import Slide from "./common/Slide"
// 三级导航栏
import ThirdNav from "./common/ThirdNav"
// 轮播文字
import SlideText from "./common/SlideText"
// 倒计时
import Limited from "./common/Limited"
// 商品组件
import Product from "./common/Product"
// 分类组件
import Sort from "./common/Sort"
// 发现组件
import Find from "./common/Find"
// 购物车
import Cart from "./common/Cart"
// 我的
import Me from "./common/Me"
// 引入底部导航栏子组件
import TabBarIcon from "./common/TabBarIcon"

export default {
    data() {
        return {
            // 默认选中主页
            active:"home",
            // 默认选中推荐页面
            selected:"recommend",
            //创建数组保存图片焦点状态--底部导航栏
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false}
            ] 
        }
    },
    
    methods: {
        changeState(n){
            // 函数功能：将当前参数下标对应数值修改true，其他修改false
            // 创建循环，循环数组中内容
            for(var i=0;i<this.currentIndex.length;i++){
                 // 判断如果循环下标与n相等
                 if(n==i){
                    // 当前下边元素true
                    this.currentIndex[i].isSelect=true;
                 }else{
                    //  其他元素修改false
                    this.currentIndex[i].isSelect=false;
                 }
            }
           
           
        }
    },
    // 注册组件
    components:{
        // 头部导航栏
        "titlebar":TitleBar,
        // 轮播图
        "slide":Slide,
        // 三级导航栏
        "thirdnav":ThirdNav,
        // 轮播文字
        "slidetext":SlideText,
        // 倒计时
        "limited":Limited,
        // 商品
        "product":Product,
        // 分类按钮组件
        "sort":Sort,
        // 发现组件
        "find":Find,
        // 购物车
        "cart":Cart,
        // 我的
        "me":Me,
        // 底部导航栏
        "tabbaricon":TabBarIcon
    }
    
}
</script>

<style scoped>
    /* 二级导航栏样式 */
    .secondNav>.page-part{
        position:fixed;
        background-color: #fafafa;
        z-index:999;
        width: 100%;
    }
     /* 修改二级导航栏样式 */
    .secondNav>.page-part p{
        font-size:16px;
        margin:0;
        color:#777777;
    }
    /* 修改二级导航栏默认选中样式 */
    .mint-navbar .mint-tab-item.is-selected{       
        border-bottom: 2px solid #cc0e11;
    }
    .mint-navbar .mint-tab-item.is-selected p{
        color:#cc0e11;
    }
    /* 修改tabbar默认文字颜色 */
    .mint-tabbar>.mint-tab-item{
        color:#887010a6;
    }
    /* 修改默认tab选中文字样式 */
    .mint-tabbar>.mint-tab-item.is-selected{
        background-color: transparent;  /*透明*/
        color:#06ad5f;
    }
    /* 底部样式 */
    .tabbar{
        width: 100%;
    }
</style>
