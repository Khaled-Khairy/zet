import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/features/more/presentation/views/manage_personal_account/widgets/account_field_card.dart';
import 'package:zet/features/more/presentation/views/manage_personal_account/widgets/gender_selection_card.dart';
import 'package:zet/features/more/presentation/views/manage_personal_account/widgets/profile_picture_card.dart';

class ManagePersonalAccountBody extends StatelessWidget {
  const ManagePersonalAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        spacing: 14.h,
        children: [
          const ProfilePictureCard(),
          AccountFieldCard(
            label: context.tr(LocaleKeys.accountName),
            value: 'Mh112',
          ),
          AccountFieldCard(
            label: context.tr(LocaleKeys.firstName),
            value: 'محمد',
          ),
          AccountFieldCard(
            label: context.tr(LocaleKeys.lastName),
            value: 'مصطفى',
          ),
          AccountFieldCard(
            label: context.tr(LocaleKeys.phoneNumber),
            value: '0561202011',
          ),
          const GenderSelectionCard(initialGender: 'male'),
        ],
      ),
    );
  }
}
