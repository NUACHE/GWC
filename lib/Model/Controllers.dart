import 'package:http/http.dart' as http;

class MyMethods {
//  String _user_email;
//  String _last_name;
//  String _first_name;
//  String _phone_no;
//  String digital_address;
//  String address_street;
//  String address_city;
//  String address_region;
//  String password;
  String meterId;

  MyMethods();

  postSignUp() {}

  Future<http.Response> updateBalance() async {
    Uri hello = new Uri();

    var balance = await http.get(hello);
    return balance;
  }
}
