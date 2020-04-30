import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/chatsListTile.dart';
import 'package:nixwhatsappclone/UI/Widgets/myStatusTile.dart';
import 'package:nixwhatsappclone/UI/Widgets/statusListTile.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         MyStatusTile(
           image: "assets/images/person13.jpg",
           name: "My Status",
           time: "Tap to add status update",
         ),
          Container(
            color: Colors.grey.withOpacity(0.2),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                "Recent updates",
                style: TextStyle(
                    color: Color(0xff6E6E6E), fontWeight: FontWeight.w500),
              ),
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical:8.0),
            separatorBuilder: (context, index){
              return Divider();
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return StatusListTile(
                name: names[index],
                image: "assets/images/person${index + 1}.jpg",
                time: "Today, "+ randomDate(),
              );
            },
          ),
          Container(
            color: Colors.grey.withOpacity(0.2),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                "Viewed updates",
                style: TextStyle(
                    color: Color(0xff6E6E6E), fontWeight: FontWeight.w500),
              ),
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8),
            separatorBuilder: (context,index){
              return Divider();
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return StatusListTile(
                name: names[12- index],
                image: "assets/images/person${12 - index }.jpg",
                time: "Today, "+ randomDate(),
                isViewed: true,
              );
            },
          ),
        ],
      ),
    );
  }

  randomDate() {
    String date;
    date = DateFormat('HH:mm').format(mockDate(DateTime(2020)));

    return date;
  }
}
