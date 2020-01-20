import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesCuartoVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesCuartoVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesCuartoVentaState createState() => _DetallesCuartoVentaState();
}

class _DetallesCuartoVentaState extends State<DetallesCuartoVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}