import 'dart:math';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  final _controller = TextEditingController(); 
  int? _targetNumber; 
  String _feedback = ''; 
  
  // Função para iniciar o jogo
  void _startGame() {
    setState(() {
      _targetNumber = Random().nextInt(60) + 1; 
      _feedback = 'Escolha um número de 1 até 60'; 
      _controller.clear(); 
    });
  }

  
  void _submitGuess() {
    if (_targetNumber == null) return; // verifica se o jogo ainda foi iniciado

    final guess = int.tryParse(_controller.text); // Tenta converter a tentativa em um número
    if (guess == null) {
      return;
    }

    // mensagens para ver se acertou ou se foi quase acerto
    if (guess == _targetNumber) {
      setState(() {
        _feedback = 'Voce acertou!'; 
      });
    } else if (guess < _targetNumber!) {
      setState(() {
        _feedback = 'Seu numero foi menor do que o sorteado'; 
      });
    } else {
      setState(() {
        _feedback = 'Seu numero foi maior do que o sorteado'; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerte o numero'), 
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startGame, // começa o jogo
                child: const Text('Começar'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,  // controla a caixa do texto
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sua tentativa', 
                ),
                keyboardType: TextInputType.number, 
                onSubmitted: (_) => _submitGuess(), 
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitGuess, // manda a tentativa ao apertar o botão
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 20),
              Text(
                _feedback, 
                style: const TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[50], 
    );
  }
}
