//1:第三方模块 
//  express          web服务器
//  cors             跨域
//  express-session  session
//  body-parser      处理post数据
//  multer           上传文件
//  fs               文件操作(内置)
//  mysql            mysql驱动模块 

// 1.引入模块 express mysql cors session
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");  //处理跨域
const session = require("express-session");
// 2.创建连接池
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    port:3306,
    database:"huawei",
    connectionLimit:15
});
// 3.创建express对象
var server=express();
// 4.指定静态资源目录
server.use(express.static("public"));
// 5.处理跨域请求
server.use(cors({
    // 允许跨域请求程序地址
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    // 是否验证
    credentials:true
}));
// 6.添加session功能
server.use(session({
    secret:"128位字符串",         //128位字符串
    resave:true,                 //每次请求是否更新数据
    saveUninitialized:true       //保存初始化数据
}));
// 7.绑定监听端口
server.listen(3000);

// 验证注册手机号码邮箱是否重复并注册 
server.get("/register",(req,res)=>{
    // 接收脚手架参数  uphone  uemail
    var uname = req.query.uname;
    var uphone = req.query.uphone;
    var uemail = req.query.uemail;
    var upass = req.query.upass;
    // sql语句
    var sql = "SELECT * FROM u_login WHERE uphone=? OR uemail=?";
    // 返回结果
    pool.query(sql,[uphone,uemail],(err,result)=>{
        if(err) throw err;
        // 根据code提示或继续执行
        if(result.length>0){
            // 手机号或邮箱已存在
            res.send({code:1,msg:"账户已存在"});
        }else{
            // 邮箱或手机号码不存在，进行注册
            pool.query("INSERT INTO u_login SET uname=?,upass=md5(?),uphone=?,uemail=?",[uname,upass,uphone,uemail],(err,result)=>{
                if(err) throw err;
                // 注册成功
                if(result.affectedRows>0){
                    res.send({code:2,msg:"注册成功"});
                }
            });
        }
    });
});

// 手机号码作为登录账户
server.get("/phoneLogin",(req,res)=>{
    //1:接收脚手架参数 uphone upass
    var uphone = req.query.uphone;
    var upass = req.query.upass;
    //2:sql
    //  SELECT id FROM t_login WHERE //uname = ? AND upass = md5(?)
    var sql =" SELECT uid,uname FROM u_login";       
        sql+=" WHERE uphone = ?";
        sql+=" AND upass = md5(?)";
    //3:返回结果 
    pool.query(sql,[uphone,upass],(err,result)=>{
      if(err)throw err;
      if(result.length==0){
        res.send({code:-1,msg:"用户名或密码有误"});
      }else{
        //result=[{id:1}]
        req.session.uname = result[0].uname;
        req.session.uid = result[0].uid;
        res.send({code:1,msg:"登录成功",uname:result[0].uname,uid:result[0].uid});
      }
    });
 });

// 邮箱作为登录账户
server.get("/emailLogin",(req,res)=>{
    //1:接收脚手架参数 uemail upass
    var uemail = req.query.uemail;
    var upass = req.query.upass;
    //2:sql
    //  SELECT id FROM t_login WHERE //uname = ? AND upass = md5(?)
    var sql =" SELECT uid,uname FROM u_login";       
        sql+=" WHERE uemail = ?";
        sql+=" AND upass = md5(?)";
    //3:返回结果 
    pool.query(sql,[uemail,upass],(err,result)=>{
      if(err)throw err;
      if(result.length==0){
        res.send({code:-1,msg:"用户名或密码有误"});
      }else{
        //result=[{id:1}]
        req.session.uid = result[0].uid 
        res.send({code:1,msg:"登录成功"});
      }
    });
});

// 轮播图
server.get("/slidepc",(req,res)=>{
    var sql="SELECT slideurl FROM slide"
    // 返回结果
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
});
// 轮播文字
server.get("/slidetext",(req,res)=>{
    var sql="SELECT slidetext FROM slide"
    // 返回结果
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
});

// 限时抢购商品列表
server.get("/limited",(req,res)=>{
    var sql="SELECT pcurl,title,goodsDesc FROM limited"
    // 返回结果
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    });
});

// 推荐商品
server.get("/productRecommend",(req,res)=>{
    var sql ="SELECT reason,recommendurl,recommendtitle,reasondetail,recommendprice,delprice FROM recommend"
    // 返回结果
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    });
});

// 手机
server.get("/phone",(req,res)=>{
    // 获取参数 pno pageSize
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    // 设置默认值
    if(!pno){pno=1}
    if(!pageSize){pageSize=4}
    var sql="SELECT pid,pReason,pUrl,prDetail,pName,pPrice From phone LIMIT ?,?"
    pno=(pno-1)*pageSize;
    pageSize=parseInt(pageSize);
    // 返回结果
    pool.query(sql,[pno,pageSize],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});
// 笔记本电脑
server.get("/laptop",(req,res)=>{
    // 获取参数 pna pageSize
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    // 默认值
    if(!pno){pno=1}
    if(!pageSize){pageSize=4}
    var sql="SELECT cid,cReason,cUrl,crDetail,cName,cPrice FROM laptop LIMIT ?,?"
    pno=(pno-1)*pageSize;
    package=parseInt(pageSize);
    // 返回结果
    pool.query(sql,[pno,pageSize],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
});

// 发现页获取数据
server.get("/findLoad",(req,res)=>{
    var sql="SELECT findId,findUrl,findBTitle,findSTitle,findDate,readCount FROM find";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send({code:1,msg:"查询成功",data:result});
    })
});
// 发现页--详情页面
server.get("/findDetail",(req,res)=>{
    // 获取页面传过来的参数
    var findId=req.query.findId;
    // console.log(findId);
    var sql="SELECT findUrl,findBTitle,findSTitle,findDate,readCount FROM find WHERE findId=?"
    pool.query(sql,[findId],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send({code:1,msg:"查询成功",data:result});
    })
});
// 发现页-- 阅读数
server.get("/read",(req,res)=>{
    // 获取参数
    var findId=req.query.findId;
    var readCount=parseInt(req.query.readCount)+1;
    console.log(readCount,findId);
    var sql="UPDATE find SET readCount=? WHERE findId=?";
    pool.query(sql,[readCount,findId],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"更新成功"});
    })

})
// 分类页面 加载商品名、图片 表名 productfamily
server.get("/loadName",(req,res)=>{
    var sql="SELECT fid,name,picURL,price FROM productfamily";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})
//商品详情页 表名 product
server.get("/productDetail",(req,res)=>{
    // 获取参数
    var fid=req.query.fid;
    var sql="SELECT pid,familyId,productId,title,subtitle,price,spec,promise,productUrl,promotion1,promotion2,promotion3 FROM product WHERE familyId=? LIMIT 1";
    pool.query(sql,[fid],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send({code:1,msg:"查询成功",data:result});
    })
})
// 商品详情页加载图片
server.get("/detailPic",(req,res)=>{
    var fid=req.query.fid;
    var sql="SELECT picUrl FROM productpic WHERE goodsId=?";
    pool.query(sql,[fid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})
// 商品规格 productversion
server.get("/productSpec",(req,res)=>{
    var fid=req.query.fid;
    var sql="SELECT productId,spec FROM productversion WHERE familyId=?";
    pool.query(sql,[fid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})
// 选中规格更改商品信息
server.get("/selectSpec",(req,res)=>{
    var productId=req.query.productId;
    var sql="SELECT familyId,title,subtitle,price,spec,promise,productUrl,promotion1,promotion2,promotion3 FROM product WHERE productId=?";
    pool.query(sql,[productId],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})
// 加入购物车
server.get("/addCart",(req,res)=>{
    var uid=req.query.uid;
    var productUrl=req.query.productUrl;
    var price=req.query.price;
    var count=req.query.number;
    var title=req.query.title;
    var spec=req.query.spec
    var sql="INSERT INTO cart SET uid=?,productUrl=?,price=?,count=?,title=?,spec=?";
    pool.query(sql,[uid,productUrl,price,count,title,spec],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功"});
        }
    })
})
// 购物车显示
server.get("/cart",(req,res)=>{
    var uid=req.query.uid;
    var sql="SELECT cid,productUrl,price,count,title,spec FROM cart WHERE uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"添加成功",data:result});

    })
})
// 删除选中的商品
server.get("/delProduct",(req,res)=>{
    // 获取参数
    var cid=req.query.cid;
    var sql=`DELETE FROM cart WHERE cid IN(${cid})`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        // sql: insert update delete
        // result不是数组是一个对象
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})
// 更新购物车商品数量
server.get("/updateCount",(req,res)=>{
    // 获取参数
    var count=req.query.count;
    var cid=req.query.cid;
    var sql="UPDATE cart SET count=? WHERE cid=?";
    pool.query(sql,[count,cid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"更新成功"})
    })
})