import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/crud_app/add_page.dart';
import 'package:crud_app/crud_app/database_services.dart';
import 'package:crud_app/crud_app/edit_page.dart';
import 'package:flutter/material.dart';

class ShowdataPage extends StatelessWidget {

     ShowdataPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage()));
      },
      child: Icon(Icons.add,color: Colors.white,),),
      body: StreamBuilder(
        stream: firebaseFirestore.collection("notes").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (snapshots.hasData) {
            return ListView.builder(
              itemCount: snapshots.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final res = snapshots.data!.docs[index];
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  onDismissed: (v){
                    DatabaseServices.deleteData(res.id);

                  },
                  child: Card(

                    child: ExpansionTile(
                      leading: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPage(
                          id: res.id,
                          Title: res['title'],
                          Detail: res['detail'],
                        )));
                      },
                          icon: Icon(Icons.edit)),
                      title: Text("${res["title"]}"),
                    children: [
                      Text("${res["detail"]}"),


                      ],),
                  ),
                );
              },
            );
          } else
            return Center(child: CircularProgressIndicator(color: Colors.red));
        },
      ),
    );
  }
}
