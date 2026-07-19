import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zet/core/resources/colors.dart';

class HomeHeaderPageView extends StatefulWidget {
  const HomeHeaderPageView({super.key});

  @override
  State<HomeHeaderPageView> createState() => _HomeHeaderPageViewState();
}

class _HomeHeaderPageViewState extends State<HomeHeaderPageView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            pageSnapping: true,
            padEnds: false,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: DynamicColors.placeHolder(context),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              );
            },
          ),
        ),
        12.verticalSpace,
        SmoothPageIndicator(
          controller: _pageController,
          count: 5,
          effect: ExpandingDotsEffect(
            dotHeight: 8.h,
            dotWidth: 12.w,
            spacing: 8.w,
            dotColor: DynamicColors.sweetGrey(context),
            activeDotColor: AppColors.pink,
          ),
        ),
      ],
    );
  }
}
