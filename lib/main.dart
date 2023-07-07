import 'package:awt_task/layout/home/cubit/app_cuibt.dart';
import 'package:awt_task/layout/home/cubit/states.dart';
import 'package:awt_task/layout/home/home_screen.dart';
import 'package:awt_task/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.Init();
  runApp(const AtwTask());
}
class AtwTask extends StatelessWidget {
  const AtwTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context)=>AppCubit()..getUsers(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){} ,
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme:ThemeData(),
          );
        },
      ),
    );
  }
}
