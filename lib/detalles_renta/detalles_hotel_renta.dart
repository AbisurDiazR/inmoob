import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesHotelRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesHotelRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesHotelRentaState createState() => _DetallesHotelRentaState();
}

class _DetallesHotelRentaState extends State<DetallesHotelRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}