part of 'checkout_bloc.dart';

abstract class CheckoutEvent {}

class SetCheckoutData extends CheckoutEvent {
  final Map<String, String>? address;
  final Map<String, String>? payment;
  final Map<String, dynamic>? prices;

  SetCheckoutData({this.address, this.payment, this.prices});
}
