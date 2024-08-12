import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:note_app_sat/App/Face%20App/scaffold_face_app.dart';
import 'package:note_app_sat/customs/custom_color.dart';

class IntroductionSplash extends StatelessWidget {
  const IntroductionSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Text(
              'Tne Note',
              style: TextStyle(
                color: kMainColor,
                fontSize: 35,
              ),
            ),
            bodyWidget: const Text(
              'To save the data and help you to be a weak man ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            image: Image.asset(
              'assets/images/7euer5dhr0vh825k6vnu9i9ugv.png',
              width: 800,
              height: 400,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              'Tne Data',
              style: TextStyle(
                color: kMainColor,
                fontSize: 35,
              ),
            ),
            bodyWidget: const Text(
              'To save the data and help you to be a weak man ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            image: Image.asset(
              'assets/images/project-management-project-manager-business-meeting-of-the-company-b99d50bf727696759dc597ff393497b1.png',
              width: 800,
              height: 400,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              'Save Data & Note',
              style: TextStyle(
                color: kMainColor,
                fontSize: 35,
              ),
            ),
            bodyWidget: const Text(
              'To save the data and help you to be a weak man ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            image: Image.asset(
              'assets/images/management-consulting-business-model-plan-business-d52bd1ccb6b07280b68fc64211c0bbef.png',
              width: 800,
              height: 400,
            ),
          ),
        ],
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ScaffoldFaceApp(),
            ),
          );
        },
        onSkip: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ScaffoldFaceApp(),
            ),
          );
        },
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            color: kMainColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
          color: kMainColor,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
            color: kMainColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(30.0, 12.0),
          color: Colors.black45,
          activeColor: kMainColor,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
