import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:online_course_app/common_widget/item/section_item.dart';

import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/section.dart';
import '../../domain/entities/video.dart';

Widget lessons(
  BuildContext context,
  List<Video> lessons,
  bool isUnlock, {
  required Function(Video, Section) onTapVideo,
}) {
  Map<String, List<Video>> groupedLessons = {};
  for (var lesson in lessons) {
    if (!groupedLessons.containsKey(lesson.section)) {
      groupedLessons[lesson.section] = [];
    }
    groupedLessons[lesson.section]!.add(lesson);
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 4,
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
                  'Section $index - $section ',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sectionLessons.length,
                itemBuilder: (context, index) {
                  Video lesson = sectionLessons[index];
                  return VideoTitleItem(
                    video: lesson,
                    // section: section,
                    index: lessons.indexOf(lesson),
                    isUnlock: isUnlock,
                    onTap: (video) {},
                  );;
                },
              ),
            ],
          );
        },
      ),
    ),
    // child: SizedBox(
    //   height: MediaQuery.of(context).size.height * 5,
    //   child: GroupedListView<Video, String>(
    //     elements: sections,
    //     order: GroupedListOrder.DESC,
    //     groupBy: (element) => element.section,
    //     itemComparator: (item1, item2) => item1.section.compareTo(item2.section), // optional
    //     groupSeparatorBuilder: (String groupByValue) {
    //       index + 1;
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 6),
    //         child: Text(
    //           'Section $index - $groupByValue ',
    //           style: theme.textTheme.titleMedium,
    //         ),
    //       );
    //     },
    //     itemBuilder: (_, Video video) {
    //       return VideoTitleItem(
    //         video: video,
    //         // section: section,
    //         index: sections.indexOf(video),
    //         isUnlock: isUnlock,
    //         onTap: (video) {},
    //       );
    //     },
    //   ),
    // ),
  );
}
