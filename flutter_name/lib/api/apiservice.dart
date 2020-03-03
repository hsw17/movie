import 'package:dio/dio.dart';
import 'package:flutter_name/api/Ap.dart';
import 'package:flutter_name/bean/xiangqing_bean_entity.dart';

import 'dio_manager.dart';


/// 获取详情
void getArticleList(
    Function callback, Function errorCallback, String text) async {
  dio.get("http://mobile.bwstudent.com/movieApi/movie/v2/findMoviesDetail?movieId="+text).then((response) {
    callback(XiangqingBeanEntity().fromJson(response.data));
  }).catchError((e) {
    errorCallback(e);
  });
}

Future xiangQingGet(String text) async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        "http://mobile.bwstudent.com/movieApi/movie/v2/findMoviesDetail?movieId="+text);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}


//正在热映
Future get_Data1() async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        Apis.HOME_RELEASE);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}
//即将上映
Future get_Data2() async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        Apis.HOME_ComingSoon);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}
//热门电影
Future get_Data3() async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        Apis.HOME_HOT);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}
//推荐影院
Future get_TuiJian() async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        Apis.HOME_RecommendCinemas);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}
//附近影院
Future get_FuJin() async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        Apis.HOME_NearbyCinemas);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}
//海淀区
Future get_HaiDianQu() async{
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        Apis.HOME_Region);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  }catch(e){
    return print("异常=======>${e}");
  }
}