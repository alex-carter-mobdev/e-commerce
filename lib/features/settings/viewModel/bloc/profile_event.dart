abstract class ProfileEvent {}

class ChangeProfileData extends ProfileEvent {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int age;
  final List<Map<String, String>> addresses;
  final List<Map<String, String>> payments;
  final List<Map<String, String>> favorites;

  ChangeProfileData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
    required this.addresses,
    required this.payments,
    required this.favorites,
  });
}
