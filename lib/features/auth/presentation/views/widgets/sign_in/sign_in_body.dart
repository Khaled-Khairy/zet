import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_checkbox_row.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_confirm_button.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_name_row.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_password_field.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_phone_field.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_terms_text.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ── First & Last Name ─────────────────────────────────────────────
        const SignInNameRow(),

        45.verticalSpace,

        // ── Phone Number ──────────────────────────────────────────────────
        const SignInPhoneField(),

        45.verticalSpace,

        // ── Password ──────────────────────────────────────────────────────
        const SignInPasswordField(),

        40.verticalSpace,

        // ── Checkboxes + Confirm (stateful wrapper) ───────────────────────
        const _SignInFooter(),

        24.verticalSpace,
      ],
    );
  }
}

/// Groups the checkboxes and the confirm button together.
/// The minimal [StatefulWidget] here owns only the terms-accepted flag
/// so that [SignInBody] remains a pure [StatelessWidget].
class _SignInFooter extends StatefulWidget {
  const _SignInFooter();

  @override
  State<_SignInFooter> createState() => _SignInFooterState();
}

class _SignInFooterState extends State<_SignInFooter> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Terms & Conditions
        SignInCheckboxRow(
          label: const SignInTermsText(),
          onChanged: (v) => setState(() => _termsAccepted = v),
        ),

        16.verticalSpace,

        // Marketing messages
        SignInCheckboxRow(
          label: Text(
            context.tr(LocaleKeys.agreeMarketingMessages),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.right,
          ),
        ),

        40.verticalSpace,

        // Confirm
        SignInConfirmButton(
          enabled: _termsAccepted,
          onPressed: _onConfirm,
        ),
      ],
    );
  }

  void _onConfirm() {
    // TODO: wire up to auth cubit
  }
}
