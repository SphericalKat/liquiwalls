import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liqui_walls/widgets/walls/wall_card.dart';
import 'package:liqui_walls/widgets/walls/wall_row.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.menu, size: 30),
                ),
                onTap: () {
                  // open drawer
                  print("owo");
                },
              ),
            )
          ],
        ),
      ),
      body: SlidingUpPanel(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        maxHeight: height,
        minHeight: height - 300,
        body: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset("assets/images/flowing_skies.jpg"),
        ),
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                "Wallpapers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
            ),
            WallRow(title: "Popular now", children: items),
            SizedBox(height: 32),
            WallRow(title: "Categories", children: items),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: "Favorites"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.gear), label: "Settings"),
          ],
          currentIndex: _bottomIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.black87,
          elevation: 0,
          onTap: (idx) {
            setState(() {
              _bottomIndex = idx;
            });
          },
        ),
      ),
    );
  }
}