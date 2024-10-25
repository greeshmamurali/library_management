import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController {
  static late final SharedPreferences prefs;

  static Future initPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future readData(String name, String email, String pass) async {
    await prefs.setString('name', name);

    await prefs.setString('email', email);

    await prefs.setString('pass', pass);
  }

  static getName() {
    return prefs.getString('name');
  }

  static getEmail() {
    return prefs.getString('email');
  }

  static getPass() {
    return prefs.getString('pass');
  }
}
