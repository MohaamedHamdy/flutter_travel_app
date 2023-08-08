import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/business_logic/cubit/travel_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var services = {
    'balloon.png': 'Balloning',
    'snorkel.png': 'Snorkling',
    'kayak.png': 'Kayaking',
    'hiking.png': 'Hiking',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<TravelCubit, TravelState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var data = state.travelList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40.0.h, left: 20.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          print(state.travelList);
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0.h),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Discover',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                  ),
                ),
                SizedBox(height: 10.0.h),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    // indicator: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Colors.black,
                    //     border: Border.all(width: 1)),
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Places',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Inspiration',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Emotions',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0.h,
                    left: 10.0.w,
                    right: 0.0.w,
                  ),
                  height: 270.h,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 5.0.w,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<TravelCubit>(context).detaiPage(data[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5.0.w),
                              // height: 100,
                              width: 210.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${data[index].img}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20.0.w, bottom: 10.0.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data[index].name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5.0.h,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5.0.w,
                                        ),
                                        Text(
                                          '${data[index].name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Center(
                        child: Text(
                          'data',
                        ),
                      ),
                      const Center(
                        child: Text(
                          'data',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore more',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: const Color.fromARGB(255, 118, 61, 217),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0.w),
                  height: 92.h,
                  child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 33.0.w),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                margin: EdgeInsets.only(bottom: 10.0.h),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/${services.keys.elementAt(index)}',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              Text(
                                services.values.elementAt(index),
                                style: Theme.of(context).textTheme.bodyLarge!,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text('Error maybe 😔😟'),
          );
        },
      ),
    );
  }
}
