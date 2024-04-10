import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../config/constant/image_constant.dart';
import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';
import '../../feature/detail_course/domain/entities/section.dart';
import '../../feature/detail_course/domain/entities/video.dart';

class SectionItem extends StatelessWidget {
  final bool isUnlock;
  final Section section;
  final int index;
  final Function(Video) onTapVideo;

  const SectionItem({
    super.key,
    required this.section,
    required this.index,
    required this.isUnlock,
    required this.onTapVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Section $index - ${section.sectionName} ',
          style: theme.textTheme.titleMedium,
        ),
        verticalSpace(6),
        ...section.videos.map(
          (video) {
            return VideoTitleItem(
              video: video,
              // section: section,
              isUnlock: isUnlock,
              index: 1,
              onTap: onTapVideo,
            );
          },
        ).toList(),
      ],
    );
  }
}

class VideoTitleItem extends StatelessWidget {
  const VideoTitleItem({
    super.key,
    // required this.section,
    required this.isUnlock,
    required this.onTap,
    required this.video,
    required this.index,
  });

  // final Section section;
  final bool isUnlock;
  final Video video;
  final int index;
  final Function(Video) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: InkWell(
        onTap: () => onTap(video),
        splashColor: appTheme.deepPurpleA700,
        borderRadius: BorderRadiusStyle.circleBorder27,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          decoration: AppDecoration.fillErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder27,
            color: theme.colorScheme.errorContainer.withOpacity(0.9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 30,
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 6,
                ),
                decoration: AppDecoration.fillOnPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${index + 1}",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color:
                          theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    ),
                  ),
                ),
              ),
              horizontalSpace(10),
              Flexible(
                fit: FlexFit.tight,
                flex: 50,
                child: Text(
                  video.name,
                  style: theme.textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              CustomImageWidget(
                imagePath: isUnlock
                    ? null
                    : video.isDone
                        ? IconsConstants.icCheckMark
                        : IconsConstants.icLock,
                height: 24,
                width: 24,
                margin: const EdgeInsets.symmetric(vertical: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
