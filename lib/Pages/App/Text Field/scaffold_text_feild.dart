import 'package:flutter/material.dart';
import 'package:note_app_sat/Core/Constant/app_size.dart';
import 'package:note_app_sat/Core/Constant/color_app.dart';
import 'package:note_app_sat/Data/Models/data_model.dart';
import 'package:note_app_sat/Pages/App/AppBar/app_bar_app.dart';
import 'package:note_app_sat/Pages/App/Text%20Field/custom_text_feild.dart';

class ScaffoldTextFeild extends StatelessWidget {
  ScaffoldTextFeild({super.key});

  final titlecontroller = TextEditingController();

  final contentcontroller = TextEditingController();

  final formk = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarApp(
              text: 'Add Note',
              icon: IconButton(
                onPressed: () {
                  if (formk.currentState != null &&
                      formk.currentState!.validate() &&
                      titlecontroller.text.isNotEmpty &&
                      contentcontroller.text.isNotEmpty) {
                    final newState = DataModel(
                      title: titlecontroller.text,
                      content: contentcontroller.text,
                    );
                    Navigator.of(context).pop(newState);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Center(
                          child: Text(
                            'There is no Data',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: appSize(context, 15, 25, 30).toDouble(),
                ),
              ),
            ),
            SizedBox(
              height: appSize(context, 80, 500, 500).toDouble(),
            ),
            Form(
              key: formk,
              child: Column(
                children: [
                  CustomTextFeild(
                    hintText: 'Title',
                    maxlines: 1,
                    minlines: 1,
                    textInputAction: TextInputAction.next,
                    controller: titlecontroller,
                  ),
                  SizedBox(
                    height: appSize(context, 10, 20, 30).toDouble(),
                  ),
                  CustomTextFeild(
                    hintText: 'Content',
                    maxlines: appSize(context, 4, 5, 6).toInt(),
                    minlines: appSize(context, 4, 5, 6).toInt(),
                    textInputAction: TextInputAction.done,
                    controller: contentcontroller,
                  ),
                  SizedBox(
                    height: appSize(context, 60, 130, 150).toDouble(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: appSize(context, 40, 100, 150).toDouble(),
                      right: appSize(context, 40, 100, 150).toDouble(),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: appSize(context, 50, 90, 110).toDouble(),
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(
                            appSize(context, 10, 12, 16).toDouble()),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (formk.currentState != null &&
                              formk.currentState!.validate() &&
                              titlecontroller.text.isNotEmpty &&
                              contentcontroller.text.isNotEmpty) {
                            final newState = DataModel(
                              title: titlecontroller.text,
                              content: contentcontroller.text,
                            );
                            Navigator.of(context).pop(newState);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Center(
                                  child: Text(
                                    'There is no Data',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: appSize(context, 18, 24, 28).toDouble(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
