import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/dio_api.dart';

class CartService {
  String endpoint = '/cart';
  String user = '/users/user';

  Future<(bool, String, dynamic)> getUserData() async {
    bool isSuccess = false;
    String error = 'Unexpected, error happend';
    dynamic data;

    try {
      var result = await DioInstance().get(user);

      isSuccess = result.data['success'] ?? false;
      error = result.data['error'] ?? 'Unexpected, error happend';
      data = result.data['data'];

      return (isSuccess, error, data);
    } catch (e, stackTrace) {
      e as DioException;
      isSuccess = false;
      error = '$e \n ${e.response}';

      return (false, error, null);
    }
  }
}
