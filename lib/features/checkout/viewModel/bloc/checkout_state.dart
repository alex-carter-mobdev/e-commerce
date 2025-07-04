part of 'checkout_bloc.dart';

class CheckoutState {
  final Map<String, dynamic> address;
  final Map<String, dynamic> payment;
  final Map<String, dynamic> prices;

  CheckoutState({
    this.address = const {},
    this.payment = const {},
    this.prices = const {},
  });

  CheckoutState copyWith({
    Map<String, dynamic>? address,
    Map<String, dynamic>? payment,
    Map<String, dynamic>? prices,
  }) {
    return CheckoutState(
      address: address ?? this.address,
      payment: payment ?? this.payment,
      prices: prices ?? this.prices,
    );
  }
}
