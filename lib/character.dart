import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Character extends StatefulWidget{
  final String characterText, imagePath;
  const Character({Key? key, required this.characterText,required this.imagePath}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_CharacterState(charText: characterText,imageUrl: imagePath);

}
class _CharacterState extends State<Character>{
  String charText,imageUrl;
  _CharacterState({required this.charText,required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50,20,50,20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Image(
                  image: AssetImage(imageUrl),
                  height: 350,
                ),
                const SizedBox(height: 20,),
                Text(charText,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 25)
                )
              ],
            ),
          ),)
      ],
    );
 }

}