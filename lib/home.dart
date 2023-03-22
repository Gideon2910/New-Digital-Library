import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder(
        future: _getImage(
          context,
          "book1.jpg",
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              height: 100,
              child: Center(
                child: ListTile(
                  leading: Container(
                    margin: EdgeInsets.all(0.1),
                    child: SizedBox(height: 500, child: snapshot.data),
                  ),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              margin: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        },
      ),
    );
  }

  Future<Image?> _getImage(BuildContext context, String imageName) async {
    Image? image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(value.toString(), fit: BoxFit.cover);
    });
    return image;
  }
}
