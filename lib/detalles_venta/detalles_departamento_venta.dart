import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesDepartamentoVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesDepartamentoVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesDepartamentoVentaState createState() => _DetallesDepartamentoVentaState();
}

class _DetallesDepartamentoVentaState extends State<DetallesDepartamentoVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}