// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/business_logic/cubit/travel_cubit.dart';
import 'package:travel_app/view/screens/main_screen.dart';

import 'package:travel_app/view/widgets/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    'welcome_1.png',
    'welcome_2.jpg',
    'welcome_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/${images[index]}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              // padding: const EdgeInsets.all(20.0),
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
                top: MediaQuery.of(context).size.width * 0.4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const leftPartWidget(),
                  Slider(
                    index: index,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Slider extends StatelessWidget {
  int index;

  Slider({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (indexSlider) {
          return Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            width: 6.0.w,
            height: index == indexSlider ? 25.0.h : 8.0.h,
            decoration: BoxDecoration(
              color: index == indexSlider
                  ? const Color.fromARGB(255, 118, 61, 217)
                  : const Color.fromARGB(255, 162, 150, 182),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
          );
        },
      ),
    );
  }
}

class leftPartWidget extends StatelessWidget {
  const leftPartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trips',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 3.0.h,
        ),
        Text(
          'Mountain',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        SizedBox(
          width: 220.w,
          child: Text(
            'Mountains hiking gives you an incredible sense of freedom along with endurance test',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color.fromARGB(255, 85, 85, 85),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(
          height: 40.0.h,
        ),
        Button(
          function: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (_) {
            //     return MainScreen();
            //   },
            // ));
            BlocProvider.of<TravelCubit>(context).getData();
          },
          width: 150,
          children: [
            const Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10.0.w,
            ),
            const Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
