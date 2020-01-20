import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesRanchoVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesRanchoVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesRanchoVentaState createState() => _DetallesRanchoVentaState();
}

class _DetallesRanchoVentaState extends State<DetallesRanchoVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}