import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/button/custom_button.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';

import '../../../../common_widget/item/discussion_item.dart';
import '../../../../common_widget/modal/modal_create_discussion.dart';

Widget discussions(
  BuildContext context,
  List<Discussion>? discussions, {
  required TextEditingController titleCont,
  required TextEditingController detailsCont,
  required List<File?> photoAttacments,
  required Function(File image) onAddImage,
  required Function(File image) onRemove,
  required Function() onSubmit,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CustomButtonWidget(
              title: 'Ask a question',
              onPressed: () async {
                ModalCreateDiscussion.show(
                  context,
                  titleCont: titleCont,
                  detailsCont: detailsCont,
                  photoAttachments: photoAttacments,
                  onAddImage: onAddImage,
                  onRemove: onRemove,
                  onSubmit: onSubmit,
                );
              },
            ),
            verticalSpace(10),
            if (discussions != null) ...[
              ...(discussions..sort((a, b) => -a.time.compareTo(b.time))).map(
                (discussion) => Padding(
                  padding: EdgeInsets.only(
                      bottom: discussion == discussions.last ? 6 : 16),
                  child: DiscussionItem(
                    discussion: discussion,
                  ),
                ),
              ),
            ] else ...[
              const Text('No discussion')
            ],
          ],
        ),
      ),
    );
