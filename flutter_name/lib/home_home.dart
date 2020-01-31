import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as client;
import 'dart:convert'; //使用 json 解析

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _bannerList = [
    "http://mobile.bwstudent.com/images/movie/stills/whwdzg/whwdzg1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/zgjz/zgjz1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/pdz/pdz1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/sndn/sndn1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/dwsj/dwsj1_h.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 1000,
      child: Column(
        children: <Widget>[
          SwiperDiy(swiperDataList: _bannerList), //页面顶部轮播组件

        ],
      ),
    );
  }
}

/// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 750,
      height: 200,
      child: Swiper(
        scrollDirection: Axis.horizontal,
        // 横向
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: Container(
            decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${swiperDataList[index]}"),
                  fit: BoxFit.fill,
                )),
          ));
        },
        itemCount: swiperDataList.length,
        //pagination: new SwiperPagination(),
        autoplay: true,
        viewportFraction: 0.8,
        // 当前视窗展示比例 小于1可见上一个和下一个视窗
        scale: 0.8, // 两张图片之间的间隔
      ),
    );
  }
}

