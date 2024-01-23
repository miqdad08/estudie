import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';

import '../config/theme/app_theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final int maxLines;
  final void Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  const CustomFormField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = true,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.inputType,
    this.maxLines = 1,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle) ...[
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          verticalSpace(7),
        ],
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          maxLines: maxLines,
          style: theme.textTheme.titleMedium,
          keyboardType: inputType ?? TextInputType.text,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: !isShowTitle ? title : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
