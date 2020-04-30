import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/chatsListTile.dart';

class ChatsScreen extends StatefulWidget  {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with AutomaticKeepAliveClientMixin {
  final String name = 'Mia Queen';

  final String image = "assets/images/woman.jpg";

  final Random random = new Random();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListView.separated(
        separatorBuilder: (context, index){
          return Divider();
        },
        key: PageStorageKey("chats"),
        itemCount: 14,
        itemBuilder: (BuildContext context, int index) {
          return ChatsListTile(
            name: names[index],
            image: "assets/images/person${index + 1}.jpg",
            dateTimeLastMessage: randomDate(),
            lastMessage: messages[index],
            unReadMessages: mockInteger(0, 3),
            isChatMuted: random.nextBool(),
          );
        },
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
