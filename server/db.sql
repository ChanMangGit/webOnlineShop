
DROP DATABASE IF EXISTS huawei;
CREATE DATABASE huawei CHARSET=UTF8;
USE huawei;
CREATE TABLE u_login(
 uid INT PRIMARY KEY AUTO_INCREMENT,
 uname VARCHAR(25) NOT NULL,
 upass VARCHAR(32) NOT NULL,
 uphone VARCHAR(16),
 uemail VARCHAR(64)
);
INSERT INTO u_login VALUES(null,'tom',md5('123'),null,null);
INSERT INTO u_login VALUES(null,'jerry',md5('123'),null,null);

#轮播图url 轮播文字
CREATE TABLE slide(
    id INT PRIMARY KEY AUTO_INCREMENT,
    slideurl VARCHAR(100) NOT NULL,
    slidetext VARCHAR(100) NOT NULL
);
#限时抢购
CREATE TABLE limited(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    pcurl VARCHAR(100) NOT NULL,
    title VARCHAR(50) NOT NULL,
    goodsDesc VARCHAR(50) NOT NULL
);
#推荐商品
CREATE TABLE recommend(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    reason VARCHAR(50) NOT NULL,
    recommendurl VARCHAR(100) NOT NULL,
    recommendtitle VARCHAR(50) NOT NULL,
    reasondetail VARCHAR(50) NOT NULL,
    recommendprice VARCHAR(50) NOT NULL,
    delprice VARCHAR(50) NOT NULL
);
#手机
CREATE TABLE phone(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pReason VARCHAR(50) NOT NULL,
    pUrl  VARCHAR(100) NOT NULL,
    prDetail VARCHAR(50) NOT NULL,
    pName VARCHAR(50) NOT NULL,
    pPrice VARCHAR(50) NOT NULL
);
#笔记本电脑
CREATE TABLE laptop(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cReason VARCHAR(50) NOT NULL,
    cUrl  VARCHAR(100) NOT NULL,
    crDetail VARCHAR(50) NOT NULL,
    cName VARCHAR(50) NOT NULL,
    cPrice VARCHAR(50) NOT NULL
);
#发现
CREATE TABLE find(
    findId INT PRIMARY KEY AUTO_INCREMENT,
    findUrl VARCHAR(50) NOT NULL,
    findBTitle VARCHAR(100) NOT NULL,
    findSTitle VARCHAR(100) NOT NULL,
    findDate DATE,
    readCount INT
);

#商品类别表
CREATE TABLE productFamily(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL
);
#商品
CREATE TABLE product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    familyId INT,  #家族编号
    productId INT, #产品型号
    title VARCHAR(128), #主标题
    subtitle VARCHAR(128), #副标题
    price DECIMAL(10,2), #价格
    spec VARCHAR(64), #规格
    promise VARCHAR(64) #承诺
);
#商品图片
CREATE TABLE productPic(
    picID INT PRIMARY KEY AUTO_INCREMENT,
    goodsId INT,
    picUrl VARCHAR(128)
);
#商品版本
CREATE TABLE productVersion(
    vid INT PRIMARY KEY AUTO_INCREMENT,
    familyId INT,
    productId INT,
    spec VARCHAR(64) 
);
#购物车
CREATE TABLE cart(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    productUrl VARCHAR(64),
    price  DECIMAL(10,2),
    count INT
);
