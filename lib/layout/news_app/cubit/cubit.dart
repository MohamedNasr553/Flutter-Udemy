import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/modules/news_app/business/BusinessScreen.dart';
import 'package:flutter_app/modules/news_app/science/ScienceScreen.dart';
import 'package:flutter_app/modules/news_app/sports/SportsScreen.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 0) {
      getBusiness();
    }
    else if(index == 1) {
      getSports();
    }
    else if(index == 2) {
      getScience();
    }
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    if (business.isEmpty) {
      emit(NewsBusinessLoadingState());

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
        }
      ).then((value) {
        business = value.data['articles'];

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState());

        print("Error caught: ${error.toString()}");
      });
    }
    else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.isEmpty) {
      emit(NewsSportsLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
          }
      ).then((value) {
        sports = value.data['articles'];

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorState());

        print("Error caught: ${error.toString()}");
      });
    }
    else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.isEmpty) {
      emit(NewsScienceLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'eg',
            'category': 'science',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
          }
      ).then((value) {
        science = value.data['articles'];

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState());

        print("Error caught: ${error.toString()}");
      });
    }
    else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q': '$value',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      search = value.data['articles'];

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState());

      print("Error caught: ${error.toString()}");
    });
  }
}
