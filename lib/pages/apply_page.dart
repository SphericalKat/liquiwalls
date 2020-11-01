import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:liqui_walls/controllers/walls.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class ApplyPage extends StatelessWidget {
  final String url;
  final String id;
  final String category;

  const ApplyPage({Key key, this.url, this.id, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.arrow_back, size: 30),
                ),
                onTap: () {
                  // open drawer
                  ExtendedNavigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
      body: Hero(
        tag: url + category,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ValueListenableBuilder(
                            valueListenable: WallsController.to.wallsBox
                                .listenable(keys: [id]),
                            builder: (context, box, widget) {
                              var isFavorite = box.get(id) != null;
                              var icon = isFavorite
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart;
                              var color =
                                  isFavorite ? Colors.pink : Colors.black87;
                              return Icon(
                                icon,
                                size: 30,
                                color: color,
                              );
                            },
                          ),
                        ),
                        onTap: () async {
                          await WallsController.to.toggleFavorite(id, url);
                        },
                      ),
                    ),
                    Platform.isAndroid ? Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 64.0),
                          child: Text(
                            "APPLY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        onTap: () async {
                          var file =
                          await DefaultCacheManager().getSingleFile(url);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Apply wallpaper"),
                              content: Text(
                                  "Where would you like to apply the wallpaper?"),
                              actions: [
                                FlatButton(
                                  onPressed: () async {
                                    await WallpaperManager.setWallpaperFromFile(
                                      file.path,
                                      WallpaperManager.HOME_SCREEN,
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Home screen"),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    await WallpaperManager.setWallpaperFromFile(
                                      file.path,
                                      WallpaperManager.LOCK_SCREEN,
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Lock screen"),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    await WallpaperManager.setWallpaperFromFile(
                                      file.path,
                                      WallpaperManager.BOTH_SCREENS,
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Both"),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ) : SizedBox(),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            CupertinoIcons.arrow_down,
                            size: 30,
                            color: Colors.black87,
                          ),
                        ),
                        onTap: () async {
                          if (await Permission.photos.isGranted) {
                            var response = await Dio().get(url,
                                options:
                                    Options(responseType: ResponseType.bytes));
                            await ImageGallerySaver.saveImage(
                                Uint8List.fromList(response.data));
                          } else {
                            await Permission.photos.request();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
