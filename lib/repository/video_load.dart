import 'package:dio/dio.dart';

import '../infrastructure/models/video_load_model.dart';

class VideoLoad {
  final String apiKey =
      'Hz7c4UheDZTuIyfwI4Z2oDmXqmyuJJF12wpFBPcFBLfmBKkMmEe7WixL';
  static String mainUrl = "https://api.pexels.com";
  final Dio _dio = Dio();
  var getFeedsAPI = '$mainUrl/videos/search';

  Future<VideoLoadModel> getFeeds() async {
    var params = {
      "api_key": apiKey,
      "query": "Nature",
      "size": "large",
      "orientation": "portrait",
    };

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: ((options, handler) async {
      options.headers['Authorization'] = apiKey;
      return handler.next(options);
    })));
    Response response = await _dio.get(getFeedsAPI, queryParameters: params);
    final videoResponse = VideoLoadModel.fromJson(response.data);

    return videoResponse;
  }
}
