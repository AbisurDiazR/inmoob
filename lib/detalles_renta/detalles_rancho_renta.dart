import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesRanchoRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesRanchoRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesRanchoRentaState createState() => _DetallesRanchoRentaState();
}

class _DetallesRanchoRentaState extends State<DetallesRanchoRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}