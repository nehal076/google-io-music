import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_io_music/circular_dots.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff202124),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: SvgPicture.asset(
          'Logo-dark.svg',
        ),
        leadingWidth: 200,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            icon: Icon(isPlaying == true
                ? CupertinoIcons.speaker_2
                : CupertinoIcons.speaker),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            CircularDots(
              count: 10,
              radius: width * 0.29,
              color: Colors.blue,
              onClickHeight: width * 0.040,
              height: width * 0.020,
              filled: true,
              sound: 's1_LowC.mp3',
              isPlaying: isPlaying,
            ),
            CircularDots(
              count: 20,
              radius: width * 0.230,
              color: Colors.yellow,
              onClickHeight: width * 0.022,
              height: width * 0.010,
              sound: 's3_C.mp3',
              isPlaying: isPlaying,
            ),
            CircularDots(
              count: 40,
              radius: width * 0.160,
              color: Colors.red,
              onClickHeight: width * 0.013,
              height: width * 0.010,
              filled: true,
              sound: 's2_E.mp3',
              isPlaying: isPlaying,
            ),
            CircularDots(
              count: 60,
              radius: width * 0.100,
              color: Colors.green,
              onClickHeight: width * 0.008,
              height: width * 0.005,
              sound: 's4_G.mp3',
              isPlaying: isPlaying,
            ),
          ],
        ),
      ),
    );
  }
}
