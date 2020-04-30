import 'package:flutter/material.dart';
import 'package:youtube/screens/Inicio.dart';
import 'package:youtube/screens/Explorar.dart';
import 'package:youtube/screens/Inscricoes.dart';
import 'package:youtube/screens/Biblioteca.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indexCurrent = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      Inicio(_result),
      Explorar(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _result = res;
              });
              //print("resultado: digitado " + res);
            },
          ),
          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("ação: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("ação: conta");
            },
          )*/


        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_indexCurrent],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexCurrent,
        onTap: (index) {
          setState(() {
            _indexCurrent = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              title: Text("Inínio"),
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text("Explorar"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            )
          ]
      ),
    );
  }
}
