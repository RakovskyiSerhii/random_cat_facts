import 'package:dio/dio.dart';
import 'package:random_cat_facts/core/failure/failure.dart';
import 'package:random_cat_facts/data/network/repository/base_repository.dart';

typedef NetworkRequest<T> = Future<T> Function();

mixin Invokable on BaseRepository {
  Future<Response> invokeRequest<Response>(NetworkRequest<Response> request) {
    return request.call().catchError((onError) {
      if (onError is DioError) {
        final code = onError.response?.statusCode;
        if (onError.type == DioErrorType.other) {
          throw Failure.networkConnection();
        }
        if (code == 500) {
          throw Failure.fatal();
        }
        final message = onError.response?.statusMessage;
        throw Failure.api(code: code, message: message);
      }
    });
  }
}
