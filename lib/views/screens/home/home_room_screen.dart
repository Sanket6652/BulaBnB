import 'dart:ffi';

import 'package:bula/controllers/home_controller.dart';
import 'package:bula/utils/constants/app_keys.dart';
import 'package:bula/views/screens/home/beach_home.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/home/bottom_nav_bar.dart';
import '../../widgets/home/category_widget.dart';
import '../../widgets/home/destination_widget.dart';
import '../../widgets/home/property_widget.dart';

class HomeRoomScreen extends GetView<HomeController> {
  HomeRoomScreen({super.key});
  final databaseReference =
      FirebaseDatabase.instance.ref().child('Admin/Hotels');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListView(
              children: [
                const DestinationWidget(),
                SizedBox(height: 2.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryWidget(category: "hotel&resort", icon: Icons.bed),
                    CategoryWidget(
                        category: "Apartments", icon: Icons.apartment),
                    CategoryWidget(category: "Home Stays", icon: Icons.home),
                    CategoryWidget(
                        category: "Shared Housing", icon: CupertinoIcons.group),
                    CategoryWidget(
                        category: "Monthly Rentals", icon: Icons.local_atm),
                  ],
                ),
                SizedBox(height: 2.h),
              ],
            ),
            // const DestinationWidget(),
            // SizedBox(height: 2.h),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CategoryWidget(category: "hotel&resort", icon: Icons.bed),
            //     CategoryWidget(
            //         category: "Apartments", icon: Icons.apartment),
            //     CategoryWidget(category: "Home Stays", icon: Icons.home),
            //     CategoryWidget(
            //         category: "Shared Housing", icon: CupertinoIcons.group),
            //     CategoryWidget(
            //         category: "Monthly Rentals", icon: Icons.local_atm),
            //   ],
            // ),
            // SizedBox(height: 2.h),

            Obx(() {
              if (controller.homeView.value == "hotel&resort") {
                return Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    Expanded(
                      child: StreamBuilder(
                          stream: databaseReference.onValue,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              Map data = snapshot.data!.snapshot.value;
                              List<Map<String, dynamic>> item = [];
                              data.forEach((index, data) =>
                                  item.add({"key": index, ...data}));
                              return ListView.builder(
                                itemCount:
                                    snapshot.data!.snapshot.children.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => Get.to(() => BeachHome(
                                          dataofHotel: item[index], 
                                          reviews: item[index]['Review'],
                                        ),
                                        ),
                                    child: PropertyWidget(
                                      imagesList: [
                                        item[index]['Hotel Image'],
                                      ],
                                      title: item[index]['key'],
                                      tagline: item[index]['Tagline'],
                                      price: item[index]['Price'],
                                    ),
                                  );
                                },
                              );
                            }
                          }),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    const InkWell(
                      // onTap: () => Get.to(() =>  BeachHome(data: )),
                      child: PropertyWidget(
                        imagesList: [
                          AppKeys.kBeach1,
                          AppKeys.kBeach2,
                          AppKeys.kBeach3,
                        ],
                        title: "Karabi",
                        tagline: '',
                        price: '',
                      ),
                    ),
                    SizedBox(height: 2.h),
                    const PropertyWidget(
                      imagesList: [
                        AppKeys.kBeach3,
                        AppKeys.kBeach2,
                        AppKeys.kBed1,
                      ],
                      title: "Karabi",
                      tagline: '',
                      price: '',
                    ),
                  ],
                );
              }
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 20.w,
                height: 5.h,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.699999988079071),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 2.w),
                    const Text(
                      "Map",
                      style: TextStyle(
                        color: Color(0xFFBABABA),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.30,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
