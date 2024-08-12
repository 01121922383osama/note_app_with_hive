
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
  }
}
