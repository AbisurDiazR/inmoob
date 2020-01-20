import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesCuartoRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesCuartoRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesCuartoRentaState createState() => _DetallesCuartoRentaState();
}

class _DetallesCuartoRentaState extends State<DetallesCuartoRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}