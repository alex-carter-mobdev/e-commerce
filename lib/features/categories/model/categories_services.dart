import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/dio_api.dart';
import 'package:e_commerce/core/utils/logger.dart';

class CategoriesServices {
  final String _endpointcategories = '/categories';

  Future<(bool, String, dynamic)> getCategoriesData() async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic data;

    try {
      var result = await DioInstance().get(_endpointcategories);

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      data = result.data['data'];

      logger.i(result.data);

      return (isSuccess, error, data);
    } catch (e, stackTrace) {
      logger.f(e, stackTrace: stackTrace);

      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }
}
