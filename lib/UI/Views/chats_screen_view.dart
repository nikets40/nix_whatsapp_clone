import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/chat_appbar_widget.dart';

class ChatsScreenView extends StatelessWidget {
  final String userImage;
  final String userName;
  final bool isOnline;
  final String conversationID;

  ChatsScreenView(
      {@required this.userImage,
      @required this.userName,
      @required this.conversationID,
      @required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        userName: userName,
        userImage: userImage,
        isOnline: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/chat_bg.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection("Conversations")
                    .document(conversationID)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var document = snapshot.data;
                    print(document["messages"].length);
                    return ListView.builder(
                      itemCount: document["messages"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: document["messages"][index]
                                        ["senderID"] ==
                                    document["ownerID"]
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
                                        document["ownerID"]
                                    ? chatBackground
                                    : Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                
                                child: Text(
                                    document["messages"][index]["message"]),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Text("loading");
                },
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
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {},
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
