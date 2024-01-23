import 'package:flutter/material.dart';
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

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 52,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isEnable && !isLoading ? onPressed : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              if (isLoading) ...[
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(width: 20),
              ],
              Text(
                text,
                style: buttonTextStyle ??
                    theme.textTheme.titleMedium,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
