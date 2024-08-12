import 'package:flutter/material.dart';
import 'package:note_app_sat/Core/Constant/app_size.dart';

class ContainsSplash extends StatelessWidget {
  const ContainsSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/macos-mobile-app-note-taking-ios-ipad-png-icon-summary-download-0d9929b54f32c4557ea5f94d8fa5b228.png',
            width: appSize(context, 100, 250, 350).toDouble(),
            height: appSize(context, 100, 250, 350).toDouble(),
          ),
          Text(
            'Note App',
            style: TextStyle(
              color: Colors.white,
              fontSize: appSize(context, 24, 35, 45).toDouble(),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
