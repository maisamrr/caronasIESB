import 'package:caronapp/const.dart';
import 'package:caronapp/models/question.dart';
import 'package:flutter/material.dart';

class QuestionsTile extends StatelessWidget {
  final Question question;

  const QuestionsTile({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFf7f5f5),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: ExpansionTile(
            shape: const Border(),
            title: Text(question.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            textColor: redIdColor,
            iconColor: redIdColor,
            children: <Widget>[
              ListTile(
                  title: Text(
                question.text,
                style: const TextStyle(height: 1.5),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionsList extends StatelessWidget {
  final List<Question> questions;

  const QuestionsList({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        return QuestionsTile(question: question);
      },
    );
  }
}
