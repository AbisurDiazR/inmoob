import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesCasaVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesCasaVenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesCasaVentaState createState() => _DetallesCasaVentaState();
}

class _DetallesCasaVentaState extends State<DetallesCasaVenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la '+widget.inmueble.tipo),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(widget.inmueble.id.toString()),
      ),
    );
  }
}