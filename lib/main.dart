import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: api());
  }
}

class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  // var mydata;
  AudioPlayer ap = AudioPlayer();
  String musicpath = "assets/music.mp3";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: txt1,
              ),
              TextField(
                controller: txt2,
              ),
              ElevatedButton(
                  onPressed: () {
                    dataentry();
                  },
                  child: Text("enter")),
              ElevatedButton(
                  onPressed: () {
                    dataget();
                  },
                  child: Text("get")),

              ElevatedButton(
                  onPressed: () async {
                    await ap.play(AssetSource("music.mp3"));
                    print("audio play");
                  },
                  child: Text("play song"))
              // Text(mydata)
            ],
          ),
        ),
      ),
    );
  }

  dataentry() async {
    var url = Uri.https('akashsir.in', 'myapi/crud/todo-add-api.php');
    var response = await http
        .post(url, body: {'todo_title': txt1.text, 'todo_details': txt2.text});
    print("recorod added");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // setState(() {
    //   mydata = response.body;
    // });
  }

  dataget() async {
    var url = Uri.https('akashsir.in', 'myapi/crud/todo-list-api.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // setState(() {
    //   mydata = response.body;
    // });
  }
}
