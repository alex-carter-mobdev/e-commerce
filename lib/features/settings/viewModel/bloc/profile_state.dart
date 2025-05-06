class ProfileState {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int age;
  final List<Map<String, String>> addresses;
  final List<Map<String, String>> payments;
  final List<Map<String, String>> favorites;

  const ProfileState({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.gender = '',
    this.age = 0,
    this.addresses = const [
      {"": ""},
    ],
    this.payments = const [
      {"": ""},
    ],
    this.favorites = const [
      {"": ""},
    ],
  });

  ProfileState copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    int? age,
    List<Map<String, String>>? addresses,
    List<Map<String, String>>? payments,
    List<Map<String, String>>? favorites,
  }) {
    return ProfileState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      addresses: addresses ?? this.addresses,
      payments: payments ?? this.payments,
      favorites: favorites ?? this.favorites,
    );
  }

  // final String createdAt;
  // final String updatedAt;
  // final String __v;
}
        // "_id": "680fc416f6ad52877d731a1f",
        // "firstName": "sdfad",
        // "lastName": "weqweqwe",
        // "email": "1@gmail.com",
        // "gender": null,
        // "age": null,
        // "addresses": [
        //     {
        //         "street": "updated",
        //         "city": "updated",
        //         "state": "updated",
        //         "zipCode": "updated",
        //         "_id": "680fc489f6ad52877d731a26",
        //         "createdAt": "2025-04-28T18:10:17.546Z",
        //         "updatedAt": "2025-04-28T18:12:04.696Z"
        //     }
        // ],
        // "createdAt": "2025-04-28T18:08:22.389Z",
        // "updatedAt": "2025-05-04T10:37:23.718Z",
        // "__v": 8,
        // "payments": [
        //     {
        //         "cardNumber": "moskowskiy 1",
        //         "cardName": "ashgabat 1",
        //         "ccv": "looool",
        //         "expireDate": "744000",
        //         "_id": "680fc8957bddd00350fcf632",
        //         "createdAt": "2025-04-28T18:27:33.028Z",
        //         "updatedAt": "2025-04-28T18:28:27.961Z"
        //     },
        //     {
        //         "cardNumber": "moskowskiy 1 del",
        //         "cardName": "ashgabat 1",
        //         "ccv": "Ahal 1",
        //         "expireDate": "744000",
        //         "_id": "6814be809b91b10270a9b927",
        //         "createdAt": "2025-05-02T12:45:52.840Z",
        //         "updatedAt": "2025-05-02T12:45:52.840Z"
        //     },
        //     {
        //         "cardNumber": "moskowskiy 1 del",
        //         "cardName": "ashgabat 1",
        //         "ccv": "Ahal 1",
        //         "expireDate": "744000",
        //         "_id": "6814d647f6f10cc573fd6768",
        //         "createdAt": "2025-05-02T14:27:19.276Z",
        //         "updatedAt": "2025-05-02T14:27:19.276Z"
        //     }
        // ],
        // "favorites": []
  