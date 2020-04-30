import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<int>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("New group"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("New broadcast"),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("WhatsApp Web"),
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Starred messages"),
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Settings"),
        ),
      ],
    );
  }
}
