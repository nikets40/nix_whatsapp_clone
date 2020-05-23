import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/chat_appbar_widget.dart';
import 'package:nixwhatsappclone/services/db_service.dart';
import 'package:toast/toast.dart';

class ChatsScreenView extends StatefulWidget {
  final String userImage;
  final String userName;
  final bool isOnline;
  final String conversationID;
  final String myID;

  ChatsScreenView(
      {@required this.userImage,
      @required this.userName,
      @required this.conversationID,
      @required this.myID,
      @required this.isOnline});

  @override
  _ChatsScreenViewState createState() => _ChatsScreenViewState();
}

class _ChatsScreenViewState extends State<ChatsScreenView>
 {
  final TextEditingController controller = TextEditingController();

  Toast showToast;
  IconData sendIcon = Icons.mic;
  ScrollController scrollController = new ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        userName: widget.userName,
        userImage: widget.userImage,
        isOnline: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/chat_bg.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: Firestore.instance
                        .collection("Conversations")
                        .document(widget.conversationID)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Timer(Duration(milliseconds: 50),()=>{
                        scrollController.jumpTo(scrollController.position.maxScrollExtent)
                        });
                        var document = snapshot.data;
                        var itemCount = document["messages"].length;
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: ListView.builder(
                              // controller: scrollController,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: itemCount,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: document["messages"][index]
                                                ["senderID"] ==
                                            widget.myID
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: screenWidth(context) * 0.8),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: document["messages"][index]
                                                        ["senderID"] ==
                                                    widget.myID
                                                ? chatBackground
                                                : Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4))),
                                        child: Text(document["messages"][index]
                                            ["message"]),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      return Text("loading");
                    },
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.tag_faces,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                                Flexible(
                                  child: new TextField(
                                    controller: controller,
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == "") {
                                          sendIcon = Icons.mic;
                                        } else
                                          sendIcon = Icons.send;
                                      });
                                    },
                                    minLines: 1,
                                    maxLines: 10,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: "Type a Message",
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.attach_file,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.photo_camera,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          child: IconButton(
                            icon: Icon(
                              controller.text == "" ? Icons.mic : Icons.send,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              DBService.instance.sendMessage(
                                  controller.text, widget.conversationID);
                              setState(() {
                                controller.text = "";
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// Mike button
