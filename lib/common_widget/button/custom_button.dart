import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

import 'base_button.dart';

class CustomButtonWidget extends BaseButton {
  const CustomButtonWidget({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isEnable,
    double? height,
    double? width,
    required String title,
  }) : super(
          text: title,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isEnable: isEnable ?? true,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => OutlinedButton(
        onPressed: isEnable && !isLoading ? onPressed : null,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? 50),
          padding: EdgeInsets.zero,
          side: BorderSide.none,
          backgroundColor: !isEnable ? theme.colorScheme.onPrimary : appTheme.deepPurpleA700,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) ...[
              leftIcon!,
              horizontalSpace(20),
            ],
            if (isLoading) ...[
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
              horizontalSpace(20),
            ],
            Text(
              text,
              style: buttonTextStyle ?? theme.textTheme.titleMedium,
            ),
            if (rightIcon != null) ...[horizontalSpace(20), rightIcon!],
          ],
        ),
      );
}
