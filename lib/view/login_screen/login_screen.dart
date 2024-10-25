import 'package:flutter/material.dart';
import 'package:library_management/controller/registration_controller.dart';
import 'package:library_management/utils/colorConstants.dart';
import 'package:library_management/view/homescreen/homescreen.dart';
import 'package:library_management/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => RegistrationController.initPreferences,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Please sign in to continue',
                      style: TextStyle(
                          color: Colorconstants.GREY_COLOUR, fontSize: 17),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    textfield(
                        'EMAIL', Icon(Icons.email_outlined), _emailController),
                    SizedBox(
                      height: 20,
                    ),
                    textfield(
                        'PASSWORD', Icon(Icons.lock_outline), _passController),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              
                              if (RegistrationController.getEmail() ==
                                      _emailController.text &&
                                  RegistrationController.getPass() ==
                                      _passController.text) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homescreen(),
                                    ));
                              }
                              else {
                                 ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Wrong Credentials')));
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                                color: Colorconstants.LOGIN_BUTTON_COLOUR,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Text(
                                  'LOGIN  ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colorconstants.GREY_COLOUR),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colorconstants.LOGIN_BUTTON_COLOUR),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container textfield(
      String text, Icon icon, TextEditingController _textController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colorconstants.GREY_COLOUR,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 2))
          ]),
      child: TextFormField(
        validator: text == 'EMAIL'
            ? (value) {
                final RegExp emailRegExp = RegExp(
                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                );
                if (value == null || value.isEmpty) {
                  return 'Enter a valid email id';
                } else if (emailRegExp.hasMatch(value)) {
                  return null;
                }
              }
            : (value) {
                if (value!.length < 6) {
                  return 'Enter a valid password';
                }
                return null;
              },
        controller: _textController,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: icon,
            iconColor: Colors.black,
            hintText: text,
            hintStyle: TextStyle(color: Colorconstants.GREY_COLOUR)),
      ),
    );
  }
}
