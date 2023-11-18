import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            label: "Perfil",
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
