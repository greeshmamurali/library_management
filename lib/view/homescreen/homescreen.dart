import 'package:flutter/material.dart';
import 'package:library_management/controller/registration_controller.dart';
import 'package:library_management/utils/colorConstants.dart';
import 'package:library_management/utils/imageConstants.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameContainer(context),
          SizedBox(
            height: 20,
          ),
          studentContainer(),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BOOK',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Text(
                  'View All ->',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                addAndDeleteContainer(
                    title: 'ADD ', image: Imageconstants.BOOK_ADD),
                addAndDeleteContainer(
                    title: 'DELETE ', image: Imageconstants.BOOK_DELETE),
              ],
            )
                    ],
                  ),
          )
         

        ],
      ),
    );
  }

  Padding studentContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'STUDENT',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Text(
                'View All ->',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              addAndDeleteContainer(
                  title: 'ADD ', image: Imageconstants.STUDENT_ADD),
              addAndDeleteContainer(
                  title: 'DELETE ', image: Imageconstants.STUDENT_DELETE),
            ],
          )
        ],
      ),
    );
  }

  Container addAndDeleteContainer({String? title, String? image}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image(
            image: AssetImage(image!),
            height: 80,
            width: 100,
          ),
          Center(
            child: Text(
              
              title!,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Container nameContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * .15,
      decoration: BoxDecoration(
          color: Colorconstants.HOME_1,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            child: Icon(Icons.person),
          ),
          Text(
            '  Jackson Marchetti',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
