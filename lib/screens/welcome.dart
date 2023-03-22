import 'package:flutter/material.dart';
import 'package:flutter_application_1/main2.dart';
import '../widgets/rounded-button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ebookui.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black38, BlendMode.darken),
                ),
              ),
            ),
            SafeArea(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: [
                    Spacer(flex: 6),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text("Digital Library",
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(flex: 6),
                    const RoundedButton(
                      buttonName: 'Start Reading',
                    ),
                    Spacer()
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
