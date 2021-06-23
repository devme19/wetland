import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wetland/core/config/config.dart';

import 'dio_connectivity_request_retrier.dart';
import 'interceptors/refresh_token_interceptor.dart';
import 'interceptors/retry_on_connection_change_interceptor.dart';

class Client{
  static Dio dio = Dio();
  static init(){
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 50000;
    dio.options.receiveTimeout = 90000;
    // dio.options.headers['content-Type']='application/json';
    // initializeInterceptors();
  }
  static initializeInterceptors(){
    GetStorage box = GetStorage();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        box = GetStorage();
        String token = box.read("token");
        if(token!=null)
          options.headers['Authorization']='Bearer $token';
        return options;
      },
    ));
    dio.interceptors.add(RefreshTokenInterceptor());
    dio.interceptors.add(RetryOnConnectionChangeInterceptor(
      requestRetrier: DioConnectivityRequestRetrier(
        connectivity: Connectivity(),
        dio: dio
      )
    ));
  }
}