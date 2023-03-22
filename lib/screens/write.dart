import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widgets/zoom_menu.dart';
import 'package:flutter_application_1/firestorebooks.dart';

void main() {
  runApp(const Write());
}

class Writee extends StatelessWidget {
  const Writee({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Write(),
    );
  }
}

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  Future<FirebaseApp> _initializefirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  TextEditingController buildnumber = TextEditingController();
  bool _validate = false;
  TextEditingController buildfeedback = TextEditingController();
  bool _validate1 = false;
  @override
  void dispose() {
    buildnumber.dispose();
    buildfeedback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.purple,
        leading: ZoomMenu(),
        title: Text("Contact Us"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                "CONTACT US",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                height: 10.0,
              ),
              buildFeedbackForm(),
              SizedBox(height: 10.0),
              buildNumberField(),
              Center(
                child: Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Map<String, dynamic> data = {
                            "field1": buildnumber.text,
                            "field2": buildfeedback.text,
                          };
                          FirebaseFirestore.instance
                              .collection("test")
                              .add(data);
                          //Firestore.instance.collection("test").add(data);

                          setState(() {
                            buildnumber.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                            buildfeedback.text.isEmpty
                                ? _validate1 = true
                                : _validate1 = false;
                          });
                          if (buildnumber.text.isNotEmpty ||
                              buildfeedback.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => screen()),
                            );
                          } /* else if (buildnumber.text.isEmpty ||
                              buildfeedback.text.isNotEmpty) {
                            Navigator.pop(context);
                          } else {
                            print('Field should not be empty');
                          }*/
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35, right: 35),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: clear,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35, right: 35),
                          child: Text(
                            'CLEAR',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildNumberField() {
    return TextField(
      controller: buildnumber,
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              /*
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Color(0xFFC5C5C5),
                  ),
                ),
              ),*/
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Enter Email",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
          ],
        ),
        border: OutlineInputBorder(),
        errorText: _validate ? 'Enter your Email ID' : null,
      ),
    );
  }

  buildFeedbackForm() {
    return TextField(
      controller: buildfeedback,
      maxLines: 7,
      decoration: InputDecoration(
        hintText: "Please briefly describe the issue",
        hintStyle: TextStyle(
          fontSize: 13.0,
          color: Color(0xFFC5C5C5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
        errorText: _validate1 ? 'Field cannot be Empty' : null,
      ),
    );
  }

  void clear() {
    buildnumber.clear();
    buildfeedback.clear();
  }

  Widget buildCheckItem({required String title, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 4.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}

class screen extends StatelessWidget {
  const screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
      ),
      body: Center(
        child: Text(
          "Thank You for your Feedback !",
          style: TextStyle(fontSize: 27),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => firestorebook()));
      }),
    );
  }
}
