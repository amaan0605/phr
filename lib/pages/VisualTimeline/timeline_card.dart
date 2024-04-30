import 'package:flutter/material.dart';

//This is a card which is used tho show in the timeline .
class TimelineCard extends StatefulWidget {
  final String text;
  final Color color;
  const TimelineCard({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 163,
          width: 163,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ),
        Container(
          width: 32,
          height: 8,
          decoration: BoxDecoration(
              color: const Color(0xffB3B3B3),
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    );
  }
}
