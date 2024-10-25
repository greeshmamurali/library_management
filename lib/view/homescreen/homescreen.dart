import 'package:flutter/material.dart';
import 'package:library_management/controller/registration_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        RegistrationController.initPreferences();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: () => onMenuTap, child: Icon(Icons.menu)),
        title: Text(
          'Hi Alen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  onMenuTap() {
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {},
    );
  }
}
