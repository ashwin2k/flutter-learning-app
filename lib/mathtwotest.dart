import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MathTwoTest extends StatefulWidget{
  const MathTwoTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_mathtwotestState();

}

class _mathtwotestState extends State<MathTwoTest>{
  int number1=1;
  int number2=2;
  var operations=["+","*","-","/"];
  int index=0;

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String currentAction="Get Ready to speak";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test  Math"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                      "What is $number1 ${operations[index]} $number2?",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 35
                      )
                  )
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(15,20,15,20),
                  child:ElevatedButton(
                    onPressed: (){
                      var rng = Random();
                      setState(() {
                        number1=rng.nextInt(10);
                        number2=rng.nextInt(10);
                        index=rng.nextInt(4);
                        currentAction="Get Ready to speak";

                      });
                      startListening();

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
              Container(
                  margin: EdgeInsets.all(15),
                  child:ElevatedButton(
                    onPressed: (){
                      setState(() {
                        currentAction="Speak Now!";
                      });
                      startListening();

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
                              Icons.mic,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "SPEAK AGAIN",
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

              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                alignment: Alignment.center,
                child: Text(
                  currentAction,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 35
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
  void startListening(){
    Future.delayed(const Duration(milliseconds: 3000),() async{
      _speechEnabled  = await _speechToText.initialize();
      setState(() {
        currentAction="Speak Now!";
      });
      await _speechToText.listen(onResult: _onSpeechResult);
      stopListening();
    });
  }
  void stopListening(){
    Future.delayed(const Duration(milliseconds: 5000),() async{

      await _speechToText.stop();

      setState(() {
        currentAction="You said $_lastWords";
      });

    });
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    setState(() {
      _lastWords = result.recognizedWords;
    });
    stopListening();
  }
}