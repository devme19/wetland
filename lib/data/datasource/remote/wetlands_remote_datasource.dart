import 'dart:async';
import 'package:dio/dio.dart';
import 'package:wetland/core/error/exceptions.dart';
import 'package:wetland/core/generics.dart';
import '../../client.dart';


abstract class WetlandsRemoteDataSource {
  Future<T> get<T, K>(String url);
  Future<T> post<T, K>(Map body, String url);
}
class WetlandsRemoteDataSourceImpl implements WetlandsRemoteDataSource {
  @override
  Future<T> get<T, K>(String url) async {
    try {
      final response = await Client.dio.get(url);
      if (response.statusCode == 200) {
        if (T == bool)
          return true as T;
        return Generics.fromJson<T, K>(response.data);
      }
    } on DioError catch (e) {
      throw ServerException(e.response.statusCode, url);
    }
  }

  @override
  Future<T> post<T, K>(Map body, String url) async {
    // TODO: implement post
    try {
      Response response = await Client.dio.post(url, data: body);
      if (response.statusCode == 200) {
        if (T == bool) return true as T;
        return Generics.fromJson<T, K>(response.data);
      }
    } on DioError catch (e) {
      throw ServerException(e.response.statusCode, url);
    }
  }
}
