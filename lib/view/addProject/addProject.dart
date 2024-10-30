import 'package:flutter/material.dart';
import 'package:library_management/controller/addProject_controller.dart';
import 'package:library_management/utils/colorConstants.dart';
import 'package:provider/provider.dart';

class Addproject extends StatefulWidget {
  const Addproject({super.key});

  @override
  State<Addproject> createState() => _AddprojectState();
}

class _AddprojectState extends State<Addproject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('NEW PROJECT',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),

            SizedBox(
              height: 30,
            ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PROJECT NAME',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1, color: Colorconstants.GREY_COLOUR)),
                          hintText: 'PROJECT NAME',
                          hintStyle: TextStyle(
                              color: Colorconstants.GREY_COLOUR, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'START DATE',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colorconstants.GREY_COLOUR)),
                                hintText: 'dd-mm-yy',
                                hintStyle: TextStyle(
                                    color: Colorconstants.GREY_COLOUR,
                                    fontSize: 18)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'END DATE',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colorconstants.GREY_COLOUR)),
                                hintText: 'dd-mm-yy',
                                hintStyle: TextStyle(
                                    color: Colorconstants.GREY_COLOUR,
                                    fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      minLines: 1,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'PROJECT DESCRIPTION',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1, color: Colorconstants.GREY_COLOUR)),
                        hintText: 'PROJECT DESCRIPTION',
                        hintStyle: TextStyle(
                          color: Colorconstants.GREY_COLOUR,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'PROJECT ROLES',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 10,),
                      
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          context.watch<AddprojectController>().itemCount,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'NAME',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color:
                                                Colorconstants.GREY_COLOUR)),
                                    hintText: 'NAME',
                                    hintStyle: TextStyle(
                                        color: Colorconstants.GREY_COLOUR,
                                        fontSize: 18)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'TASK',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color:
                                                Colorconstants.GREY_COLOUR)),
                                    hintText: 'TASK',
                                    hintStyle: TextStyle(
                                        color: Colorconstants.GREY_COLOUR,
                                        fontSize: 18)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => context.read<AddprojectController>().addProjectRole(index),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            backgroundColor: WidgetStatePropertyAll(Colors.blue)
                          ),
                          onPressed: () {
                          
                        }, child: Text('Create',
                        style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold
                        ),)),

                        SizedBox(width: 10,),

                        TextButton(
                           style: ButtonStyle(
                             shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            backgroundColor: WidgetStatePropertyAll(Colors.blue)
                          ),
                          onPressed: () {
                          
                        }, child: Text('Delete',
                        style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold
                        ),
                        ) )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
