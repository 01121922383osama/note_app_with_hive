import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_sat/App/AppBar/app_bar_app.dart';
import 'package:note_app_sat/App/List%20View/list_view_app.dart';
import 'package:note_app_sat/App/Text%20Field/scaffold_text_feild.dart';
import 'package:note_app_sat/Models/data_model.dart';
import 'package:note_app_sat/cubit/remove_cubit.dart';
import 'package:note_app_sat/customs/custom_color.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          const Expanded(child: ListViewApp()),
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
            child: const Icon(
              size: 30,
              color: Colors.white,
              Icons.note_add_outlined,
            ),
          );
        },
      ),
    );
  }
}
