import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';

class StatusListTile extends StatelessWidget {
  final String name;
  final String time;
  final String image;
  final bool isViewed;

  StatusListTile(
      {@required this.name,
      @required this.time,
      @required this.image,
      this.isViewed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: isViewed?Colors.grey.withOpacity(0.8):green),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(image),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
