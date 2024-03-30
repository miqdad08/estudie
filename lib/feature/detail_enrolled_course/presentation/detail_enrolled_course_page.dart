import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common_util/youtube_link_format.dart';
import '../../../common_widget/icon/custom_icon_button.dart';
import '../../../common_widget/image/custom_image.dart';
import '../../../config/constant/image_constant.dart';
import '../../../config/theme/app_theme.dart';
import '../../detail_course/domain/entities/section.dart';
import '../../detail_course/domain/entities/video.dart';
import '../../detail_course/presentation/methods/lessons.dart';

class DetailEnrolledCourseArguments {
  final Video video;
  final Section? section;
  final String title;
  final List<Section> lessons;

  DetailEnrolledCourseArguments({
    required this.video,
    this.section,
    required this.title,
    required this.lessons,
  });
}

class DetailEnrolledCoursePage extends StatefulWidget {
  static const String routeName = 'detail_enrolled_course_page';
  final DetailEnrolledCourseArguments arguments;

  const DetailEnrolledCoursePage({
    super.key,
    required this.arguments,
  });

  @override
  State<DetailEnrolledCoursePage> createState() =>
      _DetailEnrolledCoursePageState();
}

class _DetailEnrolledCoursePageState extends State<DetailEnrolledCoursePage> {
  late YoutubePlayerController _controller;

  Video? data;
  int index = 0;
  int currentDuration = 0;
  int? endDuration;
  bool _isPlayerReady = false;
  bool fullScreen = false;
  String selectedCategory = "About";

  @override
  void initState() {
    super.initState();
    data = widget.arguments.video;
    if (data != null) {
      setYoutubePlayer();
    }
  }

  void loadVideo() {
    _controller.load(
      formattedLink(
        data!.videoUrl,
      ),
    );
    index = widget.arguments.section!.videos.indexOf(data!);
  }

  void previousVideo() {
    if (index != -1 && _isPlayerReady) {
      Video? previousValue =
          index > 0 ? widget.arguments.section!.videos[index - 1] : null;
      if (previousValue != null) {
        setState(() {
          data = previousValue;
          loadVideo();
        });
      }
    }
  }

  void nextVideo() {
    if (data == widget.arguments.section!.videos.last) {
      context.pop();
    } else {
      if (index != -1 && _isPlayerReady) {
        Video? nextValue = index < widget.arguments.section!.videos.length - 1
            ? widget.arguments.section!.videos[index + 1]
            : null;
        if (nextValue != null) {
          setState(() {
            data = nextValue;
            loadVideo();
          });
        }
      }
    }
  }

  void setYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: formattedLink(data!.videoUrl),
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        autoPlay: true,
        mute: false,
        loop: false,
      ),
    );
    if (widget.arguments.section != null) {
      index = widget.arguments.section!.videos.indexOf(data!);
    }
  }

  void checkVideo() {
    setState(() {
      currentDuration = _controller.value.position.inSeconds;
      if (_controller.metadata.duration.inSeconds != 0) {
        endDuration = _controller.metadata.duration.inSeconds;
        setState(() {});
      }
    });
    if (_controller.value.position.inSeconds ==
        _controller.metadata.duration.inSeconds - 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        aspectRatio: 16 / 9,
        controller: _controller,
        showVideoProgressIndicator: true,
        topActions: const [],
        bottomActions: [
          Expanded(
            child: sliderVideo(context),
          ),
        ],
        onReady: () {
          _controller.addListener(() {
            checkVideo();
          });
          _isPlayerReady = true;
        },
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      onEnterFullScreen: () {
        fullScreen = true;
      },
      onExitFullScreen: () {
        fullScreen = false;
      },
      builder: (context, player) {
        return OrientationBuilder(
          builder: (context, orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      )
                    ],
                    centerTitle: false,
                    title: Text(
                      widget.arguments.title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  resizeToAvoidBottomInset: true,
                  body: buildTabBar(context, player),
                );
              case Orientation.landscape:
                return Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: player,
                  // body: buildBody(context),
                );
            }
          },
        );
      },
    );
  }

  Widget buildTabBar(BuildContext body, Widget player) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            // backgroundColor: AppColors.background,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(167),
              child: player,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                prevNext(context),
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            elevation: 0,
            // backgroundColor: AppColors.background,
            automaticallyImplyLeading: false,
            shape: Border(
                bottom: BorderSide(
                    width: 3, color: const Color(0xFFAAAAAA).withOpacity(.1))),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: _tab(),
            ),
          )
        ],
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: lessons(
                context,
                widget.arguments.lessons,
                true,
                onTapVideo: (video, section) {},
              ),
            ),
            const Text('data'),
          ],
        ),
      ),
    );
  }

  Widget prevNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.arguments.section != null) ...[
            if (data != widget.arguments.section?.videos.first) ...[
              CustomIconButton(
                onTap: () {
                  previousVideo();
                },
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                width: 55,
                child: CustomImageWidget(
                  imagePath: IconsConstants.icBack,
                ),
              ),
            ] else ...[
              const SizedBox(
                height: 55,
                width: 55,
              ),
            ],
            Text(
              data?.name ?? '',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 18),
            ),
            CustomIconButton(
              onTap: () {
                nextVideo();
              },
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 55,
              width: 55,
              child: CustomImageWidget(
                imagePath: data == widget.arguments.section?.videos.last
                    ? IconsConstants.icCheck
                    : IconsConstants.icNext,
              ),
            ),
          ]
        ],
      ),
    );
  }

  // Widget _buildBurnerWidgetContent(Widget player) {
  //   return Column(
  //     children: [
  //       player,
  //     ],
  //   );
  // }

  Widget sliderVideo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 45,
            child: Text(
              formatTime(currentDuration),
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xFF3263A9),
              inactiveTrackColor: const Color(0xFF3263A9).withOpacity(0.3),
              trackHeight: 4.0,
              thumbColor: const Color(0xFF3263A9),
              thumbShape: RoundedThumbShape(enabledThumbRadius: 10.0),
              overlayColor: const Color(0xFF3263A9).withOpacity(0.3),
              overlayShape: LargeOverlayShape(overlayRadius: 28.0),
              trackShape: EdgeToEdgeTrackShape(),
            ),
            child: Expanded(
              child: Slider(
                min: 0.0,
                max: endDuration?.toDouble() ?? 100,
                value: currentDuration.toDouble(),
                activeColor: appTheme.deepPurpleA700,
                thumbColor: Colors.white,
                inactiveColor: theme.colorScheme.onPrimaryContainer,
                onChanged: (value) {
                  if (_isPlayerReady) {
                    setState(() {
                      _controller.seekTo(Duration(seconds: value.toInt()));
                    });
                  }
                },
              ),
            ),
          ),
          horizontalSpace(10),
          Text(
            endDuration != null ? formatTime(endDuration!) : '--:--',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          horizontalSpace(5),
          InkWell(
            onTap: () {
              if (_isPlayerReady) {
                _controller.toggleFullScreenMode();
              }
            },
            child: const Icon(
              color: Colors.white,
              Icons.fullscreen,
            ),
          )
        ],
      ),
    );
  }

  String formatTime(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = remainingMinutes.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes';
  }

  TabBar _tab() {
    return TabBar(
      unselectedLabelColor: theme.colorScheme.onPrimaryContainer,
      labelColor: Colors.white,
      indicatorColor: appTheme.deepPurpleA700,
      indicatorWeight: 3,
      isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      tabAlignment: TabAlignment.start,
      tabs: [
        _tabItem(label: "Lesson"),
        _tabItem(label: "Discussion"),
      ],
    );
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}

class EdgeToEdgeTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 2.0;
    final trackWidth = parentBox.size.width;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(offset.dx, trackTop, trackWidth, trackHeight);
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({super.enabledThumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(
      context,
      center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
      activationAnimation: activationAnimation,
      enableAnimation: enableAnimation,
      isDiscrete: isDiscrete,
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      textDirection: textDirection,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
    );
  }
}

class SliderTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) =>
      Rect.fromLTWH(
        offset.dx,
        offset.dy + (parentBox.size.height - sliderTheme.trackHeight!) / 2,
        parentBox.size.width,
        sliderTheme.trackHeight!,
      );
}

class RoundedThumbShape extends RoundSliderThumbShape {
  @override
  final double enabledThumbRadius;

  RoundedThumbShape({
    this.enabledThumbRadius = 10.0,
  }) : super(
          enabledThumbRadius: enabledThumbRadius,
        );

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(
      context,
      center,
      activationAnimation: activationAnimation,
      enableAnimation: enableAnimation,
      isDiscrete: isDiscrete,
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      textDirection: textDirection,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
    );
  }
}

class LargeOverlayShape extends RoundSliderOverlayShape {
  @override
  final double overlayRadius;

  LargeOverlayShape({this.overlayRadius = 24.0})
      : super(overlayRadius: overlayRadius);
}
