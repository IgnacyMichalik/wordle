import 'dart:ui';
import 'package:wordle/game/game.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordle/widgets/board.dart';

class Keyboard extends StatefulWidget {
  Keyboard(this.game, {Key? key}) : super(key: key);
  WorldeGame game;
  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WorldeGame.info,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        Board(widget.game),
        SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.blueAccent.shade400,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.blueAccent.shade400,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (e == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  if (widget.game.letterId >= 5) {
                    String guess = widget.game.WBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    if (widget.game.checkWordExist(guess.toLowerCase())) {
                      if (guess == WorldeGame.podpowiedz) {
                        setState(() {
                          WorldeGame.info = "Wygrałeś";
                          widget.game.WBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      } else {
                        int listLength = guess.length;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i];
                          if (WorldeGame.podpowiedz.contains(char)) {
                            if (WorldeGame.podpowiedz[i] == char) {
                              setState(() {
                                widget.game.WBoard[widget.game.rowId][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                widget.game.WBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            }
                          }
                        }
                      }widget.game.rowId++;
                      widget.game.letterId =0 ;
                    }else{
                      WorldeGame.info = "Takie słowo nie występuje w naszj bazie";
                    }
                  }
                } else {
                  if (widget.game.letterId < 5) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId, Letter(e, 0));
                      widget.game.letterId++;
                    });
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.blueAccent.shade400,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
