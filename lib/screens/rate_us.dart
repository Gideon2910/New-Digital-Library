import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:path/path.dart';

import '../widgets/zoom_menu.dart';

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Rateusapp(),
    );
  }
}

class Rateusapp extends StatefulWidget {
  const Rateusapp({Key? key}) : super(key: key);

  @override
  State<Rateusapp> createState() => _RateusappState();
}

class _RateusappState extends State<Rateusapp> {
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Us'),
        centerTitle: true,
        leading: ZoomMenu(),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Rate the Application',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 25),
              RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Colors.blue),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.blue,
                      ),
                      empty: const Icon(
                        Icons.star_outline,
                        color: Colors.blue,
                      )),
                  onRatingUpdate: (value) {
                    setState(
                      () {
                        _ratingValue = value;
                      },
                    );
                  }),
              const SizedBox(height: 25),
              // Display the rate in number
              Container(
                width: 200,
                height: 100,
                /* decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),*/
                alignment: Alignment.center,
                child: Text(
                  _ratingValue != null ? _ratingValue.toString() : 'Rate it!',
                  style: const TextStyle(color: Colors.black87, fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
