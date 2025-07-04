import 'package:bloc/bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState()) {
    on<SetCheckoutData>((event, emit) {
      emit(
        state.copyWith(
          address: event.address,
          payment: event.payment,
          prices: event.prices,
        ),
      );
    });
  }
}
