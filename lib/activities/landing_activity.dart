import 'package:flutter/material.dart';
import 'package:quizersoon/activities/quiz_activity.dart';
import 'package:quizersoon/transitions/fade_route.dart';

class LandingAcitivty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffE0DAC3),
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            FadeRoute(page: QuizActivity()),
          )
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "Quizersoon!",
                style: TextStyle(fontSize: 30.5, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Tap to start",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}

// Colors Used:
//https://www.schemecolor.com/friendship-day.php

// Neutral
//https://www.schemecolor.com/just-about-neutral.php
