import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/dio_api.dart';
import 'package:e_commerce/core/utils/logger.dart';

class SettingsService {
  final String _endpointUsers = '/users/user';
  final String _endpointAddress = '/users/address';
  // ! settings
  Future<(bool, String, dynamic)> getProfileData() async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic data;

    try {
      var result = await DioInstance().get(_endpointUsers);

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      data = result.data['data'];

      logger.i(result.data['data']);

      return (isSuccess, error, data);
    } catch (e, stackTrace) {
      logger.f(e, stackTrace: stackTrace);

      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }

  Future<(bool, String, dynamic)> editProfileData(
    Map<String, dynamic> data,
  ) async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic response;

    try {
      var result = await DioInstance().put(_endpointUsers, data: data);

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      response = result.data['data'];

      logger.i(result.data['data']);

      return (isSuccess, error, response);
    } catch (e, stackTrace) {
      logger.f(e, stackTrace: stackTrace);

      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }

  // // ! address
  Future<(bool, String, dynamic)> addAddress(Map<String, dynamic> data) async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic response;

    try {
      var result = await DioInstance().post('$_endpointAddress/', data: data);

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      response = result.data['data'];

      logger.i(result.data['data']);

      return (isSuccess, error, response);
    } catch (e, stackTrace) {
      logger.f(e, stackTrace: stackTrace);

      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }

  Future<(bool, String, dynamic)> editAddress(
    Map<String, dynamic> data,
    String id,
  ) async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic response;

    try {
      var result = await DioInstance().put('$_endpointAddress/$id', data: data);

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      response = result.data['data'];

      logger.i(result.data['data']);

      return (isSuccess, error, response);
    } catch (e, stackTrace) {
      logger.f(e, stackTrace: stackTrace);

      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }

  Future<(bool, String, dynamic)> deleteAddress(
    Map<String, dynamic> data,
    String id,
  ) async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic response;

    try {
      var result = await DioInstance().delete('$_endpointAddress/$id');

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      response = result.data['data'];

      logger.i(result.data['data']);

      return (isSuccess, error, response);
    } catch (e, stackTrace) {
      logger.f(e, stackTrace: stackTrace);

      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }
}
