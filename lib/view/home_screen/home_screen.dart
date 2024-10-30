import 'package:flutter/material.dart';
import 'package:library_management/utils/colorConstants.dart';
import 'package:library_management/view/addProject/addProject.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addproject(),
                ));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
          backgroundColor: Colorconstants.HOME_1,
          shape: CircleBorder(),
        ),
      ),
      backgroundColor: Colorconstants.HOMESCREEN_BG,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PROJECTNOW',
                    style: TextStyle(
                        color: Colorconstants.HOME_1,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'We make your projects happen!',
                    style: TextStyle(
                        color: Colorconstants.HOME_1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            DefaultTabController(
                length: 3,
                child: Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        tabAlignment: TabAlignment.start,
                        dividerHeight: 0,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        tabs: [
                          Tab(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.checklist_rounded,
                                ),
                                Text(
                                  '   To do',
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.restart_alt,
                                ),
                                Text(
                                  '   In Progress',
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.task_alt,
                                ),
                                Text(
                                  '   Completed',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  'TO DO TASKS',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text('IN PROGRESS'),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text('COMPLETED'),
                              )
                            ],
                          ),
                        ]),
                      )
                    ],
                  ),
                ))
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Colors.white),
            //       child: Row(
            //         children: [
            //           Icon(
            //             Icons.checklist_rounded,
            //             color: Colorconstants.HOME_1,
            //             size: 20,
            //           ),
            //           Text(
            //             '   To do',
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 17),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
