import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/src/view/screens/store_data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController newWords = TextEditingController();
  TextEditingController meaning = TextEditingController();
  TextEditingController feedback = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("User").doc(name.text).set({
        "name": name.text,
        "email": email.text,
        "dob": dob.text,
        "newWords": newWords.text,
        "meaning": meaning.text,
        "feedback": feedback.text
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("User").doc(name.text).update({"email": email.text});
    } catch (e) {
      print(e);
    }
  }

  // Future<DocumentSnapshot>
  delete() async {
    try {
      firebase.collection("User").doc(name.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StoreDataR()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(labelText: "USER NAME"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(labelText: "EMAIL"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: dob,
                  decoration: InputDecoration(labelText: "DATE OF BIRTH"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: newWords,
                  decoration: InputDecoration(labelText: "NEW WORDS"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: meaning,
                  decoration: InputDecoration(labelText: "MEANING"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: feedback,
                  decoration: InputDecoration(labelText: "FEEDBACK"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('Create'),
                    onPressed: () {
                      create();
                      name.clear();
                      email.clear();
                      dob.clear();
                      newWords.clear();
                      meaning.clear();
                      feedback.clear();

                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: Text('UPDATE'),
                    onPressed: () {
                      update();
                      name.clear();
                      email.clear();
                      dob.clear();
                      newWords.clear();
                      meaning.clear();
                      feedback.clear();

                    },
                  ),
                  ElevatedButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.redAccent),
                    child: Text('DELETE'),
                    onPressed: () {
                      delete();
                      name.clear();
                      email.clear();
                      dob.clear();
                      newWords.clear();
                      meaning.clear();
                      feedback.clear();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
