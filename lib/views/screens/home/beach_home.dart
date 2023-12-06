import 'package:bula/views/widgets/account/custom_back_button.dart';
import 'package:bula/views/widgets/account/facititiy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'booking_screen.dart';

class BeachHome extends StatelessWidget {
  const BeachHome({super.key, required this.dataofHotel, required this.reviews}
      //
      );
  final Map<String, dynamic>? dataofHotel;
  final List<Map<String, dynamic>>? reviews;
  @override
  Widget build(BuildContext context) {
    //int no_review=dataofHotel!['Review'].;
    final PageController pageController = PageController();
    List beachList = [dataofHotel?['Hotel Image']];
    int noReview = reviews?.length  ?? 0 ;
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              width: 10.w,
              height: 2.w,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 12,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Icon(Icons.share),
            ),
          ),
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              width: 10.w,
              height: 2.w,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 12,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Icon(Icons.favorite_border),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        children: [
          SizedBox(
            height: 30.h,
            child: PageView.builder(
              itemCount: beachList.length,
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (index) {},
              itemBuilder: (context, pagePosition) {
                return Image.network(
                  beachList[pagePosition],
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          SizedBox(height: 1.h),
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect:
                  const ExpandingDotsEffect(activeDotColor: Color(0xFF2196F3)),
              onDotClicked: (index) {},
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            dataofHotel!['Hotel Long Description'].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            dataofHotel!['Hotel Short Description'].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 1.h),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 12,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.w,
                  child: SizedBox(
                    width: 207,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: dataofHotel?['Details'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Read more',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 20.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: noReview.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Reviews',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xFF747474), thickness: 2),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '4.97*\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'rating',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xFF747474), thickness: 2),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '6\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'years hosting',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xFF747474), thickness: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 12,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Room type',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FacilityWidget(
                        text: "Ocean View", icon: Icons.pool_outlined),
                    FacilityWidget(
                        text: "Family Room",
                        icon: Icons.family_restroom_outlined),
                  ],
                ),
                SizedBox(height: 2.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FacilityWidget(
                        text: "Non-Smoker Room",
                        icon: Icons.smoke_free_outlined),
                    FacilityWidget(
                        text: "Bridal Suite", icon: Icons.hotel_outlined),
                  ],
                ),
                SizedBox(height: 1.h),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 12,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Property Overview',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FacilityWidget(text: "Free Wifi", icon: Icons.wifi),
                    FacilityWidget(
                        text: "Free Parking", icon: Icons.garage_outlined),
                  ],
                ),
                SizedBox(height: 2.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FacilityWidget(
                        text: "Air-Conditioning ", icon: Icons.air_outlined),
                    FacilityWidget(
                        text: "Daily HouseKeeping",
                        icon: Icons.cleaning_services),
                  ],
                ),
                SizedBox(height: 1.h),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 12,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'See what guests loved the most:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '321 \t\t',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Reviews',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 10,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.lightBlueAccent,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(width: 1.w),
                  ],
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  height: 20.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: noReview,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 80.w,
                        child: Column(
                          children: [
                            const Text(
                              '“We stayed at the villa and our kids stayed at the salla rooms. It was amazing!! The rooms are beautiful the resort is amazing.. the pool and the breakfast also meet our expectations for a 5 stars resort.”',
                              style: TextStyle(
                                color: Color(0xFF677289),
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/person.png",
                                  width: 8.w,
                                  height: 8.w,
                                ),
                                SizedBox(width: 5.w),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "John Smith\n\n",
                                          style: TextStyle(
                                            color: Color(0xFF212529),
                                            fontSize: 5.71,
                                            fontFamily: 'Barlow',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.40,
                                          )),
                                      TextSpan(
                                          text: "\t\t\tGermany",
                                          style: TextStyle(
                                            color: Color(0xFF677289),
                                            fontSize: 4.85,
                                            fontFamily: 'Barlow',
                                            fontWeight: FontWeight.w400,
                                            height: 0.21,
                                            letterSpacing: 0.15,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 12,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/location.png",
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 1.h),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Exclusivity reigns supreme at the five-star Rayavadee, a boutique hotel framed by sheer limestone cliffs and bordered by three of Krabi's most beautiful white-sand beaches.\n\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'Read more',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.zero,
        height: 10.h,
        child: BottomAppBar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Divider(color: Color(0xFFD9D9D9)),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '3-9 September\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: '₹' + dataofHotel?['Price'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' night',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(const BookingScreen(
                        type: "beach",
                      )),
                      child: Container(
                        width: 20.w,
                        height: 5.h,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2196F3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          shadows: [
                            const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 12,
                              offset: Offset(1, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Text(
                          'Book now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
