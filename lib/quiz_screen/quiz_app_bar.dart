

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key2iq_quiz/classes/question_class.dart';
class QuizAppBar extends StatefulWidget {
  final List<Questions> index;
  final Questions question;
  final ValueChanged<int> onClickedTab;
  const QuizAppBar({Key? key,required this.index,required this.question,required this.onClickedTab}) : super(key: key);

  @override
  _QuizAppBarState createState() => _QuizAppBarState();
}

class _QuizAppBarState extends State<QuizAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
