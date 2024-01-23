import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../config/constant/image_constant.dart';
import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';
import '../../feature/detail_course/domain/entities/section.dart';

class SectionItem extends StatelessWidget {
  final Section section;
  final int index;

  const SectionItem({
    super.key,
    required this.section,
    required this.index,
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
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: video == section.videos.last ? 6 : 16,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: AppDecoration.fillErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder27,
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
                        '${section.videos.indexOf(video) + 1}',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
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
                    imagePath: video.isDone
                        ? IconsConstants.icCheckMark
                        : IconsConstants.icLock,
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.symmetric(vertical: 3),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
