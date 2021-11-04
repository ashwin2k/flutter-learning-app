import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'englishdata/englishpracticequestions.dart';

class EnglishTestTwo extends StatefulWidget{
  const EnglishTestTwo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> _englishtesttwostate();

}
// ignore: camel_case_types
class _englishtesttwostate extends State<EnglishTestTwo>{
  String letter="A",word="Apple",resource="englishresources/apple.jpg";
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String currentAction="Get Ready to speak";
  FlutterTts flutterTts = FlutterTts();
  String questionTTS="What is Apple?";
  bool IS_ANSWER_CORRECT=true;
  int CURRENT_TTS_MODE=0;

  int TTS_TYPE_FEEDBACK=1;
  int TTS_TYPE_QUESTION=0;

  @override
  Widget build(BuildContext context) {
    flutterTts.setLanguage("en-Us");
    flutterTts.setSpeechRate(0.5);
    // startTTS();
    flutterTts.setCompletionHandler(() {
      if(CURRENT_TTS_MODE==TTS_TYPE_QUESTION) {
        startListening();
      }
      else  if(IS_ANSWER_CORRECT==true){
        Future.delayed(const Duration(milliseconds: 4000),(){
          EnglishPracticeResoruces randword= EnglishPracticeResoruces.getRandomAlphabet();
          setState(() {
            letter=randword.alphabet;
            word=randword.word;
            resource="englishresources/"+randword.resource;
            currentAction="Get Ready to speak";
            questionTTS="What is $word?";
            _lastWords="";
          });
          startTTS(TTS_TYPE_QUESTION,questionTTS);
        });
      }
      else{

      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("What is this?",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,fontSize: 30)),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child:Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Colors.blueAccent,
                        width: 2
                    )
                ),
                child: Image(
                  image: AssetImage(resource),
                ),
              )
            ),
            Container(
              margin: EdgeInsets.all(15),
              child:ElevatedButton(
                onPressed: (){
                  EnglishPracticeResoruces randword= EnglishPracticeResoruces.getRandomAlphabet();
                  setState(() {
                    letter=randword.alphabet;
                    word=randword.word;
                    resource="englishresources/"+randword.resource;
                    currentAction="Get Ready to speak";
                    questionTTS="What is $word?";
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
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.center,
              child: Text(
                currentAction,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 35
                ),
              ),
            )
            
            
          ],
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
      if(_lastWords.toLowerCase() == word.toLowerCase()){
        print("You are correct!");
        result_text="It is correct!";
        result=true;
      }
      setState(() {
        currentAction="You said $_lastWords\n$result_text";
        IS_ANSWER_CORRECT=result;
      });
      startTTS(1, "You said $_lastWords\n$result_text");

    });
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    setState(() {
      _lastWords = result.recognizedWords;
    });
    // stopListening();
  }
  void startTTS(int type,String prompt) async{
    var result = await flutterTts.speak(prompt);
    setState(() {
      CURRENT_TTS_MODE=type;
    });
    print("Speaking.... $result");
  }
}