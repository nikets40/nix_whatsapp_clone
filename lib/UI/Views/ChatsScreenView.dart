import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/chatAppBar.dart';

class ChatsScreenView extends StatelessWidget {
  final String userImage;
  final String userName;
  final bool isOnline;

  ChatsScreenView({
    @ required this.userImage,
    @ required this.userName,
    @ required this.isOnline});

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
