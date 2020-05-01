import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/popupMenu.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userImage;
  final String userName;
  final bool isOnline;

  ChatAppBar(
      {@required this.userImage,
      @required this.userName,
      @required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColorDark,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userImage),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3),
                Text('online',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11))
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {},
        ),
        PopUpMenu(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
