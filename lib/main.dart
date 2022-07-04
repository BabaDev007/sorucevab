

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:untitled22/cevabsayfa.dart';
import 'package:untitled22/constants.dart';
void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
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
              child: SoruSayfasi(),
            )));


  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  var baslangicSoru = 0;
  final playerDogru =  AudioCache(prefix: "assets/music/") ;
  final playerYanlis = AudioCache(prefix: "assets/music/") ;
  List <String> sorular = [" Gökyüzü kapkara olduğunda kar yağar",
    "Yağmur sularının bir kısmı toprak tarafından emilir, bir kısmı da akarsulara, göllere ve denizlere karışır",
    " Yağmur, yeryüzünde küçük birikintiler oluşturur", "Güneş açtığında toprak kurur, su birikintisi giderek küçülüp, kaybolur",
    " Yeryüzündeki sular büyük kütleler hâlinde havaya karışır" ,
    "Yeryüzündeki küçük damlacıklara su buharı denir" ,
    "Yeryüzündeki küçük damlacıkların havaya karışmasına buharlaşma denir",
    "Havadaki su buharı soğuduğu zaman donar",
    "Su buharının su damlacıkları hâline gelmesine yoğunlaşma (yoğuşma) denir",
    "Yeryüzünde suyun buharlaşması ve su buharının yoğunlaşması, havanın soğuması ile olur",
    "Yeryüzüne yakın yerlerde hava sıcaktır"];
  List<bool>cevablar = [
    true, true, true, false, false, true, false, true, false, true
  ];
  bool DogruSik = true;
  bool YalnisSik = false;
  var sik;

  List <Widget> secimler =  [


  ];
  var dogru = 0;
  var yalnis = 0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          SafeArea(

            
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      "${
                      yalnis
                      }", style: TextStyle(
                      fontSize: 30,
                      inherit: false,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'RobotoSlab',
                      color: Colors.white

                    )
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: LinearGradient(colors: [Colors.red, Colors.redAccent, Colors.red], tileMode: TileMode.decal ,transform: GradientRotation(48)),


                  ) ,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Text(
                        "${
                            secimler.length
                        }", style: TextStyle(
                        fontSize: 30,
                        inherit: false,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'RobotoSlab',
                        color: Colors.blue

                    )
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                    gradient: LinearGradient(colors: [Colors.yellow, Colors.yellowAccent, Colors.yellow], tileMode: TileMode.decal ,transform: GradientRotation(48)),
                  ) ,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                        "${
                            dogru
                        }", style: TextStyle(
                        fontSize: 30,
                        inherit: false,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'RobotoSlab',
                        color: Colors.white

                    )
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    gradient: LinearGradient(colors: [Colors.green, Colors.greenAccent, Colors.green], tileMode: TileMode.clamp ,transform: GradientRotation(48)),

                  ) ,
                )

              ],

            ),
          ),
          Divider(color: Colors.blue,),


          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  '${sorular[baslangicSoru]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,

                        fontStyle: FontStyle.normal,
                        fontFamily: 'RobotoSlab',



                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.start,

            spacing: 5,

            runSpacing: 3,

            children: secimler
          ),
          Divider(color: Colors.indigo, height: 0,),
          SafeArea(
            minimum: EdgeInsets.all(10),
            
            child: Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: RaisedButton(
                              padding: EdgeInsets.all(12),
                              textColor: Colors.white,
                              color: Colors.red[400],
                              child: Icon(
                                Icons.thumb_down,
                                size: 30.0,
                              ), onLongPress: (){
                                setState(() {

                                  secimler.clear();

                                });
                            }
                              ,
                              onPressed: () {bool yanlisCavab = cevablar[baslangicSoru];
                                setState(() {
                                  baslangicSoru++;
                                  if (yanlisCavab == false){
                                    dogru++;                                    secimler.add(kDogruIconu);
                                    playerDogru.play('accept.wav');

                                  } else{
                                    yalnis++;
                                    playerYanlis.play('false.wav');
                                    secimler.add(kYanlisIconu);
                                  }







                                });

                              },
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: RaisedButton(
                              padding: EdgeInsets.all(12),
                              textColor: Colors.white,
                              color: Colors.green[400],
                              child: Icon(Icons.thumb_up, size: 30.0),
                              onPressed: () {
                                bool dogruCavab = cevablar[baslangicSoru];
                                setState(() {



                                 if (dogruCavab == true){
                                   dogru++;
                                   secimler.add(kDogruIconu);
                                   playerDogru.play('accept.wav');

                                 } else{
                                   yalnis++;
                                   playerYanlis.play('false.wav');
                                   secimler.add(kYanlisIconu);
                                 }
                                 baslangicSoru++;

                                });
                              },
                            ))),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
