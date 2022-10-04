import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layout/cuibt/darkmod.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'layout/layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp( const MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(contxt)=>DarkMode(),
      child: BlocConsumer<DarkMode,NewsStates>
        (
        listener: (contxt,state){},
          builder: (contxt,Object? state)
          {

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.w600)),
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
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
                    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white,fontWeight: FontWeight.w600)),
                appBarTheme: AppBarTheme(
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: const TextStyle(
                      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
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
              ),
              themeMode:DarkMode.get(context).isDark?
              ThemeMode.dark : ThemeMode.light,
              home: const NewsAppLayout(),
            );
          },

      )
    );
  }

}
