import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:liveasyotpapp/screens/otp_screen.dart';
import 'package:matcher/matcher.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});
  static String verify = "";
  static String PhoneNumberresend = "";
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  String CountryCodeSelected = '';
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController? PhoneNumberController = TextEditingController();
    String PhoneNumber = '';
    String phonNumberComp = '';
    return MaterialApp(
      supportedLocales: [
        Locale("en"),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Please enter your mobile number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "You'll receive 4 digit code\n to verify next.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6A6C7B),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Container(
                    width: 327,
                    height: 52,
                    child: Container(
                      width: 327,
                      height: 48,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Row(children: [
                        CountryCodePicker(
                          flagWidth: 32,
                          onChanged: _onCountryChange,
                          initialSelection: 'US',
                          favorite: ['+91', 'IN'],
                          showCountryOnly: false,
                          textStyle: TextStyle(fontSize: 16),
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          width: 194,
                          height: 48,
                          child: TextField(
                            controller: PhoneNumberController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(fontSize: 16),
                              labelStyle: TextStyle(fontSize: 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.5),
                  child: Container(
                    height: 56,
                    width: 328,
                    child: ElevatedButton(
                      onPressed: () async {
                        PhoneNumber = PhoneNumberController.text;
                        phonNumberComp = CountryCodeSelected + PhoneNumber;
                        PhoneScreen.PhoneNumberresend = phonNumberComp;
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phonNumberComp.toString(),
                          timeout: const Duration(seconds: 60),
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            print("verificationCompleted");
                          },
                          verificationFailed:
                              (FirebaseAuthException authException) {
                            if (authException.code == 'invalid-phone-number') {
                              print(authException.code);
                              print(authException.message);
                              print('The provided phone number is not valid.');
                            }
                          },
                          codeSent: (verificationId, resendToken) async {
                            PhoneScreen.verify = verificationId;
                            log(PhoneScreen.verify);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => otpScreen()));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            PhoneScreen.verify = verificationId;
                          },
                        );

                        print(phonNumberComp);
                        log(phonNumberComp);
                      },
                      child: Text('CONTINUE',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'RobotoBold')),
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF2E3B62)),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    CountryCodeSelected = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }
}
