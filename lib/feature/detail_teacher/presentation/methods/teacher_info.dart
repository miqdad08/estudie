import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

import '../../../../common_util/size/methods.dart';
import '../../../../config/theme/app_decoration.dart';
import '../../../course/domain/entities/teacher.dart';

Widget teacherInfo(Teacher teacher) => Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 24, 0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 70,
            height: 70,
            decoration: AppDecoration.fillErrorContainer.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder35,
            ),
            child: CustomImageWidget(
              radius: BorderRadius.circular(100),
              imagePath: teacher.photoUrl == '' || teacher.photoUrl == null
                  ? ImageConstant.imgPlaceholder
                  : teacher.photoUrl,
            ),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teacher.name,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                ),
              ),
              Text(
                teacher.specialist,
                style: theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
