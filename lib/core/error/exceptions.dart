
class ServerException implements Exception {
  int errorCode;
  List<String> errorMessage;
  String url;

  ServerException(int errorCode,String url){
    errorMessage = new List();
    this.errorCode = errorCode;
    // if(errorCode == 401 && !url.contains("login")) {
    //
    //   Get.offAllNamed(NavidAppRoutes.loginPage);
    // } else
    // if(errorCode == 401 && url.contains("login"))
    //   errorMessage.add("incorrectLogin".tr);
    // else
    // if(errorCode == 402 && url.contains("user/reset"))
    //   errorMessage.add("User not exist".tr);
    // else
    // if(errorCode == 422&& url.contains("register"))
    //   errorMessage.add("The email has already been taken".tr);
    // else
    // if(errorCode == 422&& url.contains("changePassword"))
    //   errorMessage.add("Old Password does not match".tr);
    // else
    //   if(errorCode==0 || errorCode == 1)
    //     errorMessage.add("unable to connect".tr);
    //   else
    //     errorMessage.add("Unhandled error".tr);
}
}

class CacheException implements Exception {}
