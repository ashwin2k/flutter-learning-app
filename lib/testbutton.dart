import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_app/englishtestone.dart';
import 'package:learning_app/englishtesttwo.dart';
import 'package:learning_app/englishtwostudy.dart';
import 'package:learning_app/mathonestudy.dart';
import 'package:learning_app/mathonetest.dart';
import 'package:learning_app/mathtwostudy.dart';
import 'package:learning_app/mathtwotest.dart';
import 'package:learning_app/selectmode.dart';
import 'package:learning_app/test_page.dart';

class TestButton extends StatefulWidget{
  static final int SELECT_MODE=0;

  static final int ENGLISH_1_TEST=2;
  static final int ENGLISH_2_TEST=3;
  static final int ENGLISH_1_PRACTICE=4;
  static final int ENGLISH_2_PRACTICE=5;
  static final int MATH_1_TEST=6;
  static final int MATH_2_TEST=7;
  static final int MATH_1_PRACTICE=8;
  static final int MATH_2_PRACTICE=9;
  final String buttonText;
  final IconData iconData;
  final int destination;
   TestButton({Key? key, required this.buttonText, required this.iconData,required this.destination}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState()=> _testButtonState(iconData: iconData,buttonText: buttonText,destination: destination);

}
class _testButtonState extends State<TestButton>{
   String buttonText;
   IconData iconData;
   final int destination;
  _testButtonState({required this.buttonText,required this.iconData,required this.destination});
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          debugPrint('Clicked $buttonText');
          switch(destination){
            case 0:
              Navigator.push(context,MaterialPageRoute(builder: (context)=> SelectMode(testname: buttonText,)));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnglishTestOne()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnglishTestTwo()));
              break;
            case 5:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnglishPracticeTwo()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EnglishPractice()));
              break;
            case 6:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MathOneTest()));
              break;
            case 7:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MathTwoTest()));
              break;
            case 8:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MathOneStudy()));
              break;
            case 9:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MathTwoStudy()));
              break;
          }

        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Icon(iconData,size: 50,),
              const SizedBox(height: 20,),
              Text(
                buttonText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      );
  }

}