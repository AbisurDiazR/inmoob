import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesTerrenoVenta extends StatelessWidget{
  final Inmueble inmueble;

  const DetallesTerrenoVenta({Key key, this.inmueble}) : super(key: key);

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+inmueble.tipo),
      ),
    );
  }
}