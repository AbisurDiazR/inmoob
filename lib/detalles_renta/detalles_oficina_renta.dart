import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesOficinaRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesOficinaRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesOficinaRentaState createState() => _DetallesOficinaRentaState();
}

class _DetallesOficinaRentaState extends State<DetallesOficinaRenta> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de '+widget.inmueble.tipo),
      ),
    );
  }
}