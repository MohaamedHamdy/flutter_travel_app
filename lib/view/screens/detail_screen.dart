import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/business_logic/cubit/travel_cubit.dart';
import 'package:travel_app/data/models/travel_model.dart';
import 'package:travel_app/view/widgets/responsive_button.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  int gottenStars = 4;
  bool isToglle = false;
  int selectedIndex = -1;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TravelCubit, TravelState>(
          builder: (context, state) {
            if (state is DetailState) {
              DetailState details = state as DetailState;
              travelModel Place = details.travelPlace;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image:  DecorationImage(
                    image: NetworkImage('http://mark.bslmeiyu.com/uploads/${Place.img}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<TravelCubit>(context).goHome();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150.0.h,
                    ),
                    //white container with all the details
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        // height: ,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(30.0.r),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(
                              top: 35.0, right: 35.0, left: 35.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TopWidget(details: details, Place: Place),
                              SizedBox(height: 20.0.h),
                              PeopleWidget(selectedIndex: selectedIndex),
                              SizedBox(height: 20.0.h),
                              DescriptionWidget(Place: Place),
                              SizedBox(height: 35.0.h),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isFavourite = !isFavourite;
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      child: isFavourite
                                          ? const Icon(
                                        Icons.favorite,
                                        color: Color.fromARGB(
                                            255, 118, 61, 217),
                                      )
                                          : const Icon(
                                          Icons.favorite_border_outlined),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0.w,
                                  ),
                                  Expanded(
                                    child: Button(
                                      height: 20,
                                      width: 100,
                                      function: () {},
                                      children: [
                                        Text(
                                          'Book Trip Now',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },

        )
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.Place,
  });

  final travelModel Place;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
        '${Place.description}',
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.details,
    required this.Place,
  });

  final DetailState details;
  final travelModel Place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween,
          children: [
            Text(
              '${details.travelPlace.name}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$ ${Place.price}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                color: const Color.fromARGB(
                    255, 118, 61, 217),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: Color.fromARGB(
                  255, 118, 61, 217),
              size: 20.0,
            ),
            SizedBox(
              width: 2.0.w,
            ),
            Text(
              '${Place.location}',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                color: const Color.fromARGB(
                    255, 118, 61, 217),
              ),
            ),

          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) =>
                    Icon(
                      Icons.star,
                      color: index < (Place.stars as int)
                          ? Colors.yellow
                          : Colors.grey,
                      size: 20.0,
                    ),
              ),
            ),
            SizedBox(
              width: 8.0.w,
            ),
            Text(
              '(${Place.stars})',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PeopleWidget extends StatefulWidget {
  int selectedIndex;

  PeopleWidget({required this.selectedIndex, super.key});

  @override
  State<PeopleWidget> createState() =>
      _PeopleWidgetState(selectedIndex: selectedIndex);
}

class _PeopleWidgetState extends State<PeopleWidget> {
  int selectedIndex;

  _PeopleWidgetState({
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'People',
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.005,
        ),
        Text(
          'Number of people in your group',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.02,
        ),
        Container(
          height: 50,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) =>
                SizedBox(
                  width: 8.0.w,
                ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    // isToglle = !isToglle;
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: selectedIndex != index
                        ? Color.fromARGB(255, 208, 201, 231)
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 18.0.sp,
                        color: selectedIndex != index
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
