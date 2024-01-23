import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/forms.dart';
import '../../common_util/image_picker/image_picker_util.dart';
import '../../config/theme/app_theme.dart';
import '../button/button_text_widget.dart';

mixin ModalCreateDiscussion {
  static Future show(
    BuildContext context, {
    required TextEditingController titleCont,
    required TextEditingController detailsCont,
    required List<File?> photoAttacments,
    required Function(File image) onAddImage,
    required Function(File image) onRemove,
    required Function() onSubmit,
  }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: appTheme.black900,
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      builder: (context) {
        return CreateDiscussionModalView(
          titleCont: titleCont,
          detailsCont: detailsCont,
          photoAttacments: photoAttacments,
          onAddImage: onAddImage,
          onRemove: onRemove,
          onSubmit: onSubmit,
        );
      },
    );
  }
}

class CreateDiscussionModalView extends StatefulWidget {
  final TextEditingController titleCont;
  final TextEditingController detailsCont;
  List<File?> photoAttacments;
  Function(File image) onAddImage;
  Function(File image) onRemove;
  Function() onSubmit;

  CreateDiscussionModalView({
    super.key,
    required this.titleCont,
    required this.detailsCont,
    required this.photoAttacments,
    required this.onAddImage,
    required this.onRemove,
    required this.onSubmit,
  });

  @override
  State<CreateDiscussionModalView> createState() =>
      _CreateDiscussionModalViewState();
}

class _CreateDiscussionModalViewState extends State<CreateDiscussionModalView> {
  bool isEnableSubmit = false;

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);
    if (result != null) {
      setState(() {
        widget.onAddImage(File(result.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.93,
      initialChildSize: 0.93,
      builder: (context, scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonTextWidget(
                      title: 'Cancel',
                      fontSize: 16,
                      onTap: () {
                        widget.detailsCont.clear();
                        widget.titleCont.clear();
                        widget.photoAttacments.clear();
                        context.pop();
                      },
                    ),
                    Text(
                      'New Question',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        fontSize: 18,
                      ),
                    ),
                    ButtonTextWidget(
                      title: 'Submit',
                      isEnable: isEnableSubmit,
                      fontSize: 16,
                      onTap: (){
                        widget.onSubmit();
                        widget.detailsCont.clear();
                        widget.titleCont.clear();
                        widget.photoAttacments.clear();
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                color: theme.colorScheme.onPrimaryContainer,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      inputType: TextInputType.multiline,
                      controller: widget.titleCont,
                      title: 'Question Title',
                      onChanged: (value) => checkIsEnableSubmitButton(),
                    ),
                    verticalSpace(10),
                    CustomFormField(
                      inputType: TextInputType.multiline,
                      controller: widget.detailsCont,
                      title: 'Details',
                      onChanged: (value) => checkIsEnableSubmitButton(),
                    ),
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  if (widget.photoAttacments.isNotEmpty) ...[
                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 70.0, top: 15),
                        child: Row(
                          children: widget.photoAttacments
                              .map(
                                (photo) => Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      margin: const EdgeInsets.only(
                                        right: 13,
                                      ),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(photo!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: -5,
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => setState(() {
                                          widget.onRemove(photo);
                                        }),
                                        child: const CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Color(0xff9B1F32),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    color: appTheme.black900,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        getImageProfile(GetImageFrom.gallery);
                      }),
                      child: Container(
                        height: 85,
                        width: 50,
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                        ),
                        child: const Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void checkIsEnableSubmitButton() {
    if (widget.titleCont.text.isNotEmpty &&
        widget.detailsCont.text.isNotEmpty) {
      setState(() {
        isEnableSubmit = true;
      });
    } else {
      setState(() {
        isEnableSubmit = false;
      });
    }
  }
}
