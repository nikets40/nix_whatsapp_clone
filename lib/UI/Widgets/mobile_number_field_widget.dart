import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';

class MobileNumberField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String)countryCode;
  final String initialSelection;


  MobileNumberField({@required this.textEditingController, this.countryCode, this.initialSelection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.7,
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (code){
              print("Selected Country code is $code");
              countryCode(code.toString());
            },
            initialSelection: initialSelection,
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
          Flexible(
              child: TextField(
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            controller: textEditingController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "phone number"),
          ))
        ],
      ),
    );
  }
}
