import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'cuibt/cuibt.dart';

class NewsAppLayout extends StatelessWidget {
  const NewsAppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewCubit()..getBusiness(),//..getSports()..getScience()..getHealth(),
        child: BlocConsumer<NewCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewCubit.get(context);
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
                    onPressed: () {},
                  )
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
