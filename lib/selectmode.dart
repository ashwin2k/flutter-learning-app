import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/testbutton.dart';

class SelectMode extends StatefulWidget{
  final String testname;
  const SelectMode({Key? key, required this.testname}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() =>_selectModeState(testname: testname);

}
// ignore: camel_case_types
class _selectModeState extends State<SelectMode>{
  final String testname;
  _selectModeState({required this.testname});
  @override
  Widget build(BuildContext context) {
    List<int> modes=chooseTest(testname);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select test mode"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
            Text("    Select a test mode",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 30)
            ),
            Container(
            alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 185,
                    child:TestButton(buttonText: "Practice Mode",iconData:FontAwesomeIcons.language,destination: modes[0],),
                  ),
                  Container(
                    height: 200,
                    width: 185,
                    child:TestButton(buttonText: "Test Mode",iconData:FontAwesomeIcons.language,destination: modes[1],),
                  ),
                ]
              )
            )
            ],
          ),
        );

  }

  List<int> chooseTest(String tName){
    List<int> result=[0,0];
    switch(tName){
      case "English 1":
        result=[TestButton.ENGLISH_1_PRACTICE,TestButton.ENGLISH_1_TEST];
        return result;
      case "English 2":
        result=[TestButton.ENGLISH_2_PRACTICE,TestButton.ENGLISH_2_TEST];
        return result;
      case "Math 1":
        result=[TestButton.MATH_1_PRACTICE,TestButton.MATH_1_TEST];
        return result;
      case "Math 2":
        result=[TestButton.MATH_2_PRACTICE,TestButton.MATH_2_TEST];
        return result;
      default:
        result=[TestButton.ENGLISH_1_PRACTICE,TestButton.ENGLISH_1_TEST];
        return result;
    }
  }

}
