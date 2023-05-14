// To parse this JSON data, do
//
//     final videoLoadModel = videoLoadModelFromJson(jsonString);

import 'dart:convert';

VideoLoadModel videoLoadModelFromJson(String str) =>
    VideoLoadModel.fromJson(json.decode(str));

String videoLoadModelToJson(VideoLoadModel data) => json.encode(data.toJson());

class VideoLoadModel {
  final int page;
  final int perPage;
  final List<Video> videos;
  final int totalResults;
  final String nextPage;
  final String url;

  VideoLoadModel({
    required this.page,
    required this.perPage,
    required this.videos,
    required this.totalResults,
    required this.nextPage,
    required this.url,
  });

  factory VideoLoadModel.fromJson(Map<String, dynamic> json) => VideoLoadModel(
        page: json["page"],
        perPage: json["per_page"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "videos": List<Video>.from(videos.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
        "url": url,
      };
}

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

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        duration: json["duration"],
        fullRes: json["full_res"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        url: json["url"],
        image: json["image"],
        avgColor: json["avg_color"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((x) => VideoFile.fromJson(x))),
        videoPictures: List<VideoPicture>.from(
            json["video_pictures"].map((x) => VideoPicture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "duration": duration,
        "full_res": fullRes,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "url": url,
        "image": image,
        "avg_color": avgColor,
        "user": user.toJson(),
        "video_files": List<dynamic>.from(videoFiles.map((x) => x.toJson())),
        "video_pictures":
            List<dynamic>.from(videoPictures.map((x) => x.toJson())),
      };
}

class User {
  final int id;
  final String name;
  final String url;

  User({
    required this.id,
    required this.name,
    required this.url,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class VideoFile {
  final int id;
  final Quality quality;
  final FileType fileType;
  final int width;
  final int height;
  final double? fps;
  final String link;

  VideoFile({
    required this.id,
    required this.quality,
    required this.fileType,
    required this.width,
    required this.height,
    this.fps,
    required this.link,
  });

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        quality: qualityValues.map[json["quality"]]!,
        fileType: fileTypeValues.map[json["file_type"]]!,
        width: json["width"],
        height: json["height"],
        fps: json["fps"]?.toDouble(),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quality": qualityValues.reverse[quality],
        "file_type": fileTypeValues.reverse[fileType],
        "width": width,
        "height": height,
        "fps": fps,
        "link": link,
      };
}

enum FileType { VIDEO_MP4 }

final fileTypeValues = EnumValues({"video/mp4": FileType.VIDEO_MP4});

enum Quality { HD, SD }

final qualityValues = EnumValues({"hd": Quality.HD, "sd": Quality.SD});

class VideoPicture {
  final int id;
  final int nr;
  final String picture;

  VideoPicture({
    required this.id,
    required this.nr,
    required this.picture,
  });

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
        id: json["id"],
        nr: json["nr"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nr": nr,
        "picture": picture,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
