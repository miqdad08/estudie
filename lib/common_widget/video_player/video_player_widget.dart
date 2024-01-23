import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_widget/appbar/appbar_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../common_util/youtube_link_format.dart';
import '../../config/theme/app_theme.dart';

// mixin ModalVideoPlayer {
//   static Future show(
//     BuildContext context, {
//     required String videoUrl,
//   }) async {
//     return showModalBottomSheet(
//       context: context,
//       backgroundColor: appTheme.black900,
//       enableDrag: true,
//       isDismissible: false,
//       isScrollControlled: true,
//       builder: (context) {
//         return VideoPlayerView(
//           videoUrl: videoUrl,
//         );
//       },
//     );
//   }
// }

class VideoPlayerView extends StatefulWidget {
  static const String routeName = 'video_player_page';
  final String videoUrl;

  const VideoPlayerView({super.key, required this.videoUrl});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        // color: 'transparent',
        showFullscreenButton: false,
        loop: false,
      ),
    )
      ..loadVideoById(
        videoId: formattedLink(
          widget.videoUrl,
        ),
      )
      ..onFullscreenChange = (isFullScreen) {
        print(isFullScreen);
      };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: Center(
        child: YoutubePlayerControllerProvider(
          controller: _controller,
          child: YoutubePlayer(
            aspectRatio: 16 / 9,
            // aspectRatio: MediaQuery.of(context).size.aspectRatio,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

// IconButton(
// icon: Icon(
// value.playerState == PlayerState.playing
// ? Icons.pause
//     : Icons.play_arrow,
// ),
// onPressed: () {
// value.playerState == PlayerState.playing
// ? context.ytController.pauseVideo()
//     : context.ytController.playVideo();
// }
// )
