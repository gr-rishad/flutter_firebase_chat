import 'package:chat_app/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../chat/mssages.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),

      //StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/u12h0xsMEgf7BSERo7bJ/messages')
      //       .snapshots(),
      //   builder: (ctx, streamSnapshot) {
      //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final docs = streamSnapshot.data.docs;
      //     return ListView.builder(
      //       itemCount: docs.length,
      //       itemBuilder: (ctx, index) => Container(
      //         padding: EdgeInsets.all(8.0),
      //         child: Text(docs[index]['text']),
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     FirebaseFirestore.instance
      //         .collection('chats/u12h0xsMEgf7BSERo7bJ/messages')
      //         .add({'text': 'Add text through button click!'});
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
      //   },
      // ),
    );
  }
}
