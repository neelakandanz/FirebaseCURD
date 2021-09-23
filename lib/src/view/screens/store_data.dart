import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoreDataR extends StatelessWidget {
  const StoreDataR({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebase = FirebaseFirestore.instance;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("STORE DATA"),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: firebase.collection("User").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, i) {
                          QueryDocumentSnapshot x = snapshot.data.docs[i];
                          return Card(

                            child: ListTile(
                              title: Center(child: Text(x['name'])),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email:"+x['email'],style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Text("DateOfBirth:"+x['dob'],style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Text("NewWords:"+x['newWords'],style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Text("Meaning:"+x['meaning'],style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Text("FeedBack:"+x['feedback'],style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                  ],
                                ),
                              ),

                            ),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
