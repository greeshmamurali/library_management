import 'package:flutter/material.dart';
import 'package:library_management/controller/registration_controller.dart';
import 'package:library_management/utils/colorConstants.dart';
import 'package:library_management/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmpassController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                
                    //FULL NAME CONTAINER
                    Container(
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
                                              validator: (value) {
                      final RegExp nameRegExp = RegExp(r"^[a-zA-Z\s]+$");
                                      
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      } else if (!nameRegExp.hasMatch(value)) {
                        return 'Enter a valid name (only letters and spaces allowed)';
                      } else if (value.length <= 2) {
                        return 'Name should be at least 2 characters long';
                      }
                      return null;
                                              },
                                              controller: _nameController,
                                              decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                        iconColor: Colors.black,
                        hintText: 'FULL NAME',
                        hintStyle: TextStyle(
                            color: Colorconstants.GREY_COLOUR,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                                            ),
                    ),
                
                    SizedBox(
                      height: 15,
                    ),
                
                    //EMAIL
                    Container(
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
                                              validator: (value) {
                      final RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                      );
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid email id';
                      } else if (emailRegExp.hasMatch(value)) {
                        return null;
                      }
                                              },
                                              controller: _emailController,
                                              decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                        iconColor: Colors.black,
                        hintText: 'EMAIL',
                        hintStyle: TextStyle(
                            color: Colorconstants.GREY_COLOUR,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                
                    //PASSWORD
                    Container(
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
                                              validator: (value) {
                      if (value!.length < 6) {
                        return 'Enter a valid password';
                      }
                      return null;
                                              },
                                              controller: _passController,
                                              decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                        iconColor: Colors.black,
                        hintText: 'PASSWORD',
                        hintStyle: TextStyle(
                            color: Colorconstants.GREY_COLOUR,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                
                    //CONFIRM PASSWORD
                    Container(
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
                                              validator: (value) {
                      if (_passController.text != value) {
                        return "Passwords don't match";
                      }
                      return null;
                                              },
                                              controller: _confirmpassController,
                                              decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                        iconColor: Colors.black,
                        hintText: 'CONFIRM PASSWORD',
                        hintStyle: TextStyle(
                            color: Colorconstants.GREY_COLOUR,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                                            ),
                    ),
                
                    SizedBox(
                      height: 20,
                    ),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              RegistrationController.readData(
                                  _nameController.text,
                                  _emailController.text,
                                  _passController.text);
                                   ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Account Created Successfully')));
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
                                  'SIGN UP  ',
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
                  "Already have an account? ",
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
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'Sign In',
                      style:
                          TextStyle(color: Colorconstants.LOGIN_BUTTON_COLOUR),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
