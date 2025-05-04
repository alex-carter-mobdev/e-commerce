import 'package:dio/dio.dart';
import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/core/utils/logger.dart';

class DioInstance {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.10:5000/api'));

  static final DioInstance _instance = DioInstance._internal();
  factory DioInstance() => _instance;

  DioInstance._internal() {
    _addInterceptors();
    logger.i("DioInstance initialized!");
  }

  _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onResponse: onResponse,
        onError: onError,
      ),
    );
  }

  Future<Response> get(String path, {QP? queryParameters}) => _dio.get(
    path,
    queryParameters: queryParameters,
    options: Options(validateStatus: (status) => status != null),
  );

  Future<Response> post(String path, {dynamic data}) => _dio.post(
    path,
    data: data,
    options: Options(validateStatus: (status) => status != null),
  );

  Future<Response> put(String path, {dynamic data}) => _dio.put(
    path,
    data: data,
    options: Options(validateStatus: (status) => status != null),
  );

  Future<Response> delete(String path) => _dio.delete(
    path,
    options: Options(validateStatus: (status) => status != null),
  );

  onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    logger.i('onResponse');
    logger.i(AuthLocalStorage().get());

    Map<String, List<String>> headers = response.headers.map;
    String token =
        headers['authorization'] != null
            ? headers['authorization']!.join('').replaceAll('Bearer ', '')
            : '';
    token != '' ? AuthLocalStorage().set(token) : null;
    logger.i(AuthLocalStorage().get());

    return handler.next(response);
  }

  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('onRequest');
    logger.i(AuthLocalStorage().get());
    String token = AuthLocalStorage().get();
    token != ''
        ? options.headers.addAll({'authorization': 'Bearer $token'})
        : null;
    logger.i(AuthLocalStorage().get());

    return handler.next(options);
  }

  onError(DioException error, ErrorInterceptorHandler handler) {
    logger.e(error);

    return handler.next(error);
  }
}

typedef QP = Map<String, dynamic>;
