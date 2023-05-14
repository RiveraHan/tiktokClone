import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/video_button.dart';

import '../../infrastructure/models/video_load_model.dart';

class VideoScrollableView extends StatelessWidget {
  final List<Video> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                  caption: videoPost.user.name,
                  videoUrl: videoPost.videoFiles[0].link),
            ),
            Positioned(
                bottom: 20, right: 10, child: VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}
