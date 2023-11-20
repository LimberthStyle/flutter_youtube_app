import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/models/video_model.dart';
import 'package:flutter_youtube_app/services/api_service.dart';
import 'package:flutter_youtube_app/ui/widgets/item_filter_widget.dart';
import 'package:flutter_youtube_app/ui/widgets/item_video_widget.dart';

import '../ui/general/colors.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIService _apiService = APIService();
  List<VideoModel> videos = [];

  @override
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
    _apiService.getVideos();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 0,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: kbrandSecondaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        )),
                    icon: const Icon(
                      Icons.explore_outlined,
                    ),
                    label: const Text("Explorar"),
                  ),
                  const SizedBox(
                    height: 33.0,
                    child: VerticalDivider(
                      color: Colors.white30,
                      thickness: 1.0,
                    ),
                  ),
                  ItemFilterWidget(
                    text: "Todos",
                    isSelected: true,
                  ),
                  ItemFilterWidget(
                    text: "Mixes",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    text: "Música",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    text: "Programación",
                    isSelected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
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
      ),
    );
  }
}
