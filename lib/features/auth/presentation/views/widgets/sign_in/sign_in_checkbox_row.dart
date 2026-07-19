import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';

/// A self-contained checkbox row. Owns its own [bool] state so that
/// the parent can remain a [StatelessWidget].
class SignInCheckboxRow extends StatefulWidget {
  final Widget label;
  final ValueChanged<bool>? onChanged;

  const SignInCheckboxRow({
    super.key,
    required this.label,
    this.onChanged,
  });

  @override
  State<SignInCheckboxRow> createState() => _SignInCheckboxRowState();
}

class _SignInCheckboxRowState extends State<SignInCheckboxRow> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: widget.label),
        8.horizontalSpace,
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: _checked,
            onChanged: (v) {
              setState(() => _checked = v ?? false);
              widget.onChanged?.call(v ?? false);
            },
            activeColor: DynamicColors.primary(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            side: BorderSide(
              color: DynamicColors.textColor(context).withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
