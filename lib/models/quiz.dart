import 'package:quizersoon/models/question.dart';

class Quiz {
  int _score = 0;
  int _currentQuestion = -1;
  List<Question> _questions;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get questionNumber => _currentQuestion + 1;
  int get score => _score;
  int get length => _questions.length;

  Question get nextQuestion {
    _currentQuestion++;
    if (_currentQuestion >= length) return null;
    return questions[questionNumber - 1];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}
