import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesHaciendaRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesHaciendaRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesHaciendaRentaState createState() => _DetallesHaciendaRentaState();
}

class _DetallesHaciendaRentaState extends State<DetallesHaciendaRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}