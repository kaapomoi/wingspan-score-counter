import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScoreCounter extends StatefulWidget {
  final String iconPath;
  final Function(int) cb;

  const ScoreCounter({super.key, required this.iconPath, required this.cb});

  @override
  State<ScoreCounter> createState() => _ScoreCounterState();
}

class _ScoreCounterState extends State<ScoreCounter> {
  late int value;
  late String iconPath;

  @override
  void initState() {
    super.initState();
    value = 0;
    iconPath = widget.iconPath;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              widget.cb(-value);
              value = 0;
            });
            HapticFeedback.selectionClick();
          }, // Image tapped
          splashColor: Colors.white10, // Splash color over image
          child: Ink.image(
            fit: BoxFit.cover, // Fixes border issues
            width: 80,
            height: 80,
            image: AssetImage(iconPath),
          ),
        ),
        SizedBox(
          width: 80.0,
          height: 80.0,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                value--;
                widget.cb(-1);
              });
              HapticFeedback.heavyImpact();
            },
            child: const Image(
              image: AssetImage("assets/icon_buttonBackMenu.png"),
              width: 80.0,
              height: 80.0,
            ),
          ),
        ),
        Text(
          '$value',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          width: 80.0,
          height: 80.0,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                value++;
                widget.cb(1);
              });
              HapticFeedback.heavyImpact();
            },
            child: const Image(
              image: AssetImage("assets/icon_Store_arrow.png"),
              width: 80.0,
              height: 80.0,
            ),
          ),
        ),
      ],
    );
  }
}
