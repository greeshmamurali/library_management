import 'package:flutter/material.dart';
import 'package:library_management/controller/addProject_controller.dart';
import 'package:library_management/controller/homescreen_controller.dart';
import 'package:library_management/view/addProject/addProject.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomescreenController(),),
        ChangeNotifierProvider(create: (context) => AddprojectController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Addproject(),
      ),
    );
  }
}
