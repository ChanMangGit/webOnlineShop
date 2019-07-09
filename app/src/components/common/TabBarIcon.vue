<template>
    <!-- 底部导航栏子组件 -->
    <div>
        <!-- 变量focesed 当前是否为焦点  true/false -->
        <!-- selectedImage选中为图片 绿色图片 -->
        <!-- normalImage 普通图片 黄色图片 -->
        <img :src="focused?selectedImage:normalImage" alt="" class="imgstyle">
    </div>
</template>

<script>

export default {
    // 接收父组件数据
    props:{
        // 默认false
        focused:false,
        selectedImage:{default:""},
        normalImage:{default:""},
    }
}
</script>
<style scoped>
    .imgstyle{
        width:30px;
        height:30px;
    }
</style>

