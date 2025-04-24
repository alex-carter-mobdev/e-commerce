import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/dio_api.dart';
import 'package:e_commerce/core/utils/logger.dart';
// import 'package:e_commerce/core/utils/toast.dart';

class AuthService {
  final String _endpoint = '/auth';

  Future<(bool, String)> signUp(Map<String, dynamic> data) async {
    try {
      var res = await DioInstance().post('$_endpoint/sign-up', data: data);
      bool isSuccess = res.data['success'] ?? false;
      String error = res.data['error'] ?? '';

      return (isSuccess, error);
    } catch (e, stacktree) {
      e as DioException;
      logger.e('${e.response}', stackTrace: stacktree);
      return (false, "${e.response?.data['error']}");
    }
  }

  Future<(bool, String)> signIn(Map<String, dynamic> data) async {
    try {
      var res = await DioInstance().post('$_endpoint/sign-in', data: data);
      bool isSuccess = res.data['success'] ?? false;
      String error = res.data['error'] ?? '';
      return (isSuccess, error);
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return (false, "${e.response?.data['error'] ?? e.message}");
    }
  }

  Future<(bool, String)> forgotPassword(Map<String, dynamic> data) async {
    try {
      var res = await DioInstance().post(
        '$_endpoint/forgot-password',
        data: data,
      );
      bool isSuccess = res.data['success'] ?? false;
      String error = res.data['error'] ?? '';

      return (isSuccess, error);
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return (false, "${e.response?.data['error']}");
    }
  }

  Future<(bool, String)> resetPassword(Map<String, dynamic> data) async {
    try {
      var res = await DioInstance().post(
        '$_endpoint/reset-password',
        data: data,
      );
      bool isSuccess = res.data['success'] ?? false;
      String error = res.data['error'] ?? '';

      return (isSuccess, error);
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return (false, "${e.response?.data['error']}");
    }
  }

  Future<(bool, String)> updateUserData(Map<String, dynamic> data) async {
    try {
      var res = await DioInstance().put('/users/user', data: data);
      bool isSuccess = res.data['success'] ?? false;
      String error = res.data['error'] ?? '';

      return (isSuccess, error);
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return (false, "${e.response?.data['error']}");
    }
  }
}
