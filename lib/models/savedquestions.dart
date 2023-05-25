import 'package:caronapp/models/carmodel.dart';
import 'package:caronapp/models/question.dart';
import 'package:flutter/material.dart';

class SavedQuestions {
  final List<Question> _savedQuestions = [
    Question(
      title: 'Como faço para pedir uma carona?',
      text:
          'Na tela inicial, informe seu destino e confira o local de partida. Em seguida, toque em "Confirmar". Espere alguns minutos para ver as informações da sua viagem, você deverá ver os dados da pessoa motorista e os demais passageiros, se for o caso. Depois disso, seu assento será reservado. Acompanhe pelo app quando a carona estiver a caminho do local de partida.',
    ),
    Question(
      title: 'Qual é o preço de uma viagem?',
      text:
          'As viagens no VemJunto são de graça. Não é permitido cobrar por uma viagem através do app.',
    ),
    Question(
      title: 'Como adicionar um veículo no aplicativo?',
      text:
          'Na tela inicial, informe seu destino e confira o local de partida. Em seguida, toque em "Confirmar". Espere alguns minutos para ver as informações da sua viagem, você deverá ver os dados da pessoa motorista e os demais passageiros, se for o caso. Depois disso, seu assento será reservado. Acompanhe pelo app quando a carona estiver a caminho do local de partida.',
    ),
    Question(
      title: 'Como faço para oferecer uma carona?',
      text:
          'Na tela inicial, informe seu destino e confira o local de partida. Em seguida, toque em "Confirmar". Espere alguns minutos para ver as informações da sua viagem, você deverá ver os dados da pessoa motorista e os demais passageiros, se for o caso. Depois disso, seu assento será reservado. Acompanhe pelo app quando a carona estiver a caminho do local de partida.',
    ),
  ];

  List<Question> get savedQuestions => _savedQuestions;
}
