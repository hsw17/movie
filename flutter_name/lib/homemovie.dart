/*
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: HomePage(),
    );
  }
}

  class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
  }

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(


    );
  }

}*/


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_name/webviews/Browser.dart';
import 'package:flutter_name/xiangqing.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as client;
import 'dart:convert'; //使用 json 解析

import 'package:dio/dio.dart';

import 'api/apiservice.dart';
import 'api/sp_util.dart';
import 'api/toast_util.dart';
import 'bean/remenmovie_entity.dart';//解码和编码JSON


import 'home/homehttps.dart';
class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _bannerList = [
    "http://mobile.bwstudent.com/images/movie/stills/whwdzg/whwdzg1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/zgjz/zgjz1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/pdz/pdz1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/sndn/sndn1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/dwsj/dwsj1_h.jpg"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        child: Column(
          children: <Widget>[
              //页面顶部轮播组件
            SwiperDiy(swiperDataList: _bannerList),
            _Release_Widget(),
            coming_soon_Widget(),
            _hot_movie_Widget(),
          ],
        ),
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
      height: 150,
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
        //自动轮播
        autoplay: true,
        // 当前视窗展示比例 小于1可见上一个和下一个视窗
        viewportFraction: 0.8,
        // 两张图片之间的间隔
        scale: 0.8,
      ),
    );
  }
}


//正在上映
class _Release_Widget extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<_Release_Widget> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get_Data();
  }



  @override
  Widget build(BuildContext context) {
    //初始化
    SPUtil.getInstance();
    // TODO: implement build
    return Flexible(

      fit: FlexFit.tight,
      child:
        FutureBuilder(

          future: get_Data1(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var data=json.decode(snapshot.data.toString());
              data=data["result"];
              list = data;
              return ListView(
                children: _getItem(),
                scrollDirection: Axis.horizontal,
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),


    );
  }

  List<Widget> _getItem() {

    return list.map((item) {

      return new GestureDetector(

          child: new Card(
            elevation: 3.0,
            child :  Padding(
              padding: const EdgeInsets.all(10.0),
              child: _item(item),
            ),
            //   margin: const EdgeInsets.all(10.0),

          ),
        onTap: (){
          T.show(msg: "${item["movieId"]}");
          SPUtil.putString("000", "${item["movieId"]}");
          Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DyXiangQing2(text: "${item["movieId"]}",)));
        },

      );


    }).toList();

  }

  Widget _item(item) {

    return new Column(

      children: <Widget>[

        new Center(

          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['imageUrl']}",
            width: 120.0,
            height: 100.0,
          ),
        ),
        new Text(
            "${item["name"]}",
            textAlign: TextAlign.center
        ),
      ],
    );
  }
}

//即将上映
class coming_soon_Widget extends StatefulWidget {
  @override
  _coming_State createState() => _coming_State();
}

class _coming_State extends State<coming_soon_Widget> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get_Data();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      fit: FlexFit.tight,
      child:
      FutureBuilder(
        future: get_Data2(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=json.decode(snapshot.data.toString());
            data=data["result"];
            list = data;
            return ListView(
              children: _getItem(),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      /*ListView(
        children: _getItem(),
      ),*/
    );
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return GestureDetector(
         child : Card(
            child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: _item(item),
            ),
            elevation: 3.0,
            //  margin: const EdgeInsets.all(10.0),
          ),
        onTap: (){
          T.show(msg: "${item["movieId"]}");
          SPUtil.putString("000", "${item["movieId"]}");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DyXiangQing2(text: "${item["movieId"]}",)));
        },
      );

    }).toList();
  }

  Widget _item(item) {
    return new Row(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['imageUrl']}",
            width: 120.0,
            height: 120.0,
          ),
        ),
        new Column(
          children: <Widget>[
            new Text("${item["name"]}".trim(),
               /* style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),*/
                textAlign: TextAlign.left),
            new Text(
              "${item["wantSeeNum"]}",
            )

          ],
        ),
      ],
    );
  }
}

//热门电影
class _hot_movie_Widget extends StatefulWidget {
  @override
  _hot_movie_State createState() => _hot_movie_State();
}

class _hot_movie_State extends State<_hot_movie_Widget> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get_Data();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      fit: FlexFit.tight,
      child:
      FutureBuilder(
        future: get_Data3(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=json.decode(snapshot.data.toString());
            data=data["result"];
            list = data;
            return ListView(
              children: _getItem(),
              scrollDirection: Axis.horizontal,
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

     /* ListView(
        children: _getItem(),
        scrollDirection: Axis.horizontal,
      ),*/
    );
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return GestureDetector(
         child: new Card(
            child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: _item(item),
            ),
            elevation: 3.0,
            //  margin: const EdgeInsets.all(10.0),
          ),
        onTap: (){
          T.show(msg: "${item["movieId"]}");
          SPUtil.putString("000", "${item["movieId"]}");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DyXiangQing2(text: "${item["movieId"]}",)));
        },
      );


    }).toList();
  }

  Widget _item(item) {
    return new Column(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['imageUrl']}",
            //image: "${item['horizontalImage']}",
            width: 120.0,
            height: 100.0,
          ),
        ),
        Text("${item["name"]}".trim(),
           /* style: new TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),*/
            textAlign: TextAlign.center),
      ],
    );
  }
}


