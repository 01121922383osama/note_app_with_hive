import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD:lib/App/Face App/scaffold_face_app.dart
import 'package:note_app_sat/App/AppBar/app_bar_app.dart';
import 'package:note_app_sat/App/Face%20App/search_delegate.dart';
import 'package:note_app_sat/App/List%20View/list_view_app.dart';
import 'package:note_app_sat/App/Text%20Field/scaffold_text_feild.dart';
import 'package:note_app_sat/Models/data_model.dart';
=======
import 'package:note_app_sat/Core/Constant/app_size.dart';
import 'package:note_app_sat/Core/Constant/color_app.dart';
import 'package:note_app_sat/Data/Models/data_model.dart';
import 'package:note_app_sat/Pages/App/AppBar/app_bar_app.dart';
import 'package:note_app_sat/Pages/App/List%20View/list_view_app.dart';
import 'package:note_app_sat/Pages/App/Text%20Field/scaffold_text_feild.dart';
>>>>>>> 63769038867a6e963eafcd0238ac701b9f851400:lib/Pages/App/Face App/scaffold_face_app.dart
import 'package:note_app_sat/cubit/remove_cubit.dart';

class ScaffoldFaceApp extends StatelessWidget {
  const ScaffoldFaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarApp(
            text: 'Notes',
            icon: IconButton(
<<<<<<< HEAD:lib/App/Face App/scaffold_face_app.dart
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchDelegateWidget(),
                );
              },
              icon: const Icon(
=======
              onPressed: () {},
              icon: Icon(
>>>>>>> 63769038867a6e963eafcd0238ac701b9f851400:lib/Pages/App/Face App/scaffold_face_app.dart
                Icons.search,
                color: Colors.white,
                size: appSize(context, 15, 25, 30).toDouble(),
              ),
            ),
          ),
          const Expanded(
            child: ListViewApp(),
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<RemoveCubit, List<DataModel>>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: kMainColor,
            onPressed: () async {
              final newNote = await Navigator.of(context).push<DataModel>(
                MaterialPageRoute(
                  builder: (context) => ScaffoldTextFeild(),
                ),
              );
              if (newNote != null) {
                if (context.mounted) {
                  context.read<RemoveCubit>().addNote(newNote);
                }
              }
            },
            child: Icon(
              size: appSize(context, 25, 30, 35).toDouble(),
              color: Colors.white,
              Icons.note_add_outlined,
            ),
          );
        },
      ),
    );
  }
}
