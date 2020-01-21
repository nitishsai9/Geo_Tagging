import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CommonThings {
  static Size size;
}
 class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}


class _MyListPageState extends State<MyListPage> {

  TextEditingController phoneInputController;
  TextEditingController nameInputController;
  String id;
  final db = Firestore.instance;
  String name;
  String position;

  //create tha funtion navigateToDetail
  navigateToDetail(DocumentSnapshot ds) {
 
  }

  //create tha funtion navigateToDetail
  navigateToInfo(DocumentSnapshot ds) {
   
  }


  void deleteData(DocumentSnapshot doc) async {
    await db.collection('CRUD').document(doc.documentID).delete();
    setState(() => id = null);
  }

  @override
  Widget build(BuildContext context) {

    CommonThings.size = MediaQuery.of(context).size;
    //print('Width of the screen: ${CommonThings.size.width}');
    return new Scaffold(
      appBar: AppBar(
        title: Text('Save Near By'),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("geotagging").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading....");
          }
          int length = snapshot.data.documents.length;
       print(length);
          return ListView.builder(
            itemCount: length,
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return new Container(
                padding: new EdgeInsets.all(5.0),
                child: Card(
                  
                  child: Row(
                    children: <Widget>[
                      
                      new Container(
                        padding: new EdgeInsets.all(6.0),
                        child: Image.network(
                          '${doc.data["image"]}' + '?alt=media',
                        ),
                        width: 140,
                        height: 100,
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            doc.data["name"],
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18.0,
                            ),
                          ),
                          subtitle: Text(
                            doc.data["position"],
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 18.0),
                          ),
                         
                        ),
                      ),
                   
                      IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.blueAccent,
                        ),
                        
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
     
    );
  }
}