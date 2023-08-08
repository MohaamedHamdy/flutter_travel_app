import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/business_logic/cubit/travel_cubit.dart';
import 'package:travel_app/view/screens/detail_screen.dart';
import 'package:travel_app/view/screens/main_screen.dart';
import 'package:travel_app/view/screens/nav_bar_pages/home_screen.dart';
import 'package:travel_app/view/screens/welcome_screen.dart';

class AppCupitLogic extends StatefulWidget {
  const AppCupitLogic({Key? key}) : super(key: key);

  @override
  State<AppCupitLogic> createState() => _AppCupitLogicState();
}

class _AppCupitLogicState extends State<AppCupitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TravelCubit,TravelState>(
        builder: (context,state){
          if(state is WelcomeState){
            return WelcomeScreen();
          }
          else if(state is LoadingState){
            return Center(child: CircularProgressIndicator(color: Colors.black,),);
          }
          else if(state is LoadedState){
            return MainScreen();
          }
          else if(state is DetailState){
            return DetailScreen();
          }
          return Container();
        },
      )
    );
  }
}
