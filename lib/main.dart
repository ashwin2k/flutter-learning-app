import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/charselect.dart';
import 'package:learning_app/test_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name="";
  void setName(String cng){
    print(cng);
    setState(() {
      name=cng;
    });
  }

  @override
  Widget build(BuildContext context) {
    getSavedPrefs();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 0 , 20, 0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 250),
            Text("What's your name?",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w200,fontSize: 35)
            ),
            const SizedBox(height: 15),
            TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: const InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value){
                setState(() {
                  name=value;
                });
              },

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("userName", name);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CharacterSelect()));
      },
      child: const Icon(Icons.navigate_next),),
    );
  }
  void getSavedPrefs() async{
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('userName') ?? null;
    if(counter!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TestSelectScreen()));

    }

  }
}
