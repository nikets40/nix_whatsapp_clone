import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';

class CallListTile extends StatelessWidget {
  final String name;
  final String time;
  final String image;
  final bool isCallAudio;
  final bool isCallMissed;
  final bool isCallIncoming;

  CallListTile({
    @required this.name,
    @required this.time,
    @required this.image,
    @required this.isCallAudio,
    @required this.isCallMissed,
    @required this.isCallIncoming,
  });

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
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(image),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Transform.rotate(
                              angle:isCallIncoming?5.5:2.5,
                              child: Icon(Icons.keyboard_backspace,color: isCallMissed?Colors.red:green,size: 20,)),
                          Text(
                            time,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(isCallAudio?Icons.call:Icons.videocam, color: primaryColor),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
