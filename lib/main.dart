import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Views/all_contacts.dart';
import 'package:nixwhatsappclone/UI/Views/home_screen_view.dart';
import 'package:nixwhatsappclone/UI/Views/mobile_registration_view.dart';
import 'package:nixwhatsappclone/UI/Views/profile_info.dart';
import 'package:nixwhatsappclone/UI/Views/splash_view.dart';
import 'package:nixwhatsappclone/services/auth_service.dart';
import 'package:nixwhatsappclone/services/navigation_service.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:primaryColor ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigationKey,
      title: 'WhatsApp Clone',
//      home: ProfileInfoView(),
      home: AuthService.instance.handleAuth(),
//      initialRoute: "splash" ,
      routes: {
        "splash":(BuildContext context)=> SplashView()
,       "login": (BuildContext context )=> MobileRegistration(),
        "profile_info": (BuildContext context )=> ProfileInfoView(),
        "home": (BuildContext context )=> HomeScreen(),
        "all_contacts": (BuildContext context )=> AllContacts(),
      },
    );
  }
}