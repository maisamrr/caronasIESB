import 'package:caronapp/const.dart';
import 'package:caronapp/models/question.dart';
import 'package:caronapp/models/savedquestions.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/cadastro.dart';
import 'package:flutter/material.dart';

import '../widgets/questionstile.dart';

class Faq extends StatelessWidget {
  Faq({Key? key}) : super(key: key);

  SavedQuestions savedQuestions = SavedQuestions();

  @override
  Widget build(BuildContext context) {
    List<Question> questions = savedQuestions.savedQuestions;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 40.0,
                ),
                child: GestureDetector(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.grey,
                  ),
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Atividades()))
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: QuestionsList(questions: questions),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
