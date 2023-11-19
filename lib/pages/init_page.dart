import 'package:flutter/material.dart';

import '../ui/general/colors.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    Center(
      child: Text("Principal"),
    ),
    Center(
      child: Text("Shorts"),
    ),
    Center(
      child: Text("Agregar"),
    ),
    Center(
      child: Text("Suscripcion"),
    ),
    Center(
      child: Text("Biblioteca"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBrandPrimaryColor,
        title: Image.asset(
          'assets/images/logo.png',
          height: 26.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                Positioned(
                  top: -2,
                  right: -4,
                  child: Container(
                    padding: EdgeInsets.all(2.4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      "9+",
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 14.0,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/5126956/pexels-photo-5126956.jpeg"),
          ),
          const SizedBox(
            width: 12.0,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          const BottomNavigationBarItem(
            label: "Principal",
            icon: Icon(
              Icons.home_filled,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Shorts",
            icon: Icon(
              Icons.play_arrow_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: const Icon(
                Icons.add_circle_outline,
                size: 30.0,
              ),
            ),
          ),
          const BottomNavigationBarItem(
            label: "Suscripciones",
            icon: Icon(
              Icons.subscriptions_rounded,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(
              Icons.video_collection_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
