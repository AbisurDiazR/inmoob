import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesLocalVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesLocalVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesLocalVentaState createState() => _DetallesLocalVentaState();
}

class _DetallesLocalVentaState extends State<DetallesLocalVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}