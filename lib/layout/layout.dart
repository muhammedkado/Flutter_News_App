import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'cuibt/cuibt.dart';
import 'cuibt/darkmod.dart';

class NewsAppLayout extends StatefulWidget {
  const NewsAppLayout({Key? key}) : super(key: key);

  @override
  State<NewsAppLayout> createState() => _NewsAppLayoutState();
}

class _NewsAppLayoutState extends State<NewsAppLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewCubit()
        ..getBusiness()
        ..getSports()
        ..getScience()
        ..getHealth(),
      child: BlocConsumer<NewCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewCubit cubit = NewCubit.get(context);
          DarkMode dark = DarkMode.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    print(dark.isDark);
                  },
                ),
                IconButton(
                  onPressed: () {
                    setState(() {

                    });
                    dark.changeMode();
                  },
                  icon: Icon(
                      dark.isDark ? Icons.wb_sunny : Icons.nightlight_round),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            body: cubit.Screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
