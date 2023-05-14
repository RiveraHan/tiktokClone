import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/widgets/video/gradient_background.dart';
import 'package:video_player/video_player.dart';

import '../../providers/discovery/discovery_provider.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                return;
              }
              _controller.play();
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  GradientBackground(
                    stops: const [0.8, 1.0],
                  ),
                  Positioned(
                      bottom: 50,
                      left: 20,
                      child: _VideoCaption(caption: widget.caption))
                ],
              ),
            ),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({required this.caption});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
