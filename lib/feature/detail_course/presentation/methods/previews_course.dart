import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../../../common_widget/icon/custom_icon_button.dart';
import '../../../../config/constant/image_constant.dart';
import '../../domain/entities/video.dart';

Widget previewCourse(
  BuildContext context, {
  required String previewImage,
  required Video previewVideo,
}) =>
    GestureDetector(
      onTap: () {
        // ModalBottom.showWithTopBar(
        //   context,
        //   view: VideoPlayerPage(
        //     arguments: previewVideo,
        //   ),
        //   title: 'Preview Course',
        // );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomImageWidget(
                imagePath: previewImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            CustomIconButton(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(13),
              decoration: IconButtonStyleHelper
                  .gradientOnPrimaryContainerToOnPrimaryContainer,
              alignment: Alignment.center,
              child: CustomImageWidget(
                imagePath: IconsConstants.icPlay,
              ),
            ),
          ],
        ),
      ),
    );
