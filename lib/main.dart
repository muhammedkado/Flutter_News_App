import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/Network/local/cache_helper.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layout/cuibt/darkmod.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'layout/cuibt/cuibt.dart';
import 'layout/layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  bool? dark = CachHelper.getData(key: 'isDark');

  runApp(MyApp(dark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>DarkMode()..changeMode(
                fromShared: isDark,
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => NewCubit()
              ..getBusiness()
              ..getSports()
              ..getScience()
              ..getHealth(),
          )
        ],
        child: BlocConsumer<DarkMode, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              primarySwatch: Colors.red,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                color: Colors.white,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light),
                color: HexColor('333739'),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor('333739'),
              ),
              primarySwatch: Colors.red,
            ),
            themeMode:
                DarkMode.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsAppLayout(),
          ),
        ));
  }
}
