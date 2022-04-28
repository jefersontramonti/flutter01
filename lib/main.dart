import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<MyApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
    {
      'texto': 'Qual é seu carro favorito?',
      'respostas': ['Gol', 'Celta', 'Omega', 'civic'],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
                  ...respostas.map((e) => Resposta(e, _responder)).toList(),
                ],
              )
            : const Center(
                child: Text('Parabens voce chegou ate aqui!!!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    )),
              ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
