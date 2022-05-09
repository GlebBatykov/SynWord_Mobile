import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'wave_ball/wave_ball.dart';

class WaveBar extends StatelessWidget {
  final double progress;

  const WaveBar({Key? key, required this.progress}) : super(key: key);

  List<Color> _getColors() {
    late List<Color> colors;

    if (progress >= 0.8) {
      colors = [HexColor("#1eff00"), HexColor("#7bff69")];
    } else if (progress >= 0.6) {
      colors = [HexColor("#62ff4d"), HexColor("#92fc83")];
    } else if (progress >= 0.4) {
      colors = [HexColor("#fff600"), HexColor("#fdfaa4")];
    } else if (progress >= 0.2) {
      colors = [HexColor("#ff5757"), HexColor("#ff9292")];
    } else {
      colors = [HexColor("#ff0000"), HexColor("#ff4848")];
    }

    return colors;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var colors = _getColors();

    return Container(
      width: (size.width + size.height) / 8.5,
      height: (size.width + size.height) / 8.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(width: 0.8)),
      child: Center(
        child: WaveBall(
          size: (size.width + size.height) / 8.5,
          circleColor: Colors.white,
          foregroundColor: colors[0],
          backgroundColor: colors[1],
          progress: progress,
          range: 8,
          child: Center(
            child: Text(
              (progress * 100).toInt().toString() + '%',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Audrey'),
            ),
          ),
        ),
      ),
    );
  }
}
