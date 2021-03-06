
import 'package:flutter/material.dart';




Map<int, Color> color =
{
 50:Color.fromRGBO(136,14,79, .1),
 100:Color.fromRGBO(136,14,79, .2),
 200:Color.fromRGBO(136,14,79, .3),
 300:Color.fromRGBO(136,14,79, .4),
 400:Color.fromRGBO(136,14,79, .5),
 500:Color.fromRGBO(136,14,79, .6),
 600:Color.fromRGBO(136,14,79, .7),
 700:Color.fromRGBO(136,14,79, .8),
 800:Color.fromRGBO(136,14,79, .9),
 900:Color.fromRGBO(136,14,79, 1),
};

MaterialColor primaryColorDark = MaterialColor(0xff075E54,color);
MaterialColor primaryColor = MaterialColor(0xff128C7E,color);
Color green = Color(0xff25D366);
Color chatBackground = Color(0xffDCF8C6);
Color blueTickColor = Color(0xff34B7F1);
Color tickColor = Color(0xffECE5DD);

screenWidth(context){
 return MediaQuery.of(context).size.width;
}

screenHeight(context){
 return MediaQuery.of(context).size.height;
}

verticalSpace(double space){
 return SizedBox(height: space,);
}

horizontalSpace(double space){
 return SizedBox(width: space,);
}


const TextStyle TabBarTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Colors.white,
);

const List messages  =[
"Red is greener than purple, for sure.",
"Carol drank the blood as if she were a vampire.",
"The tart lemonade quenched her thirst, but not her longing.",
"I really want to go to work, but I am too sick to drive.",
"The green tea and avocado smoothie turned out exactly as would be expected.",
"I like to leave work after my eight-hour tea-break.",
"You're unsure whether or not to trust him, but very thankful that you wore a turtle neck.",
"I want more detailed information.",
"Fluffy pink unicorns are a popular status symbol among macho men.",
"It had been sixteen days since the zombies first attacked.",
"She hadn't had her cup of coffee, and that made things all the worse.",
"At that moment he wasn't listening to music, he was living an experience.",
"You bite up because of your lower jaw.",
"Smoky the Bear secretly started the fires.",
];

const List names = [
 "Dong Scarborough",
 "Alonso Bergan",
 "Loura Deborde",
 "Cora Mariani",
 "Liza Lavelle",
 "Tenisha Vernon",
 "Nam Fleagle",
 "Gerri Nolley",
 "Sanford Emmons",
 "Lorene Sauve",
 "Shiloh Magyar",
 "Vincenzo Speck",
 "Carlee Picken",
 "Nelida Slee",
 "Belinda Mclaughin",
 "Lenora Roses",
 "Rebeca Rittenhouse",
 "Eunice Dalessandro",
 "Lynsey Laliberte",
 "Hans Mcleod",
];
