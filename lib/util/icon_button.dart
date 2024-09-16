import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String iconimagepath;
  final String buttontext;
  final Color color;
  const MyIconButton(
      {super.key,
      required this.buttontext,
      required this.color,
      required this.iconimagepath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        Container(
          height: 70,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: color),
          child: Center(
            child: Image.asset(
              iconimagepath,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //text
        Text(
          buttontext,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
