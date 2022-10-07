import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cuibt/cuibt.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'package:newsapp/shared/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor:Colors.white ,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    hintText: 'Search for anything',
                    hintStyle:TextStyle(
                      color: Colors.white,

                    ),
                    label: Text('Search',style: TextStyle(color: Colors.white),),
                    suffixIcon: Icon(Icons.search),

                  ),
                  onChanged: (value) {
                    NewCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(child: articleBuilder(NewCubit.get(context).search, context))
            ],
          ),
        );
      },
    );
  }
}
