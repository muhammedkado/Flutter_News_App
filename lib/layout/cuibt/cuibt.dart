import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';

import '../../Network/remote/dio_helper.dart';
import '../../modules/health/health_screen.dart';

class NewCubit extends Cubit<NewsStates> {
  NewCubit() : super(NewsInitialState());
  static NewCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety), label: 'Health'),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    if (index == 3) {
      getHealth();
    }
    emit(NewsBottomNavState());
  }

  List<Widget> Screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(query: {
        'country': 'tr',
        'category': 'business',
        'apiKey': 'ed496afa74bb4d708ebe9b7d1ff5045b'
      }, url: 'v2/top-headlines')
          .then((value) {
        business = value.data["articles"];
        emit(NewsBusinessSuccessState());
      }).catchError((error) {
        emit(NewsBusinessErorState(error.toString()));
      });
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(query: {
        'country': 'tr',
        'category': 'sports',
        'apiKey': 'ed496afa74bb4d708ebe9b7d1ff5045b'
      }, url: 'v2/top-headlines')
          .then((value) {
        sports = value.data["articles"];
        emit(NewsSportsSuccessState());
      }).catchError((error) {
        emit(NewsSportsErorState(error.toString()));
      });
    } else {
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(query: {
        'country': 'tr',
        'category': 'science',
        'apiKey': 'ed496afa74bb4d708ebe9b7d1ff5045b'
      }, url: 'v2/top-headlines')
          .then((value) {
        science = value.data["articles"];
        emit(NewsScienceSuccessState());
      }).catchError((error) {
        emit(NewsScienceErorState(error.toString()));
      });
    } else {
      emit(NewsScienceSuccessState());
    }
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsHealthLoadingState());
    if (health.isEmpty) {
      DioHelper.getData(query: {
        'country': 'tr',
        'category': 'health',
        'apiKey': 'ed496afa74bb4d708ebe9b7d1ff5045b'
      }, url: 'v2/top-headlines')
          .then((value) {
        health = value.data["articles"];
        emit(NewsHealthSuccessState());
      }).catchError((error) {
        emit(NewsHealthErorState(error.toString()));
      });
    } else {
      emit(NewsHealthSuccessState());
    }
  }



}
