import 'package:flutter/cupertino.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';

import '../../common_util/size/methods.dart';
import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';
import '../image/custom_image.dart';

class DiscussionItem extends StatelessWidget {
  final Discussion discussion;

  const DiscussionItem({
    super.key,
    required this.discussion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppDecoration.fillErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageWidget(
                  height: 40,
                  width: 40,
                  imagePath: discussion.photoUser ?? ImageConstant.imgUserPlaceholder,
                  radius: BorderRadius.circular(100),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        discussion.title,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        discussion.description,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (discussion.photoAttachments != null &&
              discussion.photoAttachments!.isNotEmpty) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: discussion.photoAttachments!
                    .map(
                      (photo) => Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(
                          left: photo == discussion.photoAttachments?.first
                              ? 65
                              : 10,
                          right: photo == discussion.photoAttachments?.last
                              ? 10
                              : 0,
                        ),
                        child: CustomImageWidget(
                          fit: BoxFit.cover,
                          imagePath: photo,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            verticalSpace(15),
          ]
        ],
      ),
    );
  }
}
