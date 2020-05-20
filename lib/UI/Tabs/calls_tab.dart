import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/call_list_tile_widget.dart';

class CallsTab extends StatelessWidget {

  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          ListView.separated(
            padding: EdgeInsets.only(top: 10,bottom: 50),
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
