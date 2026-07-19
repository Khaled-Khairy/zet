import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/app_button.dart';
import 'package:zet/features/auth/presentation/views/widgets/login/login_password_field.dart';
import 'package:zet/features/auth/presentation/views/widgets/login/login_phone_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        children: [
          const LoginPhoneField(),
          45.verticalSpace,
          const LoginPasswordField(),
          const Spacer(),
          AppButton(
            onPressed: () {},
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
