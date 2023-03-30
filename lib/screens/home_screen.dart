import 'package:flutter/material.dart';
import 'package:liveasyotpapp/screens/otp_screen.dart';
import 'package:liveasyotpapp/screens/phone_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownvalue = 'English';

  var lang = ['English', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/liveasy_icon.png",
                    width: 42,
                    height: 42,
                  ),
                ),
                SizedBox(
                  height: 42,
                ),
                Text(
                  "Please select your Language",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto'),
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Center(
                    child: Text(
                      "You can change the language\n at any time.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6A6C7B),
                          fontFamily: 'Roboto'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    width: 219,
                    height: 47,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xFF2F3037))),
                    child: DropdownButton(
                        underline: Container(
                          height: 0,
                        ),
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        value: dropdownvalue,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 115),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF9C9C9C),
                          ),
                        ),
                        items: lang.map((String lang) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(lang),
                            ),
                            value: lang,
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.5),
                  child: Container(
                    height: 48,
                    width: 216,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'RobotoBold'),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF2E3B62)),
                    ),
                  ),
                ),
                Column(
                  children: [],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 86,
                child: CustomPaint(
                    painter: V1(),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width, height: 86)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 90,
                child: CustomPaint(
                    painter: V2(),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width, height: 90)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class V2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color.fromARGB(122, 46, 59, 98);
    path = Path();
    path.lineTo(0, size.height * 0.04);
    path.cubicTo(0, size.height * 0.04, size.width * 0.03, size.height * 0.13,
        size.width * 0.03, size.height * 0.13);
    path.cubicTo(size.width * 0.06, size.height * 0.22, size.width * 0.11,
        size.height * 0.4, size.width * 0.17, size.height * 0.45);
    path.cubicTo(size.width * 0.22, size.height / 2, size.width * 0.28,
        size.height * 0.43, size.width / 3, size.height * 0.34);
    path.cubicTo(size.width * 0.39, size.height * 0.26, size.width * 0.45,
        size.height * 0.15, size.width / 2, size.height * 0.08);
    path.cubicTo(size.width * 0.56, size.height * 0.01, size.width * 0.61,
        -0.03, size.width * 0.67, size.height * 0.03);
    path.cubicTo(size.width * 0.72, size.height * 0.08, size.width * 0.78,
        size.height * 0.22, size.width * 0.83, size.height * 0.26);
    path.cubicTo(size.width * 0.89, size.height * 0.29, size.width * 0.95,
        size.height * 0.22, size.width * 0.97, size.height * 0.19);
    path.cubicTo(size.width * 0.97, size.height * 0.19, size.width,
        size.height * 0.15, size.width, size.height * 0.15);
    path.cubicTo(size.width, size.height * 0.15, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width * 0.97, size.height,
        size.width * 0.97, size.height);
    path.cubicTo(size.width * 0.95, size.height, size.width * 0.89, size.height,
        size.width * 0.83, size.height);
    path.cubicTo(size.width * 0.78, size.height, size.width * 0.72, size.height,
        size.width * 0.67, size.height);
    path.cubicTo(size.width * 0.61, size.height, size.width * 0.56, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.45, size.height, size.width * 0.39, size.height,
        size.width / 3, size.height);
    path.cubicTo(size.width * 0.28, size.height, size.width * 0.22, size.height,
        size.width * 0.17, size.height);
    path.cubicTo(size.width * 0.11, size.height, size.width * 0.06, size.height,
        size.width * 0.03, size.height);
    path.cubicTo(
        size.width * 0.03, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height * 0.04, 0, size.height * 0.04);
    path.cubicTo(
        0, size.height * 0.04, 0, size.height * 0.04, 0, size.height * 0.04);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class V1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xff93D2F3);
    path = Path();
    path.lineTo(0, size.height * 0.18);
    path.cubicTo(0, size.height * 0.18, size.width * 0.04, size.height * 0.12,
        size.width * 0.04, size.height * 0.12);
    path.cubicTo(size.width * 0.08, size.height * 0.06, size.width * 0.17,
        -0.05, size.width / 4, size.height * 0.03);
    path.cubicTo(size.width / 3, size.height * 0.1, size.width * 0.42,
        size.height * 0.38, size.width / 2, size.height * 0.53);
    path.cubicTo(size.width * 0.58, size.height * 0.69, size.width * 0.67,
        size.height * 0.73, size.width * 0.75, size.height * 0.63);
    path.cubicTo(size.width * 0.83, size.height * 0.53, size.width * 0.92,
        size.height * 0.3, size.width * 0.96, size.height * 0.18);
    path.cubicTo(size.width * 0.96, size.height * 0.18, size.width,
        size.height * 0.06, size.width, size.height * 0.06);
    path.cubicTo(size.width, size.height * 0.06, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width * 0.96, size.height,
        size.width * 0.96, size.height);
    path.cubicTo(size.width * 0.92, size.height, size.width * 0.83, size.height,
        size.width * 0.75, size.height);
    path.cubicTo(size.width * 0.67, size.height, size.width * 0.58, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.42, size.height, size.width / 3, size.height,
        size.width / 4, size.height);
    path.cubicTo(size.width * 0.17, size.height, size.width * 0.08, size.height,
        size.width * 0.04, size.height);
    path.cubicTo(
        size.width * 0.04, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height * 0.18, 0, size.height * 0.18);
    path.cubicTo(
        0, size.height * 0.18, 0, size.height * 0.18, 0, size.height * 0.18);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
