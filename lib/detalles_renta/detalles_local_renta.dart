import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesLocalRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesLocalRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesLocalRentaState createState() => _DetallesLocalRentaState();
}

class _DetallesLocalRentaState extends State<DetallesLocalRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}