<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app_sat/Models/data_model.dart';

class RemoveCubit extends Cubit<List<DataModel>> {
  RemoveCubit() : super([]);

  void loadAllData() {
    final data = Hive.box<DataModel>('data_model');
    emit(data.values.toList());
  }

  void removeData(int index) {
    final box = Hive.box<DataModel>('data_model');
    box.deleteAt(index);
    emit(box.values.toList());
  }

  void addNote(DataModel data) {
    final box = Hive.box<DataModel>('data_model');
    box.add(data);
    emit(box.values.toList());
=======

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:note_app_sat/Data/Models/data_model.dart';

class RemoveCubit extends Cubit<List<DataModel>> {
  final Box<DataModel> notesBox;
  RemoveCubit(this.notesBox) : super([]) {
    emit(notesBox.values.toList());
  }
  void removeData(int index) {
    notesBox.deleteAt(index);
    emit(notesBox.values.toList());
  }

  void addNote(DataModel data) {
    notesBox.add(data);

    emit(notesBox.values.toList());
>>>>>>> 63769038867a6e963eafcd0238ac701b9f851400
  }
}
