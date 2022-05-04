import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:dio/dio.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final LocalSecurityStorage _localSecurityStorage;  
  final Logger _log;

  AuthInterceptor({
    required LocalStorage localStorage,
    required LocalSecurityStorage localSecurityStorage,    
    required Logger log,
  })  : _localStorage = localStorage,
        _localSecurityStorage = localSecurityStorage,
        _log = log;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['auth_required'] == true) {
      final accessToken =
          await _localStorage.read<String>(Constants.ACCESS_TOKEN_KEY);
      print('Auth_Intercep ${accessToken}');
      if (accessToken == null) {
        //Logout!!!!

         handler.reject(
          DioError(
            requestOptions: options,
            error: 'Expire Token',
            type: DioErrorType.cancel,
          ),
        );
      }
      options.headers['Authorization'] = accessToken;
    }

    if (!kReleaseMode) {
      _log.append('####################################### REquest log');
      _log.append('URL:${options.uri}');
      _log.append('Method:${options.method}');
      _log.append('Data:${options.data}');
      _log.append('headers:${options.headers}');
      _log.append('####################################### REquest log');

      _log.closeAppend();
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log.append('####################################### Response log');

    _log.append('Data:${response.data}');
    _log.closeAppend();

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
