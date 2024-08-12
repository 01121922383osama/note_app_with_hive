
import 'package:hive/hive.dart';
part 'data_model.g.dart';
@HiveType(typeId: 0)
class DataModel {
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;

  DataModel({required this.title, required this.content});
}
