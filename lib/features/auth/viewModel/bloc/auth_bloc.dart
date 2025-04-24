import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, String> {
  AuthBloc() : super('') {
    on<AuthSaveEmail>((event, emit) {
      emit(AuthSaveEmail.email);
    });
  }
}
