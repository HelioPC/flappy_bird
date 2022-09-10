import 'dart:async';

import 'package:flappy_bird/barrier.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdY = 0;
  double time = 0;
  double height = 0;
  double initiHeight = birdY;
  bool gameHasStarted = false;
  double barrierXone = 0;
  double barrierXtwo = 0;

  void jump() {
    setState(() {
      time = 0;
      initiHeight = birdY;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), ((timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        barrierXone -= .05;
        barrierXtwo -= .05;
        birdY = initiHeight - height;
      });
      if (birdY > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 3,
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  if (gameHasStarted) {
                    jump();
                  } else {
                    startGame();
                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment(0, birdY),
                  duration: const Duration(milliseconds: 0),
                  color: Colors.blue,
                  child: const Bird(),
                ),
              ),
              Container(
                alignment: const Alignment(0, -0.4),
                child: gameHasStarted
                    ? const Text('')
                    : const Text(
                        'T A P  T O  P L A Y',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                alignment: Alignment(barrierXone, 1.1),
                child: const Barrier(
                  size: 250.0,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                alignment: Alignment(barrierXtwo, -1.1),
                child: const Barrier(
                  size: 200.0,
                ),
              ),
            ])),
        Container(
          color: Colors.green,
          height: 20,
        ),
        Expanded(
          child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'SCORE',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'HIGH SCORE',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    )));
  }
}
