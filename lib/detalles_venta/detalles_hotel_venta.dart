import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesHotelVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesHotelVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesHotelVentaState createState() => _DetallesHotelVentaState();
}

class _DetallesHotelVentaState extends State<DetallesHotelVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}