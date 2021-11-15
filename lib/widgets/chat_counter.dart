import 'package:flutter/material.dart';

class ChatCounter extends StatelessWidget {
  const ChatCounter({
    Key? key,
    required this.count,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.green,
    this.width = 20.0,
    this.height = 20.0,
  }) : super(key: key);

  final Color? foregroundColor;
  final Color? backgroundColor;
  final int count;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          "5",
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
