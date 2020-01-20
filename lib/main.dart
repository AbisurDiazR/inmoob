import 'package:flutter/material.dart';
import 'package:inmoob/fragments/agregarInmueble.dart';
import 'package:inmoob/fragments/lista_inmuebles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.list), text: 'Lista',),
                Tab(icon: Icon(Icons.add), text: 'Añadir propiedad',),
                Tab(icon: Icon(Icons.menu), text: 'Menu',),
                Tab(icon: Icon(Icons.home), text: 'Admon Rentas',)
              ],
            ),
            title: Text('Inmoob'),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.search), onPressed: (){})
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              ListaInmuebles(),
              AgregarInmueble(),
              Tab(icon: Icon(Icons.menu)),
              Tab(icon: Icon(Icons.home))
            ],
          ),
        ),
      ),
    );
  }
}


