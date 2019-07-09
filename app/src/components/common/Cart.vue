<template>
    <!-- 购物车组件 -->
    <div class="container">
        <!-- 头部固定定位 -->
        <div class="cartHead">
            <h1>购物车</h1>
        </div>
        <!-- 占位 -->
        <div style="height:50px"></div>
        <!-- 默认显示 登录后且查询到购物车非空后隐藏-->
        <div v-show="display" class="display">
            <div class="displayHead">
                <div class="imgP">
                    <img src="../../../static/img/cart.png">
                    <p>购物车中还没有商品，赶紧选购吧</p>
                </div>
                <div class="jumpHome" @click.native="changeState(0)">
                    <p>去逛逛</p>
                </div>
            </div>
            <!-- 商品推荐 -->
            <div class="displayBody">
                <h2>热销推荐</h2>
                <div class="displayFlex">               
                    <!-- 商品点击跳转到详情页 -->
                    <div v-for="(item,index) of productList" :key="index" class="displayBodyBtn" @click="productDetails(item.fid)">
                        <!-- 图片 名 价格 -->
                        <div class="jumpDetail">
                            <img v-bind:src="`../../../static/img/${item.picURL}`">
                            <p class="productName">{{item.name}}</p>
                            <p class="productPrice">¥{{item.price}}</p>
                        </div>
                    </div>   
                </div>
            </div>          
        </div>
        <!-- 默认隐藏 -->
        <div v-show="hide">
            <!-- 商品列表 -->
            <!-- 大div -->
            <div v-for="(item,index) of cartList" :key="index">
                <div class="cartList">
                   <div class="checkImg">
                        <!-- 选项 item.checkbox与复选框状态有关loadCart()-->
                        <input type="checkbox" v-model="item.checkbox" @click="totalPrice(item.checkbox,item.count,item.price)">
                        <!-- 商品列表 -->
                        <!-- 左侧图片 -->
                        <img v-bind:src="`../../../static/img/${item.productUrl}`"> 
                    </div>               
                    <!-- 右侧 -->
                    <div class="hideRight">
                        <!-- 大标题 -->
                        <p class="title">{{item.title}}</p>
                        <!-- 规格 -->
                        <div class="spec">{{item.spec}}</div>
                        <!-- 左侧价格 右侧数量按钮 -->
                        <div class="listPrice">
                            <p>¥{{item.price}}</p>
                            <div class="buyCount">
                                <!-- 商品数量加减按钮 -->
                                <div class="numBtn">
                                    <div @click="sub" class="sub">
                                        <img src="../../../static/img/sub.png" :data-cid="item.cid" :data-count="item.count">
                                    </div>
                                    <div class="num">{{item.count}}</div>
                                    <div @click="add" class="add">
                                        <img src="../../../static/img/add.png" :data-cid="item.cid" :data-count="item.count">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
                <hr color="#dbdbdb">
            </div>
            <!-- 最底下，导航栏上方 -->
            <!-- 左全选 右显示选择总价和结算按钮 -->
            <div class="cartFoot">
                <!-- 左侧按钮 -->
                <div class="selectAll">
                    <input type="checkbox" @change="selectAll" :checked="all">
                    <p>全选</p>
                </div>
                <!-- 右侧总价、删除按钮、结算按钮 -->
                <div class="cartFootRight">
                    <!-- 总价 -->
                    <div class="total">
                        <p>合计：</p>
                        <p class="totalPrice">¥{{total}}</p> 
                    </div>
                   
                    <!-- 删除按钮 -->
                    <div class="delBtn" @click="deleteProduct">删除</div>
                    <!-- 结算按钮 -->
                    <div class="payBtn">
                        <p>结算</p>
                    </div>
                </div>
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
            // 默认显示
            display:true,
            // 默认隐藏
            hide:false,
            // 保存购物车列表
            cartList:[],
            // 保存加载商品
            productList:[],
            // 总价
            total:0,
            // 全选按钮状态
            all:false
            
        }
    },
    // beforeRouteEnter (to, from, next) {
    //     next(vm=>{
    //         vm.loadCart();
    //     })
    // },
    activated() {
        this.loadCart();
    },
    created() {
        // 加载商品
        this.loadProduct();
        // 查询购物车是否为空并显示商品
        this.loadCart();
    },
    methods: {
        // 加载购物车商品
        // 根据购物车数组长度显示
        loadCart(){
            // 获取是否登录
            var uid=sessionStorage.getItem("uid");
            var url="cart";
            var obj={uid:uid};
            console.log(obj)
            if(uid){
                this.axios.get(url,{params:obj}).then(result=>{
                    if(result.data.code==1){
                        // 获取数组--原先数组
                        var rows=result.data.data;
                        if(rows.length>0){
                            this.display=false;
                            this.hide=true;
                            // 创建循环为数组中元素添加checkbox属性
                            for(var item of rows){
                                item.checkbox=false;
                            }
                            // 将修改后数据赋值给carList
                            this.cartList=rows;
                            //把读取到商品数保存在number 
                            this.number=result.data.data[0].count;
                        }else{
                            this.display=true;
                            this.hide=false;
                        }                        
                    }
                    
                })
            }
        },
        // 加载商品
        loadProduct(){
            var url="loadName";
            this.axios.get(url).then(result=>{
                if(result.data.code==1){
                    this.productList=result.data.data;
                }else{
                    console.log("获取数据失败");
                }
            })
        },
        // 跳转到商品详情
        productDetails(fid){
            this.$router.push({path:`/productDetails/${fid}`});
        },
        // 跳转到主页  未实现
        changeState(n){
            this.$parent.changeState(n);
        },
        // 购买数量减少按钮
        sub(e){
            var count=e.target.dataset.count;
            var cid=e.target.dataset.cid;
            count=count>1?count-1:1;                          
            var obj={count:count,cid:cid};
            console.log(obj);
            this.axios.get("updateCount",{params:obj}).then(result=>{
                this.loadCart();
            })
        },
        // 购买数量增加按钮
        add(e){
            var count=e.target.dataset.count;
            var cid=e.target.dataset.cid;
            count=parseInt(count)+1;
            var obj={count:count,cid:cid};
            console.log(obj);
            this.axios.get("updateCount",{params:obj}).then(result=>{
                this.loadCart();
            })
        },
        // 全选
        selectAll(e){
            // 获取当前全选按钮状态
            var res=e.target.checked;
            this.all=res
            console.log(this.all);
            // 获取购物车数组列表
            // 创建循环
            // console.log(res);
            // 避免叠加，先初始化为0
            this.total=0;  
            for(var item of this.cartList){
                // 将当前商品checkbox状态修改为全选状态
                item.checkbox=res;
                // 更改总价  
                           
                if(item.checkbox){
                    this.total+=item.count*item.price;
                }else{
                    this.total=0;
                }
                
            }
        },
        // 删除购物车中选中商品
        deleteProduct(){
            // 删除确认框
            this.$messagebox({
                title:"消息",
                message:"是否删除指定商品",
                showConfirmButton:true,
                showCancelButton:true
            }).then(result=>{
                if("cancel"==result){
                    return;
                }else{
                     // 创建变量保存空字符串
                    var str="";
                    // 创建循环遍历数组
                    for(var item of this.cartList){
                        // 判断checkbox是否为true
                        if(item.checkbox){
                            str+=item.cid+","
                        }                
                    }
                    if(str.length==0){
                        this.$messagebox("","请选中要删除的商品！");
                        return;
                    }
                    // 获取当前元素id拼接字符串
                    // 结果"1,2,3"
                    str=str.substring(0,str.length-1);
                    console.log(str);
                    // 发送ajax请求获取数据
                    var url="delProduct";
                    var obj={cid:str};
                    this.axios.get(url,{params:obj}).then(result=>{
                        this.total=0;
                        this.loadCart();
                    })

                }
            })         
        },
        // 总价
        totalPrice(checkbox,count,price){
            // 如果是选中状态
            // console.log(count,price)
            if(!checkbox){               
                this.total+=count*price;
            }else{
                this.total-=count*price;
                this.all=false;
            }

        }
    },

}
</script>
<style scoped>
    .container{
        position: relative;
    }
    /* 头部样式 */
    .cartHead{
        width: 100%;
        background-color: #fff;
        position: fixed;
    }
    .cartHead>h1{
        color: #191919;
        font-size: 18px;
    }
    /* 默认显示购物车图片文字 */
    .display{
        margin-top:20px;
        width: 100%;
    }
    .displayHead{
        height: 100px;
    }
    .display h2{
        font-size: 16px;
        color:#333;
    }
    .imgP{
        display: flex;
        justify-content: center;
    }
    .imgP>img{
        width: 25px;
        height: 25px;
    }
    .imgP>p{
        font-size: 12px;
        color: #888;
        margin-top:5px;
        margin-left:5px;
    }
    .jumpHome{
        border: 1px solid #ca141d;
        border-radius: 10px;
        width: 85px;
        height: 30px;
        position: absolute;
        left: 50%;
        margin-left: -43px;
    }
    .jumpHome>p{
        margin:5px;
        color: #ca141d;
        font-size: 14px;
    }
    /* 跳转商品详情 */
    .displayBody{
        background-color: #f9f9f9;
    }
    .displayFlex{
        display: flex;
        justify-content: space-around;
        box-sizing: border-box;
        flex-wrap: wrap;
        margin: 0 3%;
    }
    .displayBodyBtn{
        width: 48%;
        background-color: #fff;
        margin-bottom: 10px;
    }
    .jumpDetail img{
        width: 135px;
        height: 135px;
    }
    .productName{
        margin: 0;
        color:#333;
        font-size: 12px;
    }
    .productPrice{
        margin-top:5px;
        color: #ca141d;
        font-size: 16px;
    }
    /* 默认显示-------end--------- */
    /* 默认隐藏 */
    /* 商品列表图片 */
    .cartList{
        display: flex;
        justify-content: space-between;
        margin: 0 3%;
    }
    .checkImg{
        display: flex;
        justify-content: space-around;
    }
    .checkImg input{
        margin-top:35px;
    }
    .cartList>.checkImg>img{
        width: 100px;
        height: 100px;
        
    }
    .hideRight{
        display: flex;
        flex-direction: column;
    }
    .title{
        font-size: 14px;
        color:#333;
    }
    .spec{
        background-color:#f3f1f1;
        font-size: 12px;
        color: #888;
    }
    .listPrice{
        display: flex;
        justify-content: space-around;
    }
    .listPrice>p{
        color: #ca151e;
        font-size: 14px;
    }
    /* 购买数量 */
    .buyCount{
        display: flex;
        justify-content: space-around;
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
    /* 更改checkbox默认样式 */
    input[type='checkbox']{
        width: 20px;
        height: 20px;
        background-color: #fff;
        /* 默认背景选中箭头 */
        -webkit-appearance:none;
        border: 1px solid #c9c9c9;
        border-radius: 2px;
        outline: none;
        margin-right:5px;
    }
    /* 选中状态 */
    input[type=checkbox]:checked{
        background: url("../../../static/img/select.png")no-repeat center;
    }
    /* 商品列表下的结算 */
    .cartFoot{
        display: flex;
        justify-content: space-around;
    }
    .selectAll{
        display:flex;
        justify-content: space-around;
    }
    .selectAll>p{
        color: #888;
        font-size: 16px;
        margin: 0;
    }
    .delBtn{
        font-size: 16px;
        color: #ca141d;
        margin: 0 10px;
    }
    .cartFootRight{
        display: flex;
        justify-content: space-around;
    }
    .cartFootRight>p{
        margin:0;
    }
    .total{
        display: flex;
        justify-content:left;
        width: 100px;
    }
    .total p{
        margin:0;
    }
    .totalPrice{
        margin-top:3px !important;
        font-size: 15px;
        color: #ca141d;
    }
    .payBtn{
        width: 60px;
        height: 30px;
        background:linear-gradient(left,#ff7f49 0%,#cc161e 100%);
        color: #fff;
        border-radius: 10px;
        text-align: center;
    }
    .payBtn>p{
        margin:3px;
    }
</style>

