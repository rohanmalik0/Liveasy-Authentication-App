import 'package:flutter/material.dart';

enum SingingCharacter { Shipper, Transporter }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SingingCharacter? _character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please Select your Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Container(
                width: 329,
                height: 100,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Radio(
                            hoverColor: Colors.black,
                            activeColor: Color(0xFF2E3B62),
                            focusColor: Colors.black,
                            value: SingingCharacter.Shipper,
                            splashRadius: 24,
                            groupValue: _character,
                            onChanged: (val) {
                              setState(() {
                                _character = val;
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/images/Group.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Shipper',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                width: 328,
                height: 100,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Radio(
                            hoverColor: Colors.black,
                            activeColor: Color(0xFF2E3B62),
                            focusColor: Colors.black,
                            value: SingingCharacter.Transporter,
                            splashRadius: 2,
                            groupValue: _character,
                            onChanged: (val) {
                              setState(() {
                                _character = val;
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/images/truck.png',
                        width: 40,
                        height: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Transporter',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Container(
                              width: 155,
                              height: 28,
                              child: Text(
                                "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.5),
              child: Container(
                width: 329,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'CONTINUE',
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
}
