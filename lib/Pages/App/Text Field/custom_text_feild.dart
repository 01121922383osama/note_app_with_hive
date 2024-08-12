import 'package:flutter/material.dart';
import 'package:note_app_sat/Core/Constant/app_size.dart';
import 'package:note_app_sat/Core/Constant/color_app.dart';


class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.maxlines,
    required this.minlines,
    required this.textInputAction,
    required this.controller,
  });
  final String hintText;
  final int maxlines;
  final int minlines;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.only(left: appSize(context, 10, 20, 30).toDouble(), right: appSize(context, 10, 20, 30).toDouble()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter The Data to Save';
                }
                return null;
              },
              minLines: minlines,
              textInputAction: textInputAction,
              maxLines: maxlines,
              cursorColor: kMainColor,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: kMainColor,
                  fontSize: 24,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kMainColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kMainColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kMainColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kMainColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
