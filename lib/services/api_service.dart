import 'dart:convert';

import 'package:flutter_youtube_app/models/video_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  getVideos() async {
    List<VideoModel> videosModel = [];
    String _path =
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyBOVWhPWApWn2OO9oYlwtDR5nFM8e56c8Y&maxResults=20&regionCode=PE";
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap["items"];
      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList();
      print(videosModel);
    }
  }
}
