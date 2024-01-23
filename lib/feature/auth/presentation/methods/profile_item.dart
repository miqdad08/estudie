import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

Widget profileItem(String title, {VoidCallback? onTap}) => GestureDetector(
  onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          )
        ],
      ),
    );
