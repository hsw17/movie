class Apis {
  static const String BASE_HOST = "http://mobile.bwstudent.com/"; //前半段
  static const String login_url = "movieApi/user/v2/login"; //登录
  static const String banner = "movieApi/tool/v2/banner"; // 轮播图

  static const String findReleaseMovieList =
      "movieApi/movie/v2/findReleaseMovieList?page=1&&count=5"; // 正在上映

  static const String findComingSoonMovieList =
      "movieApi/movie/v2/findComingSoonMovieList?page=1&&count=5"; // 即将上映

  static const String findHotMovieList =
      "movieApi/movie/v2/findHotMovieList?page=1&&count=10"; // 热门电影

  static const String COMMEND =
      "movieApi/cinema/v1/findRecommendCinemas?page=1&&count=10"; // 推荐影院

  static const String NEARBY =
      "movieApi/cinema/v1/findNearbyCinemas?page=1&&count=10"; // 附近影院
  static const String REGION = "movieApi/tool/v2/findRegionList"; // 区域Id
  static const String DETAIL =
      "movieApi/movie/v2/findMoviesDetail?movieId="; //电影详情

  static const String USERFOLLOWMOVIELIST =
      "movieApi/user/v2/verify/findUserFollowMovieList?page=1&&count=5"; // 电影关注

  static const String USERFOLLOWCINEMALIST =
      "movieApi/user/v2/verify/findUserFollowCinemaList?page=1&&count=5"; // 影院关注
}

const api = 'http://mobile.bwstudent.com/'; //前半段
const servicePath = {
  //登录
  'login_url': api + 'movieApi/user/v2/login',
  // 轮播图
  'banner': api + 'movieApi/tool/v2/banner',
  // 正在上映
  'findReleaseMovieList':
  api + 'movieApi/movie/v2/findReleaseMovieList?page=1&&count=5',
  // 即将上映
  'findComingSoonMovieList':
  api + 'movieApi/movie/v2/findComingSoonMovieList?page=1&&count=5',
  // 热门电影
  'findHotMovieList':
  api + 'movieApi/movie/v2/findHotMovieList?page=1&&count=10',
  // 推荐影院
  'COMMEND': api + 'movieApi/cinema/v1/findRecommendCinemas?page=1&&count=10',
  // 附近影院
  'NEARBY': api + 'movieApi/cinema/v1/findNearbyCinemas?page=1&&count=10',
  // 区域Id
  'REGION': api + 'movieApi/tool/v2/findRegionList',
  //电影详情
  'DETAIL': api + 'movieApi/movie/v2/findMoviesDetail?movieId=',
  // 电影关注
  'USERFOLLOWMOVIELIST':
  api + 'movieApi/user/v2/verify/findUserFollowMovieList?page=1&&count=5',
  // 影院关注
  'USERFOLLOWCINEMALIST':
  api + 'movieApi/user/v2/verify/findUserFollowCinemaList?page=1&&count=5',
  //我的预约
  'FINDUSERRESERVE': api + 'movieApi/user/v2/verify/findUserReserve',
  //购票记录待付款
  'FINDUSERBUYTICKETRECORD_ONE': api +
      'movieApi/user/v2/verify/findUserBuyTicketRecord?page=1&&count=5&&status=1',
  //购票记录已付款
  'FINDUSERBUYTICKETRECORD_TWO': api +
      'movieApi/user/v2/verify/findUserBuyTicketRecord?page=1&&count=5&&status=2',
  //看过的电影
  'FINDSEENMOVIE': api + 'movieApi/user/v2/verify/findSeenMovie',
  //用户评论
  'FINDUSERFOLLOWMOVIELIST':
  api + 'movieApi/user/v2/verify/findUserFollowMovieList',
};
