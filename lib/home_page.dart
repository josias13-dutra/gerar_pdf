import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'genrate_printing.dart';

class HomePage extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerando PDF!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,

                child: RiveAnimation.asset('assets/animations/charge.riv'),
              ),
              Text(
                'Gerador de PDF!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),

              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  String nome = nomeController.text;
                  String cpf = cpfController.text;
                  String email = emailController.text;

                  // Chama a função para gerar o PDF
                  await GeneratePrinting().generatePrinting(nome, cpf, email);
                },
                child: Text('Gerar PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
