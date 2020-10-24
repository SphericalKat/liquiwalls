import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
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
        minHeight: height - 200,
        body: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset("assets/images/flowing_skies.jpg"),
        ),
        panel: ListTile(title: Text('Item 1')),
      ),
    );
  }
}
