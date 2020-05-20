import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/services/auth_service.dart';
import 'package:nixwhatsappclone/services/navigation_service.dart';

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
        PopupMenuItem(
          value: 6,
          child: GestureDetector(onTap: (){
            AuthService.instance.signOut();
            NavigationService.instance.navigateToWithClearTop("login");

          },child: Text("Logout")),
        ),
      ],
    );
  }

}
