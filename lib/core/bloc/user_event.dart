abstract class UserEvent {}

class SetUserData extends UserEvent {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  final List<Map<String, String>>? addresses;
  final List<Map<String, String>>? payments;
  final List<Map<String, String>>? favorites;

  SetUserData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.addresses,
    this.payments,
    this.favorites,
  });
}

class ReFetchUserData extends UserEvent {}
