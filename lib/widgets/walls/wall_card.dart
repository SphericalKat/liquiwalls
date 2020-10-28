import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:liqui_walls/router/router.gr.dart';

class WallCard extends StatelessWidget {
  final String url;
  final String category;
  final String id;

  const WallCard({Key key, this.url, this.category = "", this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Hero(
        tag: url + category,
        child: Material(
          child: InkWell(
            onTap: () {
              ExtendedNavigator.of(context).push(
                Routes.applyPage,
                arguments: ApplyPageArguments(url: url, category: category, id: id),
              );
            },
            child: Card(
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: width * (18 / 9),
                  width: width,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, str, progress) {
                      return Center(child: CircularProgressIndicator(value: progress.progress));
                    },
                    imageUrl: url,
                    fit: BoxFit.cover,
                    // placeholder: (context, url) => Center(
                    //   child: CircularProgressIndicator(),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
