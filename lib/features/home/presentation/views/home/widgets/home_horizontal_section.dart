import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/features/home/presentation/views/home/widgets/home_challenges_title.dart';

class HomeHorizontalSection extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final double height;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? separator;
  final EdgeInsets? listPadding;
  final EdgeInsets? headerPadding;

  const HomeHorizontalSection({
    super.key,
    required this.title,
    this.subTitle,
    this.trailing,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    this.separator,
    this.listPadding,
    this.headerPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeChallengesTitle(
          padding: headerPadding,
          title: title,
          subTitle: subTitle,
          trailing: trailing,
        ),
        SizedBox(
          height: height,
          child: ListView.separated(
            padding: listPadding ?? EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
            itemBuilder: itemBuilder,
            separatorBuilder: (context, index) => separator ?? 15.horizontalSpace,
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
