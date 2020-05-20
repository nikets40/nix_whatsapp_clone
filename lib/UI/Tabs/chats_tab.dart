import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/chats_list_tile_widget.dart';
import 'package:nixwhatsappclone/UI/Widgets/my_status_tile.dart';
import 'package:nixwhatsappclone/UI/Widgets/status_list_tile_widget.dart';

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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom:100.0,top: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 14,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatsScreenView(
                            isOnline: true,
                            userName: names[index],
                            userImage: "assets/images/person${index + 1}.jpg",
                          )));
                },
                child: ChatsListTile(
                  name: names[index],
                  image: "assets/images/person${index + 1}.jpg",
                  dateTimeLastMessage: randomDate(),
                  lastMessage: messages[index],
                  unReadMessages: mockInteger(0, 3),
                  isChatMuted: random.nextBool(),
                ),
              );
            },
          ),
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

  mockMessage() {
    return mockString(mockInteger(15, 50), 'a#');
  }
}
