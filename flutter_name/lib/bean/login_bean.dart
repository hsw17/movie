class Login_Bean {
  Result result;
  String message;
  String status;

  Login_Bean({this.result, this.message, this.status});

  Login_Bean.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String sessionId;
  int userId;
  UserInfo userInfo;

  Result({this.sessionId, this.userId, this.userInfo});

  Result.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    userId = json['userId'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionId'] = this.sessionId;
    data['userId'] = this.userId;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    return data;
  }
}

class UserInfo {
  String email;
  String headPic;
  int id;
  int lastLoginTime;
  String nickName;
  int sex;

  UserInfo(
      {this.email,
      this.headPic,
      this.id,
      this.lastLoginTime,
      this.nickName,
      this.sex});

  UserInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    headPic = json['headPic'];
    id = json['id'];
    lastLoginTime = json['lastLoginTime'];
    nickName = json['nickName'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['headPic'] = this.headPic;
    data['id'] = this.id;
    data['lastLoginTime'] = this.lastLoginTime;
    data['nickName'] = this.nickName;
    data['sex'] = this.sex;
    return data;
  }
}
