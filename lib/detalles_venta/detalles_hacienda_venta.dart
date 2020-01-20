import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesHaciendaVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesHaciendaVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesHaciendaVentaState createState() => _DetallesHaciendaVentaState();
}

class _DetallesHaciendaVentaState extends State<DetallesHaciendaVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}