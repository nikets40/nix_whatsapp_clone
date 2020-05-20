import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/busy_overlay_widget.dart';
import 'package:nixwhatsappclone/services/cloud_storage_service.dart';
import 'package:nixwhatsappclone/services/db_service.dart';
import 'package:nixwhatsappclone/services/media_service.dart';
import 'package:nixwhatsappclone/services/navigation_service.dart';

class ProfileInfoView extends StatefulWidget {
  @override
  createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  final TextEditingController _controller = new TextEditingController();
  File image;
  var showLoading = false;

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(
      show: showLoading,
      title: "Please Wait\nCreating Profile",
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            "Profile Info",
            style:
                TextStyle(color: primaryColorDark, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            width: screenWidth(context),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("Please Provide your name and optional profile photo"),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    image = await MediaService.instance.getImageFromLibrary();
                    setState(() {});
                  },
                  child: CircleAvatar(
                      radius: screenWidth(context) / 6,
                      backgroundColor: Colors.grey[350],
                      child: image == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Colors.grey[500],
                            )
                          : null,
                      backgroundImage: image != null ? FileImage(image) : null),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Type your name here"),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: primaryColor,
                  child: Text("Next"),
                  onPressed: ()async {
                    setState(() {
                      showLoading = true;
                    });
                    var imageURl = (await CloudStorageService.instance.uploadUserImage(image));
                    await DBService.instance.addProfileInfoInDB(_controller.text, imageURl);
                    NavigationService.instance.navigateToWithClearTop("home");
                  },
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
