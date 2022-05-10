import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_io_music/circular_layout_delegate.dart';
import 'package:google_io_music/dot.dart';

class CircularDots extends StatefulWidget {
  final int count;
  final double radius;
  final Color color;
  final double height;
  final double onClickHeight;
  final bool? filled;
  final String sound;
  final bool isPlaying;

  const CircularDots({
    Key? key,
    required this.count,
    required this.radius,
    required this.color,
    required this.onClickHeight,
    required this.height,
    this.filled,
    required this.sound,
    required this.isPlaying,
  }) : super(key: key);

  @override
  State<CircularDots> createState() => _CircularDotsState();
}

class _CircularDotsState extends State<CircularDots> {
  bool tapped = false;
  List<Widget> dots = [];
  @override
  void initState() {
    super.initState();
    _buildDots();
  }

  _buildDots() {
    int num = 0;
    dots = [];
    for (int i = 0; i < widget.count; i++) {
      dots.add(
        LayoutId(
          id: 'BUTTON$i',
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            // onHover: (value) {
            //   setState(() {
            //     tapped = !tapped;
            //   });
            //   _buildDots();
            // },
            onTap: () {
              setState(() {
                tapped = !tapped;
              });
              _buildDots();
            },
            child: Dot(
              tapped: tapped,
              color: widget.color,
              onClickHeight: widget.onClickHeight,
              height: widget.height,
              filled: widget.filled,
              sound: widget.sound,
              isPlaying: widget.isPlaying,
            ),
          ),
        ),
      );
    }

    Timer.periodic(const Duration(milliseconds: 900), (timer) {
      num += 2;
      dots = [];

      for (int i = 0; i < widget.count; i++) {
        if (widget.color == Colors.blue) {
          tapped = num % (i * 8) == 0 ? true : false;
        }
        if (widget.color == Colors.yellow) {
          tapped = num % (i * 4) == 0 ? true : false;
        }
        if (widget.color == Colors.red) {
          tapped = num % (i * 2) == 0 ? true : false;
        }
        if (widget.color == Colors.green) {
          tapped = num % i == 0 ? true : false;
        }
        dots.add(
          LayoutId(
            id: 'BUTTON$i',
            child: Dot(
              tapped: tapped,
              color: widget.color,
              onClickHeight: widget.onClickHeight,
              height: widget.height,
              filled: widget.filled,
              sound: widget.sound,
              isPlaying: widget.isPlaying,
            ),
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
        _buildDots();
      },
      child: CustomMultiChildLayout(
        delegate: CircularLayoutDelegate(
          itemCount: widget.count,
          radius: widget.radius,
        ),
        children: dots,
      ),
    );
  }
}
