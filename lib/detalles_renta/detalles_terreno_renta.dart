import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesTerrenoRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesTerrenoRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesTerrenoRentaState createState() => _DetallesTerrenoRentaState();
}

class _DetallesTerrenoRentaState extends State<DetallesTerrenoRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}