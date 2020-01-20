import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesBodegaVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesBodegaVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesBodegaVentaState createState() => _DetallesBodegaVentaState();
}

class _DetallesBodegaVentaState extends State<DetallesBodegaVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la '+widget.inmueble.tipo),
      ),
    );
  }
}