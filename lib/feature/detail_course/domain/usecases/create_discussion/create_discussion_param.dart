import 'dart:io';

import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';

class CreateDiscussionParam {
  final Discussion discussion;
  final String id;
  final List<File> fileAttachments;

  CreateDiscussionParam({
    required this.id,
    required this.discussion,
    required this.fileAttachments,
  });
}
