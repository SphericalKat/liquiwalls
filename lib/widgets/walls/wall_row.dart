import 'package:flutter/material.dart';
import 'package:liqui_walls/widgets/walls/wall_card.dart';

class WallRow extends StatelessWidget {
  final String title;
  final List<WallCard> children;

  const WallRow({Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.width / 4) * (16 / 9),
          child: ListView.builder(
            itemCount: children.length,
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => children[index],
          ),
        ),
      ],
    );
  }
}
