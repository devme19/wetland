import 'package:get_storage/get_storage.dart';
import 'package:wetland/core/error/exceptions.dart';

abstract class WetlandsLocalDataSource{
  saveToken(String token);
  String getToken();
  bool logOut();

}

class WetlandsLocalDataSourceImpl implements WetlandsLocalDataSource{
  GetStorage box;
  final String TOKEN =  "token";
  WetlandsLocalDataSourceImpl(){
    box = GetStorage();
  }
  @override
  String getToken() {
    try{
      return box.read(TOKEN);
    }catch(e){
      throw CacheException();
    }
  }
  @override
  saveToken(String token) {
    try{
      box.write(TOKEN, token);
    }catch(e){
      throw CacheException();
    }
  }
  @override
  bool logOut() {
    try{
      box.remove(TOKEN);
    }catch(e){
      throw CacheException();
    }
    return true;
  }
}