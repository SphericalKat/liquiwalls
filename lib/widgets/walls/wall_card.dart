import 'package:flutter/material.dart';

class WallCard extends StatelessWidget {
  final String url;

  const WallCard({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 4 ;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Card(
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: width * (18/9),
            width: width,
            child: FittedBox(
              child: Image.asset(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

var items = [
  WallCard(url: "assets/images/flowing_skies.jpg"),
  WallCard(url: "assets/images/flowing_skies.jpg"),
  WallCard(url: "assets/images/flowing_skies.jpg"),
  WallCard(url: "assets/images/flowing_skies.jpg"),
  WallCard(url: "assets/images/flowing_skies.jpg"),
  WallCard(url: "assets/images/flowing_skies.jpg"),
];