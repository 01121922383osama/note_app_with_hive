import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_sat/Splash/Animated%20Splash/scaffold_animated_splash.dart';
import 'package:note_app_sat/cubit/remove_cubit.dart';

void main() {
  runApp(const TestNoteApp());
}

class TestNoteApp extends StatelessWidget {
  const TestNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveCubit(),
      child: MaterialApp(
        title: 'Note App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Pon',
        ),
        home: const ScaffoldAnimatedSplash(),
      ),
    );
  }
}



/*
import 'package:introduction_screen/introduction_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
flutter pub run flutter_launcher_icons
*/ 