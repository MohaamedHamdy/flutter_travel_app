import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/business_logic/cubit/app_cupit_logic.dart';
import 'package:travel_app/business_logic/cubit/travel_cubit.dart';
import 'package:travel_app/data/repository/web_services.dart';
import 'package:travel_app/view/screens/detail_screen.dart';
import 'package:travel_app/view/screens/main_screen.dart';
import 'package:travel_app/view/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider<TravelCubit>(
            create: (context) => TravelCubit(webService: WebService()),
            child: AppCupitLogic(),
          ),
          // home: WelcomeScreen(),
        );
      },
    );
  }
}
