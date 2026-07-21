import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_footer.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_name_row.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_password_field.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_phone_field.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        32.verticalSpace,
        const AnimationWrapper(
          startDelay: Duration(milliseconds: 100),
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: SignInNameRow(),
        ),
        45.verticalSpace,
        const AnimationWrapper(
          startDelay: Duration(milliseconds: 180),
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: SignInPhoneField(),
        ),
        45.verticalSpace,
        const AnimationWrapper(
          startDelay: Duration(milliseconds: 260),
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: SignInPasswordField(),
        ),
        40.verticalSpace,
        const AnimationWrapper(
          startDelay: Duration(milliseconds: 340),
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: SignInFooter(),
        ),
        32.verticalSpace,
      ],
    );
  }
}
