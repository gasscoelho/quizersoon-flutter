import 'package:flutter/material.dart';
import 'package:quizersoon/activities/landing_activity.dart';
import 'package:quizersoon/transitions/fade_route.dart';

class ScoreActivity extends StatelessWidget {
  final int score;
  final int totalQuestion;

  ScoreActivity(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    final double average = score.toDouble() / totalQuestion.toDouble();
    return Material(
      color: Color(0xff4B378E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${score}/${totalQuestion}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 80.0)),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              (average <= 0.5
                  ? "C'mon, you can do better!"
                  : (average < 0.8 ? "You rocked!" : "Wow! You nailed it!")),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 25.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: IconButton(
              icon: Icon(Icons.replay, size: 48.0,),
              color: Colors.white,
              onPressed: () => {
                Navigator.pushAndRemoveUntil(
                    context,
                    FadeRoute(page: LandingAcitivty()),
                    (Route route) => route == null)
              },
            ),
          )
        ],
      ),
    );
  }
}
