import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Views/otp_verification_view.dart';
import 'package:nixwhatsappclone/UI/Widgets/mobile_number_field_widget.dart';
import 'package:nixwhatsappclone/services/navigation_service.dart';

class MobileRegistration extends StatefulWidget {

  @override
  _MobileRegistrationState createState() => _MobileRegistrationState();
}

class _MobileRegistrationState extends State<MobileRegistration> {
  final TextEditingController _textEditingController =
  new TextEditingController();
  String countryCode = '+91';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Enter your phone Number",
          style:
          TextStyle(color: primaryColorDark, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black54),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "WhatsApp will send an SMS message to verify your phone number.",
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(20),
                  MobileNumberField(
                    initialSelection: countryCode,
                    countryCode: (code){
                      countryCode = code;
                    },
                    textEditingController: _textEditingController,
                  ),
                  verticalSpace(20),
                  Text(
                    "Carrier SMS charges may apply",
                    textScaleFactor: 1.1,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    print(_textEditingController.text);
                    confirmationDialog();
                  },
                  child: Text("Next"),
                  color: green,
                  textColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void confirmationDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We will be verifying the phone number: \n",
              ),
              Text(
                "$countryCode ${_textEditingController.text}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("\nIs this OK, or would you like to edit the number?")
            ],
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: new Text("Edit", textScaleFactor: 1.1,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: new Text("OK", textScaleFactor: 1.1,),
                  onPressed: () {

                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                            OtpVerification(countryCode:countryCode,
                              mobileNumber: _textEditingController.text,)));
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
