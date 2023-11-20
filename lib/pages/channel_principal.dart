import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/models/video_model.dart';
import 'package:flutter_youtube_app/services/api_service.dart';
import 'package:flutter_youtube_app/ui/general/colors.dart';
import 'package:flutter_youtube_app/ui/widgets/item_video_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final APIService _apiService = APIService();
  List<VideoModel> videos = [];
  initState() {
    super.initState();
    getData();
  }

  getData() {
    _apiService.getVideos().then((value) {
      videos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    width: double.infinity,
                    height: height * 0.1,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/style.jpg",
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "LimberthStyle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "SUSCRITO",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "5.8 M de suscriptores · 220 videos",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Estoy clonando el app de youtube, quiero ser desarrollador de aplicaciones moviles",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemVideoWidget(
                          videoModel: videos[index],
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
