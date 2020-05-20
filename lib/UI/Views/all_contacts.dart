import 'package:flutter/material.dart';

class AllContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numberOfContacts = 10;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        automaticallyImplyLeading: true,
        title: Column(
          children: [Text("Select Contacts"), Text("$numberOfContacts")],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: (){},
          icon: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
