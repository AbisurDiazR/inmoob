import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesDepartamentoRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesDepartamentoRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesDepartamentoRentaState createState() => _DetallesDepartamentoRentaState();
}

class _DetallesDepartamentoRentaState extends State<DetallesDepartamentoRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}