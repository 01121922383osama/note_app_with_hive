import 'package:flutter/material.dart';

class ContainsSplash extends StatelessWidget {
  const ContainsSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/macos-mobile-app-note-taking-ios-ipad-png-icon-summary-download-0d9929b54f32c4557ea5f94d8fa5b228.png',
            width: 250,
            height: 250,
          ),
          const Text(
            'Note App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
