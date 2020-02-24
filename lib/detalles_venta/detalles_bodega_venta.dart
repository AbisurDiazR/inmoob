import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';
//import 'package:inmoob/providers/db_provider.dart';

class DetallesBodegaVenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesBodegaVenta({Key key, this.inmueble}) : super(key: key);  

  @override
  _DetallesBodegaVentaState createState() => _DetallesBodegaVentaState();
}

class _DetallesBodegaVentaState extends State<DetallesBodegaVenta> {
  List<String> imageList;
  List<String> _assetsList = List<String>();
    
  Widget build(BuildContext context){
    //final Inmueble inmueble = DBprovider.db.getInmuebleById(widget.inmueble.id) as Inmueble;    
    imageList = widget.inmueble.fotos.split('\n');
    RegExp regExp = new RegExp('/data/user/0/com.propiedades.inmo.inmoob/cache/');
    for (var i = 0; i < imageList.length; i++) {
      if(regExp.hasMatch(imageList[i])){
        print(imageList[i]);
        _assetsList.add(imageList[i].toString());
        print(_assetsList.length);
      }else{
        print(regExp.hasMatch(imageList[i]).toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la '+widget.inmueble.tipo),
      ),
      body: ListView.builder(
        itemCount: _assetsList.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.file(new File(_assetsList[index])),
            title: Text(_assetsList[index]),
            subtitle: Text(index.toString())
          );
        },
      ),
    );
  }

  fileName(String cadena) {
    var filePath = cadena;
    return new File(filePath);
  }
}