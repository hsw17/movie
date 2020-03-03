import 'dart:convert';
import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';

import 'api/apis.dart';

String sessionId;
int userId;

/// 登录
Future get_login(String _email, String _password) async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    connectTimeout: 5000,
    receiveTimeout: 3000,

  );
  try {
    Response response;
    var data = {
      'email': "c157334086900@163.com",
      "pwd": "uNzol1eD+fxXRt/ALcYcdw=="
    };
    response = await Dio(options).post(
      "movieApi/user/v2/login",
      data: data,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> user = json.decode(response.data);
      sessionId = user["result"]["sessionId"];
      userId = user["result"]["userId"];
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

Future getBanner() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['banner']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//正在上映
Future get_findReleaseMovieList() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['findReleaseMovieList']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//正在热映
Future get_findComingSoonMovieList() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['findComingSoonMovieList']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//即将上映
Future get_findHotMovieList() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['findHotMovieList']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//推荐影院
Future get_commend() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['COMMEND']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//附近影院
Future get_nearby() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['NEARBY']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//区域Id
Future get_region(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    if (formData == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url]);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//电影详情
Future get_detail(url) async {
  try {
    Response response;
    Dio dio = new Dio();
    print(servicePath['DETAIL'] + '$url');
    response = await dio.get(servicePath['DETAIL'] + '$url');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//电影关注
Future getAttention_Movie() async {
  print(userId);
  print(sessionId);
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['USERFOLLOWMOVIELIST']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//影院关注
Future getAttention_Cinema() async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['USERFOLLOWCINEMALIST']);
    if (response.statusCode == 200) {
      print(response.data);
      print("影院关注");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//我的预约
Future get_Finduserreserve() async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['FINDUSERRESERVE']);
    if (response.statusCode == 200) {
      print(response.data);
      print("我的预约");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//购票记录待付款
Future get_Finduserbuyticketrecord_one() async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['FINDUSERBUYTICKETRECORD_ONE']);
    if (response.statusCode == 200) {
      print(response.data);
      print("购票记录待付款");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//购票记录已付款
Future get_Finduserbuyticketrecord_two() async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['FINDUSERBUYTICKETRECORD_TWO']);
    if (response.statusCode == 200) {
      print(response.data);
      print("购票记录已付款");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//看过的电影
Future get_Findseenmovie() async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['FINDSEENMOVIE']);
    if (response.statusCode == 200) {
      print(response.data);
      print("购票记录");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//用户评论
Future get_Finduserfollowmovielist() async {
  BaseOptions options = new BaseOptions(
    baseUrl: Apis.BASE_HOST,
    headers: {
      "userId": userId,
      "sessionId": sessionId,
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );
  try {
    Response response;
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['FINDUSERFOLLOWMOVIELIST']);
    if (response.statusCode == 200) {
      print(response.data);
      print("用户评论");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
