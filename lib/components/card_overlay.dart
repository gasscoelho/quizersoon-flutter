import 'package:flutter/material.dart';
import 'package:quizersoon/icons/happy_icons.dart';
import 'package:quizersoon/icons/sad_icons.dart';

class CardOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  CardOverlay(this._isCorrect, this._onTap);

  @override
  _CardOverlayState createState() => _CardOverlayState();
}

class _CardOverlayState extends State<CardOverlay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => {widget._onTap()},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: widget._isCorrect ? Color(0xff89C63D) : Color(0xffF14F4D),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget._isCorrect ? Happy.emo_happy : Sad.emo_unhappy,
                color: Colors.white,
                size: 32.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(widget._isCorrect ? "Correct!" : "Wrong!", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}
