import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class SecondRoute extends StatelessWidget {
  final txt01;


  const SecondRoute( this.txt01, {Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final list=[];
    list.add(txt01);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation:0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Center(
            child: CachedNetworkImage(
              imageUrl: txt01,
              imageBuilder: (context, imageProvider) => PhotoView(
                imageProvider: imageProvider,
              ),
              placeholder: (context, url) =>
                  CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            )
        ),
      ),
    );
  }
}