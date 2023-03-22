import 'package:flutter_application_1/models/book.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  final Book books;

  const Info({Key? key, required this.books}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 45, left: 1, right: 300),
          //const EdgeInsets.only(left: 50, right: 10, top: 450, bottom: 90),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, elevation: 0.0),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 500,
                        //MediaQuery.of(context).size.height * 0.55,
                        color: Colors.indigo,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 75,
                                  //MediaQuery.of(context).size.height * 0.1,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            spreadRadius: 5,
                                            blurRadius: 5,
                                            offset: Offset(4, 4))
                                      ]),
                                      //MediaQuery.of(context).size.height * 0.3,
                                      child: Image(
                                        height: Image(
                                                image: AssetImage(
                                                    widget.books.image))
                                            .height,
                                        image: AssetImage(widget.books.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      widget.books.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      widget.books.publisher,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "asdfghjklwqeruwoiehfwjifdsfsdfsdfsdfsd",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "cjnvfewffwefegerjgiwefwjnwjndfwenfdjwenfjdsnscsdcsdcsdvsd",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.indigo,
                        ),
                        child: GestureDetector(
                          onTap: (() {
                            setState(() {
                              widget.books.like = !widget.books.like;
                            });
                          }),
                          child: Icon(
                            widget.books.like ? Icons.thumb_up : Icons.thumb_up,
                            size: 28,
                            color:
                                widget.books.like ? Colors.pink : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.indigo,
                        ),
                        child: Center(
                          child: Text(
                            "Read Book",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
