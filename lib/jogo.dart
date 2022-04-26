import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  _opcaoSelecionada(String escolhaUsuario) {
    print("Opção Selecionada" + escolhaUsuario);
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    var escolhausuario = opcoes[numero];

    print("Escolha do App: " + escolhaApp);

    print("Escolha do usuario: " + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você Ganhou";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = " Você Perdeu";
      });
    } else {
      this._mensagem = "Empate";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  )),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,

                    /*Image.asset("images/papel.png", height: 100),
              Image.asset("images/pedra.png", height: 100),
              Image.asset("images/tesoura.png", height: 100),*/
                  ))
            ],
          )
        ],
      ),
    );
  }
}
