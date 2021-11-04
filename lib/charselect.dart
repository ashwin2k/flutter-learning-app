import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/character.dart';
import 'package:learning_app/test_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterSelect extends StatefulWidget{
  const CharacterSelect({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CharacterSelectState();

}

class _CharacterSelectState extends State<CharacterSelect>{
  List<String> char_names=["ChottaBheem","ChottaBheem2","ChottaBheem3"];
  List<String> char_resources=["assets/chotta_bheem1.png","assets/chotta_bheem1.png","assets/chotta_bheem1.png"];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Select"),
        ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: const [
            Character(characterText: "ChottaBheem", imagePath: "assets/chotta_bheem1.png"),
            Character(characterText: "ChottaBheem2", imagePath: "assets/chotta_bheem1.png"),
            Character(characterText: "ChottaBheem3", imagePath: "assets/chotta_bheem1.png")
          ],
          onPageChanged: (page){
            print(page.toInt());
            setState(() {
              index=page.toInt();
            });

          },
        )
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

            )
          )
        ),
        onPressed: ()async{

          final prefs = await SharedPreferences.getInstance();
          prefs.setString("charName", char_names[index]);
          prefs.setString("charResource", char_resources[index]);

          Navigator.push(context, MaterialPageRoute(
            builder: (context)=> const TestSelectScreen()
          ));

        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child:Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[ Text(
              "FINISH",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
              )],
          ) ,
        )

      )
    );
  }

}
