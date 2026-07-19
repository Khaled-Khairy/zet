import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        const SignInNameRow(),
        45.verticalSpace,
        const SignInPhoneField(),
        45.verticalSpace,
        const SignInPasswordField(),
        40.verticalSpace,
        const SignInFooter(),
        32.verticalSpace,
      ],
    );
  }
}
