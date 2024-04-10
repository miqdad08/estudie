import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/extensions/build_context_extension.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/button/custom_button.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/video.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_discussion/create_discussion_param.dart';
import 'package:online_course_app/feature/detail_course/presentation/methods/lessons.dart';
import 'package:online_course_app/feature/detail_course/presentation/methods/previews_course.dart';
import 'package:online_course_app/injection_container.dart';
import '../../../common_widget/appbar/appbar_widget.dart';
import '../../course/domain/entities/course.dart';
import '../domain/entities/discussion.dart';
import '../domain/entities/review.dart';
import '../domain/entities/section.dart';
import '../domain/usecases/create_review/create_review_param.dart';
import 'bloc/detail_course_bloc.dart';
import 'methods/about.dart';
import 'methods/detail_category.dart';
import 'methods/discussions.dart';
import 'methods/reviews.dart';
import 'methods/title_and_rating.dart';

class DetailCoursePage extends StatefulWidget {
  final Course courseData;
  static const String routeName = "detail_course_page";

  const DetailCoursePage({
    super.key,
    required this.courseData,
  });

  @override
  State<DetailCoursePage> createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends State<DetailCoursePage> {
  TextEditingController titleCont = TextEditingController();
  TextEditingController detailsCont = TextEditingController();
  TextEditingController reviewCont = TextEditingController();
  TextEditingController rateCont = TextEditingController();
  String selectedCategory = "Lessons";
  List<File> photoAttachments = [];
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    titleCont.dispose();
    detailsCont.dispose();
    reviewCont.dispose();
    rateCont.dispose();
    photoAttachments.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCourseBloc(sl(), sl(), sl(), sl())
        ..add(GetDetailCourse(
          course: widget.courseData,
        )),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Course Detail',
          onTap: () => context.pop(),
          onSuffixTap: () {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
          },
        ),
        body: BlocConsumer<DetailCourseBloc, DetailCourseState>(
          listener: (BuildContext context, DetailCourseState state) {
            print('object $state');
            if (state is DetailCourseFailed) {
              context.showSnackBar(state.message);
            }
            if (state is UnlockCourseSuccess) {
              context.showSnackBar(state.message);
              context.read<DetailCourseBloc>().add(
                    GetDetailCourse(
                      course: widget.courseData,
                    ),
                  );
            }
            if (state is CreateDiscussionFailed) {
              context.showSnackBar(state.message);
            }
            if (state is CreateDiscussionSuccess) {
              context.showSnackBar(state.message);
            }
            if (state is CreateReviewFailed) {
              context.showSnackBar(state.message);
            }
            if (state is UnlockCourseFailed) {
              context.showSnackBar(state.message);
            }
            if (state is CreateDiscussionSuccess ||
                state is CreateReviewSuccess) {
              context.read<DetailCourseBloc>().add(
                    GetDetailCourse(
                      course: widget.courseData,
                    ),
                  );
            }
          },
          builder: (context, state) {
            if (state is DetailCourseLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DetailCourseLoaded) {
              return ListView(
                children: [
                  verticalSpace(30),
                  previewCourse(
                    context,
                    previewImage: widget.courseData.posterPath!,
                    previewVideo: state.data.previewVideo,
                  ),
                  verticalSpace(18),
                  ...titleAndRating(widget.courseData),
                  verticalSpace(18),
                  detailCategory(
                    categories: ['Lessons', 'About', 'Discussions', 'Reviews'],
                    isSelected: selectedCategory,
                    onTap: (String title) {
                      setState(() {
                        selectedCategory = title;
                      });
                    },
                  ),
                  verticalSpace(20),
                  _buildLesson(
                    state.data,
                    widget.courseData,
                    onSubmitDiscussion: () {
                      context.read<DetailCourseBloc>().add(
                        CreateDiscussion(
                          discussion: CreateDiscussionParam(
                            fileAttachments: photoAttachments
                                .map((photo) => photo)
                                .toList(),
                            id: widget.courseData.id,
                            discussion: Discussion(
                              title: titleCont.text,
                              description: detailsCont.text,
                              time: 1,
                            ),
                          ),
                        ),
                      );
                      context.pop();
                    },
                    onSubmitReview: () {
                      context.read<DetailCourseBloc>().add(
                        CreateReview(
                          review: CreateReviewParam(
                            id: widget.courseData.id,
                            review: Review(
                              review: reviewCont.text,
                              rating: double.tryParse(rateCont.text) ?? 0,
                              time: 1,
                            ),
                          ),
                        ),
                      );
                      context.pop();
                    },
                    onTapVideo: (video, section) {
                      // context.pushNamed(
                      //   DetailEnrolledCoursePage.routeName,
                      //   extra: DetailEnrolledCourseArguments(
                      //     video: video,
                      //     section: section,
                      //     title: widget.courseData.title,
                      //     lessons: state.data.lessons,
                      //     idCourse: widget.courseData.id,
                      //     discussions: state.data.discussions,
                      //   ),
                      // );
                    },
                  ),
                  verticalSpace(75)
                ],
              );
            }
            return Container();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocConsumer<DetailCourseBloc, DetailCourseState>(
          listener: (context, state) {
            if (state is UnlockCourseSuccess) {
              context.showSnackBar(state.message);
              context.read<DetailCourseBloc>().add(
                    GetDetailCourse(
                      course: widget.courseData,
                    ),
                  );
            }
            if (state is DetailCourseFailed) {
              context.showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            if (state is DetailCourseLoaded && !state.data.isUnlock) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  // vertical: 10,
                ),
                child: CustomButtonWidget(
                  height: 55,
                  isLoading: state is UnlockCourseLoading,
                  rightIcon: CustomImageWidget(
                    color: Colors.white,
                    imagePath: IconsConstants.icLock,
                  ),
                  title: 'Enroll this course for free',
                  onPressed: () {
                    context.read<DetailCourseBloc>().add(
                          UnlockCourse(
                            detailCourse: state.data,
                            course: widget.courseData,
                          ),
                        );
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildLesson(
    DetailCourse detailCourse,
    Course course, {
    required dynamic Function() onSubmitDiscussion,
    required dynamic Function() onSubmitReview,
    required dynamic Function(Video, Section) onTapVideo,
  }) {
    switch (selectedCategory) {
      case 'About':
        return about(
          detailCourse: detailCourse,
          course: course,
        );
      case 'Lessons':
        return lessons(
          context,
          detailCourse.lessons,
          detailCourse.isUnlock,
          onTapVideo: (video, section) => onTapVideo(video, section),
        );
      case 'Discussions':
        return discussions(
          context,
          detailCourse.discussions,
          titleCont: titleCont,
          detailsCont: detailsCont,
          photoAttacments: photoAttachments,
          onAddImage: (image) {
            photoAttachments.add(image);
          },
          onRemove: (File image) {
            photoAttachments.remove(image);
          },
          onSubmit: onSubmitDiscussion,
        );
      case 'Reviews':
        return reviews(
          context,
          reviews: detailCourse.reviews,
          rateCont: rateCont,
          reviewCont: reviewCont,
          onSubmit: onSubmitReview,
        );
      default:
        return Container();
    }
  }
}
