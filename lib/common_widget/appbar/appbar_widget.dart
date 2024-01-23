import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/icon/custom_icon_button.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

import '../../config/constant/image_constant.dart';
import '../image/custom_image.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTap;

  const AppBarWidget({
    Key? key,
    required this.title, this.onTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      titleSpacing: 24,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            onTap: onTap,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 55,
            width: 55,
            child: CustomImageWidget(
              imagePath: IconsConstants.icBack,
            ),
          ),
          Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 18),
          ),
          CustomIconButton(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 55,
            width: 55,
            child: CustomImageWidget(
              imagePath: IconsConstants.icNotif,
            ),
          ),
        ],
      ),
    );
  }
}
