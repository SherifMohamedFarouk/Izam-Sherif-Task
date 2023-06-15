
class LoginModel{
  final String email , password;
  final int loginCount;

  LoginModel({required this.email,required this.loginCount,required this.password});

  LoginModel.fromMap(Map<String, dynamic> item):
        email=item["email"], password= item["password"],loginCount =item["login_count"] ;

  Map<String, Object> toMap(){
    return {'email':email,'password': password,"login_count":loginCount};
  }
}
