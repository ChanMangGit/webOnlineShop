<template>
    <div class="container">
        <!-- 轮播图 -->
        <mt-swipe :auto="4000" style="height:150px;width:100%;border-radius:15px">
            <mt-swipe-item v-for="(item,index) of list" :key="index">
                <img v-bind:src="`../../../static/img/${item.slideurl}`" style="width:100%;height:100%"/>        
            </mt-swipe-item>            
        </mt-swipe> 
    </div>
</template>
<script>
export default {
    data() {
        return { 
            // 保存服务器数据
            list:[],    
            // src:""      
        }
    },
    // 组件创建成功加载数据
    created() {
        this.loadpc();
    },
    methods: {
        // 加载数据
        loadpc(){
            // 创建url请求地址
            var url="slidepc";
            // 发送ajax
            this.axios.get(url).then(result=>{
                // console.log(result.data.data);
                // 接收服务器返回数据
                // 保存list里面
                this.list=result.data.data;
            });  
        },
    },
}
</script>
<style scoped>
    .container{
        margin-top:5px;
    }
</style>


