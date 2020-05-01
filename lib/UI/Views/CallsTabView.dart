import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/callListTile.dart';

class CallsScreen extends StatelessWidget {

  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 14,
              itemBuilder: (BuildContext context, int index) {
                return CallListTile(
                  isCallMissed: random.nextBool(),
                  isCallIncoming: random.nextBool(),
                  isCallAudio: random.nextBool(),
                  image: "assets/images/person${14 - index}.jpg",
                  time: randomDate(),
                  name: names[14 - index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  randomDate() {
    String date;
    date = DateFormat('MMMM d, HH:mm').format(mockDate(DateTime(2020)));

    return date;
  }
}
