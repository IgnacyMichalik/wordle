import 'package:flutter/material.dart';
import 'package:wordle/game/game.dart';
import 'package:wordle/widgets/keyboard.dart';

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  WorldeGame _game = WorldeGame();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WorldeGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Wordle zgadnij słowo",
            style: TextStyle(color: Colors.amber,
                fontSize: 40,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height:20.0 ,),
          Keyboard(_game),
        ],
      )
    );

  }
}
