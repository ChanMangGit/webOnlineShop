import Vue from 'vue'
import Router from 'vue-router'
import Login from "../components/Login.vue"
import Register from "../components/Register.vue"
import Verification from "../components/common/Verification.vue"
import Home from "../components/Home.vue"
import TabBarIcon from "../components/common/TabBarIcon.vue"
import ThirdNav from "../components/common/ThirdNav.vue"
import Product from "../components/common/Product.vue"
import Slide from "../components/common/Slide.vue"
import TitleBar from "../components/common/TitleBar.vue"
import SlideText from "../components/common/SlideText.vue"
import Limited from "../components/common/Limited.vue"
import SortHead from "../components/common/SortHead.vue"
import Sort from "../components/common/Sort.vue"
import Find from "../components/common/Find.vue"
import findDetails from "../components/common/findDetails.vue"
import productDetails from "../components/common/productDetails.vue"
import Cart from "../components/common/Cart.vue"
import Me from "../components/common/Me.vue"



Vue.use(Router)


export default new Router({
  routes: [
    {path:'/',component:Home},
    {path:"/Login",component:Login},
    {path:"/Register",component:Register},
    {path:"/Verification",component:Verification},
    {path:"/Home",component:Home},
    {path:"/TabBarIcon",component:TabBarIcon},
    {path:"/ThirdNav",component:ThirdNav},
    {path:"/Product",component:Product},
    {path:"/Slide",component:Slide},
    {path:"/TitleBar",component:TitleBar},
    {path:"/SlideText",component:SlideText},
    {path:"/Limited",component:Limited},
    {path:"/SortHead",component:SortHead},
    {path:"/Sort",component:Sort,meta:{keepAlive:false}},
    {path:"/Find",component:Find,meta:{keepAlive:false}},
    {path:"/findDetails/:findId",component:findDetails,props:true,meta:{keepAlive:false}},
    {path:"/productDetails/:fid",component:productDetails,props:true,meta:{keepAlive:false}},
    {path:"/Cart",component:Cart},
    {path:"/Me",component:Me}
  ]
})