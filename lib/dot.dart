import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Dot extends StatefulWidget {
  final bool tapped;
  final Color color;
  final double onClickHeight;
  final double height;
  final bool? filled;
  final String sound;
  final bool isPlaying;

  const Dot({
    Key? key,
    required this.tapped,
    required this.color,
    required this.onClickHeight,
    required this.height,
    this.filled,
    required this.sound,
    required this.isPlaying,
  }) : super(key: key);

  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> {
  AudioPlayer audioPlayer = AudioPlayer();

  final audio = AudioCache();

  @override
  Widget build(BuildContext context) {
    if (widget.tapped) {
      if (widget.isPlaying) {
        audio.play(widget.sound, volume: 0.2);
      }
    }

    return widget.tapped
        ? Container(
            height: widget.onClickHeight,
            width: widget.onClickHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          )
        : Container(
            height: widget.height,
            width: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.filled == true ? Colors.white : null,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          );
  }
}
