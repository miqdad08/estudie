import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/item/section_item.dart';

import '../../domain/entities/section.dart';

Widget lessons(List<Section> sections) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sections
            .map(
              (e) => SectionItem(
                section: e,
                index: sections.indexOf(e) + 1,
              ),
            )
            .toList(),
      ),
    );
