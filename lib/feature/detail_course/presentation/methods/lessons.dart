import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/item/section_item.dart';
import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/video.dart';

Widget lessons(
  BuildContext context,
  List<Video> lessons,
  bool isUnlock, {
  required Function(Video) onTapVideo,
  Video? isSelectedVideo,
}) {
  Map<String, List<Video>> groupedLessons = {};

  for (var lesson in lessons) {
    groupedLessons.putIfAbsent(lesson.section, () => []);
    groupedLessons[lesson.section]!.add(lesson);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: ListView.builder(
      itemCount: groupedLessons.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String section = groupedLessons.keys.elementAt(index);
        List<Video> sectionLessons = groupedLessons[section]!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                'Section ${index + 1} - $section ',
                style: theme.textTheme.titleMedium,
              ),
            ),
            Column(
              children: sectionLessons
                  .map((lesson) => VideoTitleItem(
                        video: lesson,
                        isSelected: isSelectedVideo != null
                            ? isSelectedVideo == lesson
                            : false,
                        index: sectionLessons.indexOf(lesson),
                        isUnlock: isUnlock,
                        onTap: (video) => onTapVideo(video),
                      ))
                  .toList(),
            ),
          ],
        );
      },
    ),
  );
}
