import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasyotpapp/screens/phone_screen.dart';
import 'package:liveasyotpapp/screens/profilescreen.dart';
import 'package:pinput/pinput.dart';

class otpScreen extends StatefulWidget {
  otpScreen({super.key});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  bool authbool = false;
  TextEditingController smsCodeController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    log("build" + PhoneScreen.verify);
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF93D2F3)),
        borderRadius: BorderRadius.circular(0),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(0),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color(0xFF93D2F3),
      ),
    );
    String smsCode = "";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Verify Phone",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24),
              child: Center(
                child: Text(
                  "Code is Sent to Number",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6A6C7B),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Pinput(
              controller: smsCodeController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == smsCodeController.text ? null : 'Otp is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
              onChanged: (s) {
                smsCode = s;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: InkWell(
                onTap: () => resendOtp(),
                child: RichText(
                  text: TextSpan(
                      text: "Didn't recieve the code? ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6A6C7B),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                      children: const <TextSpan>[
                        TextSpan(
                            text: "Request Again",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF061D28),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'))
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
                    print(smsCode);
                    log("log${smsCodeController.text}");
                    await verifyotp(smsCodeController.text);
                  },
                  child: Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoBold'),
                  ),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF2E3B62)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  verifyotp(String controller) async {
    log("Sign in" + controller);
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: PhoneScreen.verify, smsCode: controller);
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return ProfileScreen();
        }), (Route<dynamic> route) => false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  resendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: PhoneScreen.PhoneNumberresend.toString(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("verificationCompleted");
      },
      verificationFailed: (FirebaseAuthException authException) {
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
            context, MaterialPageRoute(builder: (context) => otpScreen()));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        PhoneScreen.verify = verificationId;
      },
    );

    print(PhoneScreen.PhoneNumberresend);
    log(PhoneScreen.PhoneNumberresend);
  }
}
