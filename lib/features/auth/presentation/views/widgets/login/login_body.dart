import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/features/auth/presentation/views/widgets/login/login_confirm_button.dart';
import 'package:zet/features/auth/presentation/views/widgets/login/login_password_field.dart';
import 'package:zet/features/auth/presentation/views/widgets/login/login_phone_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Phone Number ─────────────────────────────────────────────────
          const LoginPhoneField(),

          45.verticalSpace,

          // ── Password + Forgot link ────────────────────────────────────────
          const LoginPasswordField(),

          const Spacer(),

          // ── Confirm Button ────────────────────────────────────────────────
          const LoginConfirmButton(),

          24.verticalSpace,
        ],
      ),
    );
  }
}
