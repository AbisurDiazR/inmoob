import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesBodegaRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesBodegaRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesBodegaRentaState createState() => _DetallesBodegaRentaState();
}

class _DetallesBodegaRentaState extends State<DetallesBodegaRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la '+widget.inmueble.tipo),
      ),
    );
  }
}