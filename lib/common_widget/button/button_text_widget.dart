import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class ButtonTextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final bool isEnable;
  final VoidCallback? onTap;

  const ButtonTextWidget({
    Key? key,
    required this.title,
    this.onTap,
    this.isEnable = true,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? onTap : null,
      child: Text(
        title,
        style: isEnable
            ? theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                fontSize: fontSize ?? 16,
              )
            : theme.textTheme.bodyMedium?.copyWith(
                fontSize: fontSize ?? 16,
              ),
      ),
    );
  }
}
