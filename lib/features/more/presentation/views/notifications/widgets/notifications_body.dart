import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/more/presentation/views/notifications/widgets/notification_item_card.dart';
import 'package:zet/features/more/presentation/views/notifications/widgets/notification_section_header.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          // Section 1: Today
          NotificationSectionHeader(
            title: context.tr(LocaleKeys.today),
          ),
          const NotificationItemCard(
            message: 'يوجد تحدي جديد من شركتك المفضلة',
            isHighlighted: true,
          ),
          const NotificationItemCard(
            message: 'تم تقديم طلب تحويل رصيد بنجاح',
          ),

          12.verticalSpace,

          // Section 2: Yesterday
          NotificationSectionHeader(
            title: context.tr(LocaleKeys.yesterday),
          ),
          const NotificationItemCard(
            message: 'تم إضافة رصيد التحدي (35ريال) إلى محفظتك !',
            svgAsset: AppSvgs.reward,
            iconColor: AppColors.pink,
          ),
          const NotificationItemCard(
            message: 'تم قبول تنفيذ التحدي (تحدي النشر) بنجاح !',
          ),
          const NotificationItemCard(
            message: 'لم يتم قبول تنفيذ التحدي بسبب عدم تنفيذ التحدي بالشكل الصحيح',
          ),

          24.verticalSpace,
        ],
      ),
    );
  }
}
