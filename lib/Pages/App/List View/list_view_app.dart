import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_sat/Core/Constant/app_size.dart';
import 'package:note_app_sat/Core/Constant/color_app.dart';
import 'package:note_app_sat/Data/Models/data_model.dart';
import 'package:note_app_sat/cubit/remove_cubit.dart';

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  String _formatDate(DateTime dateTime) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    String month = months[dateTime.month - 1];
    String year = dateTime.year.toString();
    String day = dateTime.day.toString().padLeft(2, '0');

    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoveCubit, List<DataModel>>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: appSize(context, 10, 20, 30).toDouble(),
                  vertical: 5),
              padding: EdgeInsets.all(appSize(context, 5, 15, 25).toDouble()),
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(
                    appSize(context, 12, 16, 20).toDouble()),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: Text(
                      state[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(
                          top: appSize(context, 5, 20, 30).toDouble(),
                          bottom: appSize(context, 10, 25, 35).toDouble()),
                      child: Text(
                        state[index].content,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 211, 209, 209),
                            title: Text(
                              'Warning!',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    appSize(context, 18, 24, 22).toDouble(),
                              ),
                            ),
                            content: Text(
                              'Are You Sure?',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize:
                                    appSize(context, 16, 18, 22).toDouble(),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      shadowColor: Colors.black,
                                      backgroundColor: kMainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          appSize(context, 10, 12, 14)
                                              .toDouble(),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: appSize(context, 14, 18, 22)
                                            .toDouble(),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      shadowColor: Colors.black,
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          appSize(context, 10, 12, 14)
                                              .toDouble(),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<RemoveCubit>()
                                          .removeData(index);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: appSize(context, 14, 18, 22)
                                            .toDouble(),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      icon: Icon(
                        color: Colors.white,
                        size: appSize(context, 20, 20, 25).toDouble(),
                        Icons.delete,
                      ),
                    ),
                  ),
                  Text(
                    _formatDate(DateTime.now()),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: appSize(context, 12, 16, 20).toDouble(),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
