

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

import 'api/sp_util.dart';
import 'bean/xiangqing_bean_entity.dart';//解码和编码JSON

class DyXiangQing2 extends StatelessWidget{
  DyXiangQing2({
    Key key,
    @required this.text,
  }
      ):super (key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DyXiangQing(text),
    );
  }

}
//主框架
class DyXiangQing extends StatefulWidget {
  final String text;
  DyXiangQing(this.text);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XiangQing_Widget(text);
  }
}


class XiangQing_Widget extends  State<DyXiangQing> {
  final String text;
  XiangqingBeanEntity data2;
  XiangQing_Widget(this.text);

  @override
  void initState(){
    super.initState();

    xiangQingGet();
    String str = SPUtil.getString("000");
    print("str");
    print("获取数据========"+str);
  }
  xiangQingGet() async {
    client
        .get("http://mobile.bwstudent.com/movieApi/movie/v2/findMoviesDetail?movieId="+text)
        .then((client.Response response){
      var data=json.decode(response.body);
      data2 = new XiangqingBeanEntity().fromJson(data);
      setState(() {
        xiangQingGet();

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(

      child: SingleChildScrollView(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

             new FadeInImage.assetNetwork(
                placeholder: "images/jc.jpg",
                image: data2.result.imageUrl,
                width: double.infinity,
                //height: 300.0,
            ),
            Text(data2.result.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
            ),
            ),
            TextsWidget,
            Text(data2.result.summary,
              textAlign: TextAlign.left,
              style: TextStyle(

              ),
            ),
          ],

        ),
      ),
    );
  }
}

Widget TextsWidget = new Container(
  margin: EdgeInsets.only(top: 10,bottom: 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("介绍",
        style: TextStyle(
          fontSize: 16,
        ),
      )
    ],
  ),
);



