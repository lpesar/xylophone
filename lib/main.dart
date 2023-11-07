import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Notas {
  String nota;
  Color color;
  int sonido;
  Notas({required this.nota, required this.color, required this.sonido});
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Notas> notas = [
    Notas(nota: "Do", color: Colors.pink, sonido: 1),
    Notas(nota: "Re", color: Colors.indigo, sonido: 2),
    Notas(nota: "Mi", color: Colors.green, sonido: 3),
    Notas(nota: "Fa", color: Colors.yellow, sonido: 4),
    Notas(nota: "Sol", color: Colors.orange, sonido: 5),
    Notas(nota: "La", color: Colors.brown, sonido: 6),
    Notas(nota: "Si", color: Colors.blue, sonido: 7)
  ];

  List<Widget> buildSection1ListItems() {
    List<Widget> sonido = [];
    for (var i = 0; i < notas.length; i++) {
      sonido.add(
        buildKey(colorKey: notas[i].color, note: notas[i].sonido, notas: notas[i].nota),
      );
    }
    return sonido;
  }

  AudioCache audioCache = AudioCache();

  void playNote(int note) {
    // audioCache.play('/assets/audios/note$note.wav');
    final player = AudioPlayer();
    player.play(AssetSource('audios/note$note.wav'));
  }

  Widget buildKey({required Color colorKey, required int note, required String notas}) {
    return Expanded(
      child: Container(
        color: colorKey,
        child: TextButton(
          onPressed: () {
            playNote(note);
          },
          child: Text(notas, style: TextStyle(fontSize: 25.0, color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Xylophone"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...buildSection1ListItems()
        ],
      ),
    );
  }
}
