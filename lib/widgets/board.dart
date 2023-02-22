import 'package:flutter/material.dart';
import 'package:wordle/game/game.dart';

class Board extends StatefulWidget {
  WorldeGame game;
  Board(this.game, {Key? key}) : super(key: key);
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.WBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: EdgeInsets.all(18.0),
                          width: 64.0,
                          height: 64.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: e.code == 0
                                ? Colors.grey.shade400
                                : e.code == 1
                                    ? Colors.green.shade400
                                    : Colors.yellow.shade400,
                          ),
                          child: Center(
                            child: Text(
                              e.letter!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
