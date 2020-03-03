import 'package:flutter/material.dart';


import 'my_interfaceWidget/I_Feedback.dart';
import 'my_interfaceWidget/I_appointment.dart';
import 'my_interfaceWidget/I_attention.dart';
import 'my_interfaceWidget/I_comment.dart';
import 'my_interfaceWidget/Read_Movie.dart';
import 'my_interfaceWidget/Settings.dart';
import 'my_interfaceWidget/Ticket_Record.dart';

class My_Setting extends StatefulWidget {
  @override
  _My_SettingState createState() => _My_SettingState();
}

class _My_SettingState extends State<My_Setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          title: Text(
            "我的",
          ),
        ),
        body: _HomeContent(),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        _Stack_Widget(),
      ],
    );
  }
}

//Stack 电影故事
class _Stack_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[

        new Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          //设置外边距
          height: 100,
          width: 500,
          //边框设置
          decoration: new BoxDecoration(
            //背景
            color: Colors.black45,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        new InkWell(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 35, 0, 0),
            height: 60,
            width: 60,
            child: new CircleAvatar(
              //头像半径
              radius: 25,
              backgroundImage: new AssetImage('images/beiying.jpg'),
            ),
          ),
          onTap: () {},
        ),
        new InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.fromLTRB(100, 55, 0, 0),
            child: new Text(
              '登录/注册',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w100),
            ),
          ),
        ),
        new Container(
          width: 500,
          height: 50,
          margin: EdgeInsets.fromLTRB(10, 140, 10, 0),
          //边框设置
          decoration: new BoxDecoration(
            //背景
            color: Colors.black45,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: InkWell(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Image(image: new AssetImage('images/wodedianyingpiao.png'),
                    width: 24,
                    height: 24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text("电影票",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w100),
                    ),
                )
              ],
            ),
            onTap: () {},
          ),
        ),
        new Container(
          margin: EdgeInsets.fromLTRB(10, 210,10, 0),
          height: 300,
          width: 350,
          color: Colors.black45,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('点击了导航我的关注');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Attention()));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                      width: 48,
                      height: 46,
                      child: Image(
                        image: new AssetImage('images/group_2.png'),
                      ),
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    width: 100,
                    height: 120,
                    child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 32, 0, 0),
                            child: Image(
                              image: new AssetImage('images/wodeyuyue.png'),
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 8, 0, 0),
                            child: Text(
                              '我的预约',
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        print('点击了导航我的预约');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Appointment()));
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('点击了导航购票记录');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Ticket_Record()));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      width: 48,
                      height: 46,
                      child: Image(
                        image: new AssetImage('images/chongzhijilu.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(33, 0, 0, 0),
                      width: 60,
                      height: 46,
                      child: Image(
                        image: new AssetImage('images/duihao.png'),
                      ),

                    ),

                    onTap: () {
                      print('点击了导航看过的电影');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Read_Movie()));
                    },
                  ),
                  InkWell(
                    onTap: () {
                      print('点击了导航我的评论');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Comment()));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      width: 48,
                      height: 46,
                      child: Image(
                        image: new AssetImage('images/pinglun.png'),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(73, 0, 0, 0),
                      width: 48,
                      height: 46,
                      child: Image(
                        image: new AssetImage('images/yijianfankui_01.png'),
                      ),
                    ),
                    onTap: () {
                      print('点击了导航意见反馈');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Feedback_I()));
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(40, 30, 0, 0),
                      width: 46,
                      height: 46,
                      child: Image(
                        image: new AssetImage('images/invalid_name.png'),
                      ),
                    ),
                    onTap: () {
                      print('点击了导航设置');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Setttings()));
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
