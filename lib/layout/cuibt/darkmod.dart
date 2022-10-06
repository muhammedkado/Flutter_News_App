import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Network/local/cache_helper.dart';
import 'states.dart';

class DarkMode extends Cubit<NewsStates> {
  DarkMode() : super(NewsInitialState());

  static DarkMode get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {

      isDark = fromShared;
      emit(NewsAppModeState());
    }else {
      isDark = !isDark;
      CachHelper.putData(key: 'isDark', value: isDark).then((value){
        emit(NewsAppModeState());
      });
    }
  }
}
