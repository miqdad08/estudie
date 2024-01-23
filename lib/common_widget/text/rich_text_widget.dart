import 'package:flutter/material.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

class RichTextWidget extends StatelessWidget {
  final double? fontSize;
  final List<RichTextModel> richTextList;

  const RichTextWidget({
    super.key,
    required this.richTextList,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: richTextList
            .map(
              (item) => WidgetSpan(
                child: Text(
                  item.text,
                  style: item.style ??
                      TextStyle(
                        color: item.isBold == false
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onPrimary.withOpacity(1),
                        fontWeight: item.isBold == false
                            ? FontWeight.w500
                            : FontWeight.w500,
                        fontSize: fontSize,
                      ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class RichTextModel {
  final String text;
  final bool? isBold;
  final TextStyle? style;

  const RichTextModel({required this.text, this.style, this.isBold = false});
}
