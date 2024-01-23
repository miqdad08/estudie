import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/forms.dart';
import '../../config/theme/app_theme.dart';
import '../button/button_text_widget.dart';
import '../icon/custom_rating_bar.dart';

mixin ModalCreateReview {
  static Future show(
    BuildContext context, {
    required TextEditingController reviewCont,
    required TextEditingController rateCont,
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
        return CreateReviewModalView(
          onSubmit: onSubmit,
          reviewCont: reviewCont,
          rateCont: rateCont,
        );
      },
    );
  }
}

class CreateReviewModalView extends StatefulWidget {
  final TextEditingController reviewCont;
  final TextEditingController rateCont;
  Function() onSubmit;

  CreateReviewModalView({
    super.key,
    required this.onSubmit,
    required this.reviewCont,
    required this.rateCont,
  });

  @override
  State<CreateReviewModalView> createState() =>
      _CreateDiscussionModalViewState();
}

class _CreateDiscussionModalViewState extends State<CreateReviewModalView> {
  bool isEnableSubmit = false;

  @override
  void initState() {
    super.initState();
    widget.rateCont.text = '5';
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
                        widget.reviewCont.clear();
                        widget.rateCont.clear();
                        context.pop();
                      },
                    ),
                    Text(
                      'New Review',
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
                      onTap: () {
                        widget.onSubmit();
                        widget.reviewCont.clear();
                        widget.rateCont.clear();
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
                    Text(
                      'Rating',
                      style: theme.textTheme.titleMedium,
                    ),
                    verticalSpace(8),
                    CustomRatingBar(
                      initialRating: double.tryParse(widget.rateCont.text),
                      itemSize: 30,
                      allowHalfRating: false,
                      onRatingUpdate: (rating){
                        setState(() {
                          widget.rateCont.text = rating.toString();
                        });
                      },
                    ),
                    verticalSpace(10),
                    CustomFormField(
                      inputType: TextInputType.multiline,
                      controller: widget.reviewCont,
                      title: 'Review',
                      onChanged: (value) => checkIsEnableSubmitButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void checkIsEnableSubmitButton() {
    if (widget.reviewCont.text.isNotEmpty &&
        widget.rateCont.text.isNotEmpty) {
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
