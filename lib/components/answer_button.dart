import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: _answer ? Color(0xff89C63D) : Color(0xffF14F4D),
        child: InkWell(
          onTap: () => {_onTap()},
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                _answer ? "True" : "False",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700, color: Color(0xfffcfcfc), fontStyle: FontStyle.italic),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
