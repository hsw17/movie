import 'dart:convert';

import 'package:flutter/material.dart';

import '../service.dart';




//我的预约
class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: get_Finduserreserve(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            print(data);
            List<Map> findReleaseMovieList = (data['result'] as List).cast();
            return Column(
              children: <Widget>[Text("${findReleaseMovieList}")],
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
    );
  }
}
