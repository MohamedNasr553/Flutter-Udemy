import 'package:flutter/material.dart';
import 'package:flutter_app/modules/todo_app/ArchivedTasks/ArchivedTasks.dart';
import 'package:flutter_app/modules/todo_app/DoneTasks/DoneTasks.dart';
import 'package:flutter_app/modules/todo_app/NewTasks/NewTasks.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_app/shared/network/local/CacheHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const NewTasks(),
    const DoneTasks(),
    const ArchivedTasks(),
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomAppNavBar());
  }

  Database? database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];

  Future<void> createDatabase() async {
    database = await openDatabase(
        'todoApp.db',
        version: 1,
        onCreate: (database, version) {
      print('DataBase Created');
      database.execute(
          'CREATE TABLE TASKS(ID INT PRIMARY KEY, TITLE VARCHAR(50), DATE VARCHAR(50),TIME VARCHAR(50), STATUS VARCHAR(50));'
      ).then((value) {
        print('Table Created');
        emit(CreateDatabaseState());
      }).catchError((error) {
        print('Error Caught ${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('DataBase Opened');
    });
  }

  void insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database!.transaction((txn) async {
      txn.rawInsert(
              'INSERT INTO TASKS(TITLE, DATE, TIME, STATUS) VALUES ("$title", "$date", "$time", "DONE")'
      ).then((value) {
        print('$value Inserted Successfully');
        emit(InsertDatabaseState());

        getDataFromDatabase(database);
      });
    });
  }

  void getDataFromDatabase(database) {
    database.rawQuery('SELECT title, date, time, status FROM TASKS'
    ).then((value) {
      newtasks = [];
      donetasks = [];
      archivedtasks = [];
      value.forEach((element){
        if(element['status'] == 'new'){
          newtasks.add(value);
        }
        else if(element['status'] == 'done'){
          donetasks.add(value);
        }
        else{
          archivedtasks.add(value);
        }
      });

      emit(GetDatabaseState());
    });

  }

  void updateDatabase({
    required String status,
    required int id,
  }) async {
    database!.rawUpdate(
      'UPDATE Test SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      emit(UpdateDatabaseState());
    });
  }

  void deleteDataFromDatabase({
    required int id,
}) async{
    database!.rawDelete(
        'DELETE FROM Test WHERE status = ?', [id],
    ).then((value) {
      emit(DeleteFromDatabaseState());
    });
  }

  bool isBottomSheet = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheet({
    required bool isOpened,
    required IconData icon
  }) {
    fabIcon = icon;
    isOpened = isBottomSheet;

    emit(ChangeBottomSheetState());
  }

  bool isDark = false;

  void changeTheme(){
    isDark = !isDark;

    emit(ChangeThemeState());
  }

  // void changeTheme({
  //   bool? fromShared
  // }){
  //   if(fromShared != null){
  //     isDark = fromShared;
  //     emit(ChangeThemeState());
  //   }
  //   else{
  //     isDark = !isDark;
  //     CacheHelper.saveData(key: 'isDark', value: isDark).then((value){
  //       emit(ChangeThemeState());
  //     });
  //   }
  // }
}

/*
  CREATE TABLE TASKS(
    ID INT PRIMARY KEY,
    TITLE VARCHAR(50),
    DATE VARCHAR(50),
    TIME VARCHAR(50),
    STATUS VARCHAR(50)
  );
*/
