import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'DataHolder.dart';

void main() {
  runApp(new MaterialApp(
    title: "Book Display",
    home: ImageScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ImageScreen extends StatelessWidget {
  Widget makeImagesGrid() {
    return GridView.builder(
        itemCount: 12,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ImageGridItem(index + 1);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: Container(
        child: makeImagesGrid(),
      ),
    );
  }
}

class ImageGridItem extends StatefulWidget {
  int? _index;
  ImageGridItem(int index) {
    this._index = index;
  }
  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  Uint8List? imageFile;
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference photosReference = FirebaseStorage.instance.ref().child("photos");

  getImage() {
    if (!requestedIndexes.contains(widget._index)) {
      int MAX_SIZE = 7 * 1024 * 1024;
      photosReference
          .child("image_${widget._index}.jpg")
          .getData(MAX_SIZE)
          .then((data) {
        this.setState(() {
          imageFile = data;
        });
        imageData.putIfAbsent(widget._index!, () {
          return data!;
        });
      }).catchError((error) {
        debugPrint(error.toString());
      });
      requestedIndexes.add(widget._index!);
    }
  }

  Widget decideGridTileWidget() {
    if (imageFile == null) {
      return Center(
        child: Text("No Data"),
      );
    } else {
      return Image.memory(
        imageFile!,
        fit: BoxFit.cover,
        width: 300,
        height: 500,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (!imageData.containsKey(widget._index)) {
      getImage();
    } else {
      this.setState(() {
        imageFile = imageData[widget._index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridTileWidget());
  }
}
