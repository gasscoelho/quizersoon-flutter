import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final int _questionNumber;
  final String _question;

  QuestionText(this._questionNumber, this._question);

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText>
    with TickerProviderStateMixin {
  Animation<double> _containerAnimation;
  AnimationController _containerAnimationControl;

  @override
  void initState() {
    super.initState();

    _containerAnimationControl = new AnimationController(
        duration: Duration(milliseconds: 1150), vsync: this);
    _containerAnimation = CurvedAnimation(
        parent: _containerAnimationControl, curve: Curves.bounceOut);
    _containerAnimation.addListener(() => this.setState(() {}));
    _containerAnimationControl.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _containerAnimationControl.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(oldWidget._question != widget._question){
      _containerAnimationControl.reset();
      _containerAnimationControl.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _containerAnimation.value * 200,
      child: Material(
        color: Color(0xffE0DAC3),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Question ${widget._questionNumber}",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Text(
                "${widget._question}",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
