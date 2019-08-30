import 'package:flutter/material.dart';
import 'package:quizersoon/activities/score_activity.dart';
import 'package:quizersoon/components/answer_button.dart';
import 'package:quizersoon/components/card_overlay.dart';
import 'package:quizersoon/components/question_text.dart';
import 'package:quizersoon/models/question.dart';
import 'package:quizersoon/models/quiz.dart';
import 'package:quizersoon/transitions/fade_route.dart';

class QuizActivity extends StatefulWidget {
  @override
  _QuizActivityState createState() => _QuizActivityState();
}

class _QuizActivityState extends State<QuizActivity> {
  Question currentQuestion;
  Quiz quiz = new Quiz(loadQuestions());
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();

    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    setState(() {
      debugPrint(questionNumber.toString());
      overlayVisible = true;
    });
  }

  static List<Question> loadQuestions() {
    return [
      new Question(
          "On average, there are 5 lightning strikes every second on Earth.",
          true),
      new Question(
          "One-third of Earth’s land surface is partially or totally arid.",
          true),
      new Question("Oceans cover 45% of Earth’s surface.", false),
      new Question(
          "The Atacama Desert in Chile is the driest place on Earth.", true),
      new Question(
          "Earth could fit more than one million times into the Sun.", true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionNumber, questionText),
            AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayVisible
            ? CardOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.push(
                      context,
                      FadeRoute(page: ScoreActivity(quiz.score, quiz.length)));
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                setState(() {
                  overlayVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : Container()
      ],
    );
  }
}
