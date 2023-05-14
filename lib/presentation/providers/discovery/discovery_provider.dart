import 'package:flutter/material.dart';
import 'package:toktik/infrastructure/models/video_load_model.dart';
import 'package:video_player/video_player.dart';

// import '../../../domain/entities/video.dart';
import '../../../repository/video_load.dart';

class DiscoveryProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<Video> videos = [];

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
    //     .toList();

    final VideoLoad repository = VideoLoad();

    final response = await repository.getFeeds();
    for (var videoFile in response.videos) {
      videos.add(videoFile);
    }
    initialLoading = false;
    notifyListeners();
  }
}
