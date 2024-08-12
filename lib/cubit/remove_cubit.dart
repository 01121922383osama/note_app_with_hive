import 'package:bloc/bloc.dart';

import 'package:note_app_sat/Models/data_model.dart';

class RemoveCubit extends Cubit<List<DataModel>> {
  RemoveCubit() : super([]);
  void removeData(int index) {
    final removeList = List<DataModel>.from(state)..removeAt(index);
    emit(removeList);
  }

  void addNote(DataModel data) {
    final addData = List<DataModel>.from(state)..add(data);
    emit(addData);
  }
}
