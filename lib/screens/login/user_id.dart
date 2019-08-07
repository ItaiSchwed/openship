class UserId {
  UserId._privateConstructor();

  static final UserId _instance = UserId._privateConstructor();

  factory UserId(){
    return _instance;
  }

  String userId;
}