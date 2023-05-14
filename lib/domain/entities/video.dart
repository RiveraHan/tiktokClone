import '../../infrastructure/models/video_load_model.dart';

class Video {
  final int id;
  final int width;
  final int height;
  final int duration;
  final dynamic fullRes;
  final List<dynamic> tags;
  final String url;
  final String image;
  final dynamic avgColor;
  final User user;
  final List<VideoFile> videoFiles;
  final List<VideoPicture> videoPictures;

  Video({
    required this.id,
    required this.width,
    required this.height,
    required this.duration,
    this.fullRes,
    required this.tags,
    required this.url,
    required this.image,
    this.avgColor,
    required this.user,
    required this.videoFiles,
    required this.videoPictures,
  });
}
