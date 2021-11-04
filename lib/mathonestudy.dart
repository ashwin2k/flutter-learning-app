import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MathOneStudy extends StatefulWidget{
  const MathOneStudy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_mathOneStudyState();

}

class _mathOneStudyState extends State<MathOneStudy>{
  var emoji_list=["⚽","🎲","🔑","🍬","🚗"];
  var emoji_names=["balls","dice","bat","chocolate","cars"];
  int number=1;
  int index=0;
  @override
  Widget build(BuildContext context) {
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
}