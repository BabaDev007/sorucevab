import 'package:flutter/material.dart';

class Cevap extends StatefulWidget {
  const Cevap({Key? key}) : super(key: key);

  @override
  State<Cevap> createState() => _CevapState();
}

class _CevapState extends State<Cevap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

        theme: ThemeData(
            textTheme: TextTheme(
                headline1: TextStyle(
                    inherit: false
                )

            ),

            fontFamily: "assets/RobotoSlab-VariableFont_wght.ttf"
        ),
        home: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: GradientRotation(27) ,
                  colors: [Colors.indigo, Colors.blueAccent], )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),

            )));


  }
}


