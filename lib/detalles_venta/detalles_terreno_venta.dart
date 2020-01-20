import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesTerrenoVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesTerrenoVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesTerrenoVentaState createState() => _DetallesTerrenoVentaState();
}

class _DetallesTerrenoVentaState extends State<DetallesTerrenoVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}