import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  late Color color;
  late void Function() onPressed;
  late String text;
  RoundedButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
