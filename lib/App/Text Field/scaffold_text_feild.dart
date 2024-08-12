import 'package:flutter/material.dart';
import 'package:note_app_sat/App/AppBar/app_bar_app.dart';
import 'package:note_app_sat/App/Text%20Field/custom_text_feild.dart';
import 'package:note_app_sat/Models/data_model.dart';
import 'package:note_app_sat/customs/custom_color.dart';

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
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 500,
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
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFeild(
                    hintText: 'Content',
                    maxlines: 5,
                    minlines: 5,
                    textInputAction: TextInputAction.done,
                    controller: contentcontroller,
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(16),
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
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
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
