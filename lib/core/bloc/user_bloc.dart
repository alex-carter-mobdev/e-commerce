import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:e_commerce/core/bloc/user_state.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User extends Bloc<UserEvent, UserState> {
  User() : super(UserState()) {
    on<ReFetchUserData>((event, emit) async {
      var res = await SettingsService().getUserData();
      var data = res.$3;
      if (res.$1 && data != null) {
        emit(
          state.copyWith(
            id: data['_id'] as String?,
            firstName: data['firstName'] as String?,
            lastName: data['lastName'] as String?,
            email: data['email'] as String?,
            age: data['age'] as int?,
            gender: data['gender'] as String?,
            addresses: cast(data, 'addresses'),
            payments: cast(data, 'payments'),
            favorites: cast(data, 'favorites'),
          ),
        );
      } else {
        Toastify.e(res.$2);
        // emit(state.copyWith());
      }
    });
    on<SetUserData>((event, emit) {
      emit(
        state.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          addresses: event.addresses,
          payments: event.payments,
          favorites: event.favorites,
        ),
      );
    });
  }
}

List<Map<String, String>>? cast(data, key) {
  logger.e(data[key]);
  return (data[key] as List?)?.map((e) {
    logger.e(e);

    return Map<String, String>.from(e);
  }).toList();
}
