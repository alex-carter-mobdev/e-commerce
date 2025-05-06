import 'package:e_commerce/features/settings/viewModel/bloc/profile_event.dart';
import 'package:e_commerce/features/settings/viewModel/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<ChangeProfileData>((event, emit) {
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
