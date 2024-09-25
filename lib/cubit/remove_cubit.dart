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
  }
}
