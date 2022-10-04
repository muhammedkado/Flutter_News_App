import 'package:flutter/material.dart';
import 'package:newsapp/layout/cuibt/cuibt.dart';
import 'package:newsapp/layout/cuibt/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>
      (
      listener:(context,state){} ,
      builder:(context,state){
        List? list=NewCubit.get(context).science;
        return articleBuilder(list,context);
      } ,
    );
  }
}