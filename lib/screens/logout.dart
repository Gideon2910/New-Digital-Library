import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import '../widgets/zoom_menu.dart';
import 'package:flutter_application_1/uploadimage.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        backgroundColor: Colors.black87,
        leading: ZoomMenu(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (Context) => MyApp()));
              },
              child: Text('LOGOUT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 15,
                padding:
                    EdgeInsets.only(left: 55, right: 55, top: 20, bottom: 20),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(100.0),
                ),
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ImageScreen()));
      }),
    );
  }
}
