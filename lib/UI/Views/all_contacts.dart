import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';

class AllContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numberOfContacts = 10;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        automaticallyImplyLeading: true,
        backgroundColor: primaryColorDark,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contacts",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$numberOfContacts contacts",
              style: TextStyle(fontSize: 12, color: Colors.white),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundColor: primaryColorDark,
              child: Icon(
                Icons.supervisor_account,
                color: Colors.white,
              ),
            ),
            title: Text(
              "New Group",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundColor: primaryColorDark,
              child: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
            ),
            title: Text(
              "New Contact",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection("Users").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Container();
                  else {
                    var items = snapshot.data.documents;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(items[index]["profilePicture"]),
                          ),
                          title: Text(items[index]["name"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        );
                      },
                    );
                  }
                }),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.share,
              color: Colors.black54,
            ),
            title: Text(
              "Invite Friends",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.help,
              color: Colors.black54,
            ),
            title: Text(
              "Contacts Help",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      )),
    );
  }
}
