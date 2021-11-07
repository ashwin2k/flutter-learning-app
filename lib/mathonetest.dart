import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MathOneTest extends StatefulWidget{
  const MathOneTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_mathOnetestState();

}
class _mathOnetestState extends State<MathOneTest>{
  var emoji_list=["⚽","🎲","🔑","🍬","🚗"];
  int number=1;
  int index=0;

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String currentAction="Get Ready to speak ";
  FlutterTts flutterTts = FlutterTts();
  String questionTTS="What is Apple?";
  bool IS_ANSWER_CORRECT=true;
  int CURRENT_TTS_MODE=0;

  int TTS_TYPE_FEEDBACK=1;
  int TTS_TYPE_QUESTION=0;

  int NO_OF_TRIES_LEFT=3;

  @override
  Widget build(BuildContext context) {
    questionTTS= "How many ${emoji_list[index]} are there in";
    flutterTts.setLanguage("en-Us");
    flutterTts.setSpeechRate(0.5);
    // startTTS();
    flutterTts.setCompletionHandler(() {
      print(CURRENT_TTS_MODE);
      print("ANSWER $IS_ANSWER_CORRECT");

      if(CURRENT_TTS_MODE==TTS_TYPE_QUESTION) {
        startListening();
      }
      else if(IS_ANSWER_CORRECT==true){
        Future.delayed(const Duration(milliseconds: 4000),(){
          print("GOING TO NEXT qUESTION");
          var rng = new Random();

          setState(() {
            number=rng.nextInt(10);
            index=rng.nextInt(4);
            currentAction="Get Ready to speak";
            questionTTS= "How many ${emoji_list[index]} are there in";
            _lastWords="";
            NO_OF_TRIES_LEFT=3;

          });
          startTTS(TTS_TYPE_QUESTION,questionTTS);
        });
      }
      else{
        if(NO_OF_TRIES_LEFT==0){
          setState(() {
            questionTTS="The correct answer is .. $number?";
            IS_ANSWER_CORRECT=true;
          });
          startTTS(TTS_TYPE_FEEDBACK,questionTTS);
        }
        else{
          NO_OF_TRIES_LEFT-=1;
          startTTS(TTS_TYPE_QUESTION,questionTTS);
        }
      }
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
                  child: Text(
                      "How many ${emoji_list[index]} are there in",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 25
                      )
                  )
              ),
              Text(
                  " ${emoji_list[index]*number}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 45
                  )
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(15,20,15,20),
                  child:ElevatedButton(
                    onPressed: (){
                      var rng = new Random();
                      setState(() {
                        number=rng.nextInt(10);
                        index=rng.nextInt(4);
                        currentAction="Get Ready to speak";
                        questionTTS= "How many ${emoji_list[index]} are there in";
                        _lastWords="";
                        NO_OF_TRIES_LEFT=3;

                      });
                      startTTS(TTS_TYPE_QUESTION,questionTTS);

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
                        currentAction="Get ready to speak";
                        _lastWords="";
                      });
                      startTTS(TTS_TYPE_QUESTION,questionTTS);

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
      if(!_speechEnabled) {
        _speechEnabled  = await _speechToText.initialize();
      }
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
      String result_text="It was wrong :(";
      bool result=false;
      int parsed_number=int.tryParse(_lastWords)??-1;
      if(parsed_number==-1){
        setState(() {
          currentAction="You said $_lastWords\n$result_text";
          IS_ANSWER_CORRECT=result;
        });
      }
      else if(int.parse(_lastWords.toLowerCase()) == number){
        print("You are correct!");
        result_text="It is correct!";
        result=true;
        setState(() {
          currentAction="You said $_lastWords\n$result_text";
          IS_ANSWER_CORRECT=result;
        });
      }
      else{
        setState(() {
          currentAction="You said $_lastWords\n$result_text";
          IS_ANSWER_CORRECT=result;
        });
      }

      startTTS(1, "You said $_lastWords\n...$result_text");
    });
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }
  void startTTS(int type,String prompt) async{
    var result = await flutterTts.speak(prompt);
    setState(() {
      CURRENT_TTS_MODE=type;
    });
    print("Speaking.... $result");
  }
}