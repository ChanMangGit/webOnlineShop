<template>
    <!-- sort顶部组件 -->
    <div class="container">
        <!-- 搜索框 -->
        <mt-search v-model="value"></mt-search>
        <!-- 右侧图片 -->
        <a href="#">
            <img src="../../../static/img/message.png" alt="">
        </a>       
    </div>
</template>
<script>
export default {
    data() {
        return {
            value:""
        }
    },
}
</script>
<style scoped>
    .container{
        display: flex;
        justify-content: space-around;
        background-color: #fafafa;
        height:48px;    
    }
    .container img{
        width: 30px;
        height:30px;
        margin-top:10px; 
    }
     /* 修改搜索框内放大镜图片 */
    .container>>>.mintui-search:before{
        content: url("../../../static/img/search.png") !important;
    }
    /* 修改搜索框默认样式 */
    .container>>>.mint-searchbar{
        background-color: #fafafa !important;
        border-radius: 15px;
    }
</style>

