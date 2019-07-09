import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 1.引入mint-ui库中所有组件：完整引入
import MintUI from 'mint-ui'
// 2.单独引入mint-ui样式文件
import'mint-ui/lib/style.css'
// 3.将mint-ui组件库中组件注册vue实例中
Vue.use(MintUI);
// 4.引入axios.js
import axios from './axios'
// 引入字体
import './font/font.css'
// 引入时间转换插件moment
import moment from "moment"


Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
});
Vue.filter('moment', function (value, formatString) {
  formatString = formatString || 'YYYY-MM-DD';
  return moment(value).format(formatString);
  
});
 