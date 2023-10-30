import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is InsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          var cubitObj = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                cubitObj.titles[cubitObj.currentIndex],
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubitObj.isBottomSheet) {
                  if (formKey.currentState!.validate()) {
                    cubitObj.insertToDatabase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text,
                    );
                  }
                }
                else {
                  scaffoldKey.currentState?.showBottomSheet(
                        (context) => Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextFormField(
                                controller: titleController,
                                type: TextInputType.text,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Title must not be empty';
                                  }
                                  return null;
                                },
                                labelText: 'Task title',
                                prefix: Icons.title,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              defaultTextFormField(
                                controller: timeController,
                                type: TextInputType.datetime,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text =
                                        value!.format(context).toString();
                                    print(value.format(context));
                                  });
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Time must not be empty';
                                  }
                                  return null;
                                },
                                labelText: 'Task time',
                                prefix: Icons.watch_later_outlined,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              defaultTextFormField(
                                controller: dateController,
                                type: TextInputType.datetime,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2023-12-01'),
                                  ).then((value) {
                                    dateController.text = value.toString();
                                  });
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Date must not be empty';
                                  }
                                  return null;
                                },
                                labelText: 'Task Date',
                                prefix: Icons.calendar_today,
                              ),
                            ],
                          ),
                        ),
                        elevation: 20.0,
                      ).closed.then((value) {
                        Navigator.pop(context);
                    cubitObj.changeBottomSheet(
                      isOpened: false,
                      icon: Icons.edit,
                    );
                  });
                  cubitObj.changeBottomSheet(
                    isOpened: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                cubitObj.fabIcon,
              ),
            ),
            body: ConditionalBuilder(
              condition: cubitObj.newtasks.isNotEmpty,
              builder: (context) => cubitObj.screens[cubitObj.currentIndex],
              fallback: (context) => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              // backgroundColor, elevation, currentIndex, ...etc.
              iconSize: 25.0,
              currentIndex: cubitObj.currentIndex,
              onTap: (index) {
                cubitObj.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
