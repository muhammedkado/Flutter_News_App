import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';
class DarkMode extends Cubit<NewsStates>{
  DarkMode() : super(NewsInitialState());

  static DarkMode get(context) => BlocProvider.of(context);


  bool isDark=false;
  ChangeMode(){
    isDark = !isDark;
    emit(NewsAppModeState());
  }

}