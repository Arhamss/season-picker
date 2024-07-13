import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Choose Your Show',
            style: GoogleFonts.megrim(
                fontSize: 30, letterSpacing: 2, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color(0xFF0E3568),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/doodle2.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          )),
          child: magicball(),
        ),
      ),
        debugShowCheckedModeBanner: false
    ),
  );
}

class magicball extends StatefulWidget {
  @override
  State<magicball> createState() => _magicballState();
}

class _magicballState extends State<magicball> {
  int count = 0;
  shakingball() {
    setState(() {
      count = Random().nextInt(14) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 15,
                        blurRadius: 20, // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/show$count.png'),
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  shakingball();
                });
              },
              child: Text(
                'NEXT',
                style: GoogleFonts.righteous(
                  fontSize: 30,
                  letterSpacing: 2.5,
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
