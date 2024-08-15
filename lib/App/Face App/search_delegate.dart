import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app_sat/Models/data_model.dart';

class SearchDelegateWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            close(context, true);
          }
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final data = Hive.box<DataModel>('data_model').values.toList();
    List<DataModel> models = [];

    for (var i = 0; i < data.length; i++) {
      if (data[i].title.toLowerCase().contains(query.toLowerCase())) {
        models.add(data[i]);
      }
    }
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (BuildContext context, int index) {
        final note = models[index];
        return ListTile(
          title: Text(note.title),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final data = Hive.box<DataModel>('data_model').values.toList();
    List<DataModel> models = [];

    for (var i = 0; i < data.length; i++) {
      if (data[i].title.toLowerCase().contains(query.toLowerCase())) {
        models.add(data[i]);
      }
    }
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(models[index].title),
        );
      },
    );
  }
}
