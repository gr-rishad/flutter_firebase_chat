import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/u12h0xsMEgf7BSERo7bJ/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = streamSnapshot.data.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8.0),
              child: Text(docs[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/u12h0xsMEgf7BSERo7bJ/messages')
              .add({'text': 'Add text through button click!'});
          // call on a collection, return stream--> emit new values whenever data changes
          //   FirebaseFirestore.instance
          //   .collection('chats/u12h0xsMEgf7BSERo7bJ/messages')
          //   .snapshots().listen((data) {
          // // print(data.docs);
          // data.docs.forEach((document) {
          //   print(document['text']);
          // });
          //  });

          // not real time update , data's store --> collections-->documents-->collections

          // FirebaseFirestore.instance
          //     .collection('chats/u12h0xsMEgf7BSERo7bJ/messages')
          //     .get()
          //     .then((value) {
          //   value.docs.forEach((document) {
          //     print(document.data());
          //   });
          // });
        },
      ),
    );
  }
}
