import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final size;

  const Barrier({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: Color.fromARGB(255, 19, 63, 20),
          width: 10,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    ));
  }
}
