import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class MathOneStudy extends StatefulWidget{
  const MathOneStudy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_mathOneStudyState();

}

class _mathOneStudyState extends State<MathOneStudy>{
  FlutterTts flutterTts = FlutterTts();
  String questionTTS="1 ⚽";
  var emoji_list=["⚽","🎲","🔑","🍬","🚗"];
  var emoji_names=["balls","dice","key","chocolate","cars"];
  int number=1;
  int index=0;
  @override
  Widget build(BuildContext context) {
    flutterTts.setLanguage("en-Us");
    flutterTts.setSpeechRate(0.4);
    // startTTS();
    flutterTts.setCompletionHandler(() {
      Future.delayed(const Duration(milliseconds: 4000),(){
        var rng = new Random();
        setState(() {
          number=rng.nextInt(10);
          index=rng.nextInt(4);
        });
        startTTS(number.toString()+" "+emoji_names[index]);
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study Math"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              margin: EdgeInsets.all(20),
              child:Row(
                children: [
                  Expanded(child: Text(number.toString(),style: GoogleFonts.nunito(
                      fontSize: 130,
                      fontWeight: FontWeight.w700
                  )),flex: 1,),

                  Expanded(child:Text(
                      emoji_list[index]*number,
                      style: const TextStyle(fontSize: 35)
                  ),flex: 1,),
                ],
              )
            ),
            Text(
              number.toString()
                  +" "+emoji_names[index],
              style: GoogleFonts.montserrat(
                fontSize: 40,
                fontWeight: FontWeight.w500
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child:ElevatedButton(
                  onPressed: (){
                    var rng = new Random();
                    setState(() {
                      number=rng.nextInt(10);
                      index=rng.nextInt(4);
                    });
                    startTTS(number.toString()+" "+emoji_names[index]);

                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                  child: Padding(

                      padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.loop,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Next",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ],
                      )
                  ),
                )
            ),


          ]
        ),
      ),
    );
  }
  void startTTS(String prompt) async{
    var result = await flutterTts.speak(prompt);
    print("Speaking.... $result");
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("WidgetsBinding");
      // startTTS(questionTTS);
    });
  }
}