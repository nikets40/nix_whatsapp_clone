import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Widgets/busy_overlay_widget.dart';
import 'package:nixwhatsappclone/services/auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  final String mobileNumber;
  final String countryCode;

  OtpVerification({@required this.mobileNumber, @required this.countryCode});

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String enteredOtp;
  bool isResendActive = true;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    AuthService.instance.verifyPhone(widget.countryCode + widget.mobileNumber);
    super.initState();
  }

  var showLoading = false;
  @override
  Widget build(BuildContext context) {
//    verifyPhone();
    return BusyOverlay(
      show: showLoading,
      title: "Signing in",
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          brightness: Brightness.light,
          title: Text(
            "Verify ${widget.countryCode} ${widget.mobileNumber}",
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              "Waiting to automatically detect an SMS sent to\n${widget.mobileNumber}. ",
                          style: TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                                text: "Wrong Number?",
                                style: TextStyle(color: Colors.blue))
                          ]),
                    ),
                    verticalSpace(20),
                    SizedBox(
                        width: screenWidth(context) * 0.75,
                        child: PinCodeTextField(
                          length: 6,
                          obsecureText: false,
                          backgroundColor: Colors.transparent,
                          animationType: AnimationType.fade,
                          autoDisposeControllers: true,
                          activeColor: primaryColor,
                          selectedColor: primaryColor,
                          inactiveColor: Colors.black87,
                          shape: PinCodeFieldShape.underline,
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          onChanged: (value) {
                            setState(() {
                              enteredOtp = value;
                            });
                          },
                        )),
                    verticalSpace(10),
                    Text(
                      "Enter 6-digit code",
                      textScaleFactor: 1.1,
                      style: TextStyle(color: Colors.black54),
                    ),
                    verticalSpace(10),
                    ListTile(
                      leading: Icon(
                        Icons.sms,
                        color: isResendActive ? primaryColor : Colors.grey,
                      ),
                      title: Text(
                        "Resend SMS",
                        style: TextStyle(
                            color: isResendActive ? Colors.black : Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      print(enteredOtp);
                      setState(() {
                        showLoading = true;
                      });

                      AuthService.instance.signInWithOTP(enteredOtp);
                    },
                    color: primaryColor,
                    textColor: Colors.white,
                    child: Text("Verify OTP"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
