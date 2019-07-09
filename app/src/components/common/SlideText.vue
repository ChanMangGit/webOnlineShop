
<template>
    <div class="container">
        <div class="imgLogo">
            <img src="../../../static/img/logo_wapHeadNews.png" alt="">
        </div>
        
        <!-- 轮播文字 -->
        <div style="height:40px" class="slideText" id ="slideText">
            <!-- num===0 一轮轮播后顺滑过渡第二轮 -->
            <ul class="slideList" :style = {transform:transform} :class="{slideList_unanim:num===0}">
                <!-- 第一轮轮播显示框 -->
                <li v-for="(item,index) in textArr" :key=index>
                    <a href="#">{{item.slidetext}}</a>
                </li>
                <!-- 第一轮结束后数据放在末尾 -->
                <li v-for="(item,index) in textArr" :key=index+textArr.length>
                    <a href="#">{{item.slidetext}}</a>
                </li>`
            </ul>
        </div> 
        <div class="more">
            <a href="#">更多</a>
        </div>
    </div>   
</template>
 
<script>
export default {
    props: {
        height: {default: 40,type: Number},
    },
    data() {
        return {
            // 空数组保存数据
            textArr: [],
            num: 0
        }
    },
    methods: {
        // 轮播
        slide(){
            let $this = this
            setInterval(function () {
                if ($this.num !== $this.textArr.length) {
                $this.num++
                } else {
                $this.num = 0
                }
            }, 3000)
        },
        // 加载数据
        loadText(){
            // 创建url请求地址
            var url="slidetext";
            // 发送ajax请求
            this.axios.get(url).then(result=>{
                this.textArr=result.data.data;
            });
        }
    },
    computed: {
        transform: function () {
            return 'translateY(-' + this.num * this.height + 'px)'
        }
    },
    // 加载时自动调用方法
    created(){
        this.loadText();
        this.slide();
    }
}
</script>
<style scoped>
    .container{
        display: flex;
        justify-content: space-between;
        white-space: nowrap;
        margin:0 2%;
        
    }
    /* 图片样式 */
    .imgLogo>img{
        width: 55px;
        height: 15px;
        margin-top:18px;
    }
    .slideText{
        display: inline-block;
        position:relative;
        overflow: hidden;
        text-align: left;
    }
    /* ul样式 */
    .slideList{
        transition: 1s linear;
        list-style: url("../../../static/img/point.png");      
    }
    .slideList>li{
        height: 40px;
        width: 220px;
    }
    .slideList a{
        color:#4d4d4d;
        text-decoration: none;
        display: block;
        height: 40px;
        width: 220px;
        font-size: 12px;
    }
    .slideList_unanim{
        transition: none
    }
    .more{
        margin-top:16px;
        margin-left:10px;  
    }
    .more>a{      
        text-decoration:none;
        color:#999;

    }
</style>


