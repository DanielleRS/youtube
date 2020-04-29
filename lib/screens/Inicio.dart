import 'package:flutter/material.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.search("");

    return Container(
      child: Center(
        child: Text(
          "Início",
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ),
    );
  }
}
