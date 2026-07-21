import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/features/more/presentation/views/contact_us/widgets/contact_us_option_item.dart';
import 'package:zet/features/more/presentation/views/contact_us/widgets/contact_us_social_card.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        ContactUsOptionItem(
          title: context.tr(LocaleKeys.directWhatsappChat),
          iconAsset: AppSvgs.whatsapp,
          isSvg: true,
          onTap: () {},
        ),
        ContactUsOptionItem(
          title: context.tr(LocaleKeys.addYourStore),
          iconAsset: AppSvgs.storeAdd,
          isSvg: true,
          onTap: () {},
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactUsSocialCard(
                title: context.tr(LocaleKeys.instagram),
                iconAsset: AppSvgs.instagram,
                isSvg: true,
                onTap: () {},
              ),
              ContactUsSocialCard(
                title: context.tr(LocaleKeys.tiktok),
                iconAsset: AppSvgs.tiktok,
                isSvg: true,
                onTap: () {},
              ),
              ContactUsSocialCard(
                title: context.tr(LocaleKeys.xSocial),
                iconAsset: AppSvgs.x,
                isSvg: true,
                onTap: () {},
              ),
            ],
          ),
        ),
        40.verticalSpace,
      ],
    );
  }
}
