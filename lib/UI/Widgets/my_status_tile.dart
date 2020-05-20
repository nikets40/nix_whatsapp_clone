import 'package:flutter/material.dart';

class MyStatusTile extends StatelessWidget {
  final String name;
  final String time;
  final String image;
  final bool isViewed;

  MyStatusTile(
      {@required this.name, @required this.time, @required this.image, this.isViewed= false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage(image),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
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
                Text(
                  time,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
