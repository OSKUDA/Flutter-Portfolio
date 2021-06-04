import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: RockPaperScissorsPage(),
  ));
}

class RockPaperScissorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Center(
          child: Text('Rock Paper Scissors'),
        ),
      ),
      body: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int playerOneImage = 1;
  int playerTwoImage = 1;
  int playerOneScore = 0;
  int playerTwoScore = 0;
  bool playerOneWin = true;
  bool draw = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  playerOneScore.toString(),
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 100.0,
                  ),
                ),
                Text(
                  playerTwoScore.toString(),
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 100.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        randomImageStateGenerate();
                      });
                    },
                    child: Image.asset('images/rps$playerOneImage.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        randomImageStateGenerate();
                      });
                    },
                    child: Image.asset('images/rps$playerTwoImage.png'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 5.0),
                  child: Visibility(
                    visible: !draw,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Text(
                      playerOneWin == true && draw == false ? 'Win' : 'Lose',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 30.0,
                        color: playerOneWin == true && draw == false
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 5.0),
                  child: Visibility(
                    visible: draw,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Text(
                      'Draw',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 30.0,
                        color: Colors.teal.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 5.0),
                  child: Visibility(
                    visible: !draw,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Text(
                      playerOneWin == false && draw == false ? 'Win' : 'Lose',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 30.0,
                        color: playerOneWin == false && draw == false
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void randomImageStateGenerate() {
    playerOneImage = Random().nextInt(3) + 1; // (1-3)
    playerTwoImage = Random().nextInt(3) + 1; // (1-3)
    // compare who wins
    if (playerOneImage == playerTwoImage) {
      // draw
      draw = true;
      playerOneWin = false;
      return;
    } else {
      // not draw
      draw = false;
    }
    if (playerOneImage == 1 && playerTwoImage == 2) {
      playerOneWin = false;
    } else if (playerOneImage == 2 && playerTwoImage == 1) {
      playerOneWin = true;
    } else if (playerOneImage == 1 && playerTwoImage == 3) {
      playerOneWin = true;
    } else if (playerOneImage == 3 && playerTwoImage == 1) {
      playerOneWin = false;
    } else if (playerOneImage == 2 && playerTwoImage == 3) {
      playerOneWin = false;
    } else if (playerOneImage == 3 && playerTwoImage == 2) {
      playerOneWin = true;
    }
    // update score
    playerOneWin == true ? playerOneScore++ : playerTwoScore++;
  }
}
