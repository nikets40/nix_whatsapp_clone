import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nixwhatsappclone/UI/Widgets/chats_list_tile_widget.dart';

import '../Views/chats_screen_view.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsTab>
    with AutomaticKeepAliveClientMixin {
  final String name = 'Mia Queen';

  final String image = "assets/images/woman.jpg";

  final Random random = new Random();
  @override
  bool get wantKeepAlive => true;

  @override
   initState() {
    super.initState();
  }

  Future<String>user()async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(future: user(),builder: (context, snapshot) => chatsList(snapshot.data),)
        ],
      ),
    );
  }

  randomDate() {
    String date;
    date = random.nextBool()
        ? DateFormat('dd/MM/yyyy').format(mockDate(DateTime(2020)))
        : DateFormat('HH:mm').format(mockDate(DateTime(2020)));

    return date;
  }

  chatsList(user){
    return
    StreamBuilder<QuerySnapshot> (
        stream: Firestore.instance.collection("Users").document(user).collection("Conversations").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Text("loading");
          }
          var chats = snapshot.data.documents;
          return ListView.builder(
            padding: EdgeInsets.only(bottom:100.0,top: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatsScreenView(
                            conversationID: chats[index]["conversationID"],
                            isOnline: true,
                            userName: chats[index]["name"],
                            userImage:chats[index]["profilePicture"] ,
                          )));
                },
                child: ChatsListTile(
                  name: chats[index]["name"],
                  image: chats[index]["profilePicture"],
                  dateTimeLastMessage: getFormattedDate(chats[index]["timestamp"]),
                  lastMessage: chats[index]["lastMessage"],
                  unReadMessages: chats[index]["unseenCount"],
                  isChatMuted: random.nextBool(),
                ),
              );
            },
          );
        }
    );
  }

  getFormattedDate(time){
      return DateFormat('MMM dd HH:mm').format((time as Timestamp).toDate());
  }

  mockMessage() {
    return mockString(mockInteger(15, 50), 'a#');
  }
}
