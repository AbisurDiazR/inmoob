import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesCasaRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesCasaRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesCasaRentaState createState() => _DetallesCasaRentaState();
}

class _DetallesCasaRentaState extends State<DetallesCasaRenta> {
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