import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'englishdata/englishpracticequestions.dart';

class EnglishPractice extends StatefulWidget{
  const EnglishPractice({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_testdataState();

}
// ignore: camel_case_types
class _testdataState extends State<EnglishPractice>{

  String letter="A";
  String word="Apple";
  String resource="englishresources/apple.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "English 1 - Practice",
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 30)
            ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(resource),
                        height: 300,),
                      Text(
                          letter+" for "+word,
                          style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),)
                    ],
                  ),
                ) 
            ),
            Container(
              margin: EdgeInsets.all(30),
              child:ElevatedButton(
                onPressed: (){
                  EnglishPracticeResoruces randword= EnglishPracticeResoruces.getRandomAlphabet();
                  setState(() {
                    letter=randword.alphabet;
                    word=randword.word;
                    resource="englishresources/"+randword.resource;
                  });
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
            )

          ],
        ),
      ),
    );
  }

}