import 'package:flutter/material.dart';
import 'package:note_app_sat/Core/Constant/app_size.dart';
import 'package:note_app_sat/Core/Constant/color_app.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key, required this.text, required this.icon});
  final String text;
  final IconButton icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: appSize(context, 60, 80, 90).toDouble(),
      decoration: const BoxDecoration(
        color: kMainColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: appSize(context, 5, 20, 30).toDouble(),
          right: appSize(context, 10, 20, 30).toDouble(),
          left: appSize(context, 10, 20, 30).toDouble(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: appSize(context, 30, 40, 50).toDouble(),
              height: appSize(context, 30, 40, 50).toDouble(),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(
                    appSize(context, 10, 12, 14).toDouble()),
              ),
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}
