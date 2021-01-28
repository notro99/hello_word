import 'package:hello_word_android_studio/models/address.dart';

class Profile {
  int id;
  String name;
  String phone;
  String email;
  List<Address> addresses = [];

  Profile({
    this.id = 1,
    this.name = '',
    this.phone = '',
    this.email = '',
    this.addresses,
  });

  void addAddress(Address address) {
    addresses.add(address);
  }

  void removeAddress(Address address) {
    addresses.remove(address);
  }

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
