import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liqui_walls/controllers/walls.dart';
import 'package:liqui_walls/widgets/walls/wall_card.dart';
import 'package:liqui_walls/widgets/walls/wall_row.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bottomIndex = 0;

  Widget _getCurrentItem(context, height) {
    switch (_bottomIndex) {
      case 0:
        return SlidingUpPanel(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          maxHeight: height,
          minHeight: height - 300,
          body: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/images/flowing_skies.jpg"),
          ),
          panelBuilder: (sc) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  "Wallpapers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                ),
              ),
              Obx(() {
                if (WallsController.to.categories.value != null &&
                    WallsController.to.walls.value != null) {
                  var children = WallsController.to.categories.value.docs
                      .map(
                        (category) => WallRow(
                          title: category.get("name"),
                          children: WallsController.to.walls.value.docs
                              .where(
                                (wall) => wall
                                    .get("category_ids")
                                    .contains(category.id),
                              )
                              .map(
                                (e) => WallCard(
                                  url: e.get("url"),
                                  category: category.get("name"),
                                  id: e.id,
                                ),
                              )
                              .toList(),
                        ),
                      )
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 24),
                      itemCount: children.length,
                      controller: sc,
                      itemBuilder: (BuildContext context, int index) =>
                          children[index],
                    ),
                  );
                } else {
                  return SizedBox();
                }
                return null;
              }),
              SizedBox(height: 32),
              // WallRow(title: "Categories", children: items),
            ],
          ),
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 64),
              child: Text(
                "Favorites",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: WallsController.to.wallsBox.listenable(),
                builder: (BuildContext context, Box box, Widget widget) =>
                    GridView.count(
                        crossAxisCount: 2,
                        children: box
                            .toMap()
                            .entries
                            .map(
                              (entry) => WallCard(
                                id: entry.key,
                                url: entry.value,
                              ),
                            )
                            .toList()),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _getCurrentItem(context, height),
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
          selectedItemColor: Colors.pink,
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
