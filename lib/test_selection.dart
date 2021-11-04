import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/testbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestSelectScreen extends StatefulWidget{
  const TestSelectScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_testSelectState();

}
// ignore: camel_case_types
class _testSelectState extends State<TestSelectScreen>{
  String user_name="";
  @override
  Widget build(BuildContext context) {
    getDisplayName();
    return Scaffold(

      body: SafeArea(
        top: true,
        bottom:true,
        left:true,
        right:true,
        child:Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Row(

                    children: [
                      Container(
                        child: Text("Hi,",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200,fontSize: 35)
                        ),
                        margin: const EdgeInsets.only(left: 20),
                      ),

                      Text(user_name,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 35)
                      ),
                    ],
                  ),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children:  [
                      TestButton(buttonText: "English 1",iconData:FontAwesomeIcons.language,destination: TestButton.SELECT_MODE,),
                      TestButton(buttonText: "English 2",iconData:FontAwesomeIcons.language,destination: TestButton.SELECT_MODE,),
                      TestButton(buttonText: "Math 1",iconData:FontAwesomeIcons.language,destination: TestButton.SELECT_MODE,),
                      TestButton(buttonText: "Math 2",iconData:FontAwesomeIcons.language,destination: TestButton.SELECT_MODE,)
                    ],
                    
                  ),
                ]
            )
        ),
      )

    );
  }
  void getDisplayName() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user_name= prefs.getString("userName") ??"";

    });
  }
}