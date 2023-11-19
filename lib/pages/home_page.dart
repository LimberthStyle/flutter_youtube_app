import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/ui/widgets/item_filter_widget.dart';
import 'package:flutter_youtube_app/ui/widgets/item_video_widget.dart';

import '../ui/general/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ItemVideoWidget(),
            ItemVideoWidget(),
            ItemVideoWidget(),
            ItemVideoWidget(),
          ],
        ),
      ),
    );
  }
}