import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesOficinaVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesOficinaVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesOficinaVentaState createState() => _DetallesOficinaVentaState();
}

class _DetallesOficinaVentaState extends State<DetallesOficinaVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}