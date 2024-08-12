import 'package:flutter/material.dart';
import 'package:note_app_sat/customs/custom_color.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key, required this.text, required this.icon});
  final String text;
  final IconButton icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: const BoxDecoration(
        color: kMainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
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
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}
