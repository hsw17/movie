class Apis {
//接口
  static const String BASE_HOST = "http://mobile.bwstudent.com";

  /// 登录
  static const String HOME_LOGIN = BASE_HOST + "/movieApi/user/v2/login";
  /// 轮播图
  static const String HOME_BANNER = BASE_HOST + "/movieApi/tool/v2/banner";
  //正在热映
  static const String HOME_RELEASE = BASE_HOST + "/movieApi/movie/v2/findReleaseMovieList?page=1&&count=5";
  //即将上映
  static const String HOME_ComingSoon = BASE_HOST + "/movieApi/movie/v2/findComingSoonMovieList?page=1&&count=5";
  //热门电影
  static const String HOME_HOT = BASE_HOST + "/movieApi/movie/v2/findHotMovieList?page=1&&count=5";
  //详情
  static const String HOME_XIANGQING = BASE_HOST + "movieApi/movie/v2/findMoviesDetail?movieId=";
  //tuijing推荐影院
  static const String HOME_RecommendCinemas = BASE_HOST + "/movieApi/cinema/v1/findRecommendCinemas?page=1&&count=10";
  //附近影院
  static const String HOME_NearbyCinemas = BASE_HOST + "/movieApi/cinema/v1/findNearbyCinemas?page=1&&count=10";
  //海淀区
  static const String HOME_Region = BASE_HOST + "/movieApi/tool/v2/findRegionList";

}