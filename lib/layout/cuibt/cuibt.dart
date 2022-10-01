import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';

import '../../modules/health/health_screen.dart';

class NewCubit extends Cubit<NewsStates> {
  NewCubit() : super(NewsInitialState());
  static NewCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.health_and_safety),label: 'Health'),
  ];
  void changeBottomNavBar(int index){
    currentIndex=index;
    emit(NewsBottomNavState());
  }
  List<Widget> Screens=
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];
}
