import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';

class DetallesBodegaRenta extends StatefulWidget{
  final Inmueble inmueble;

  const DetallesBodegaRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesBodegaRentaState createState() => _DetallesBodegaRentaState();
}

class _DetallesBodegaRentaState extends State<DetallesBodegaRenta> {
  List<String> imageList;
  List<String> _assetsList = List<String>();
  final _key = GlobalKey<FormState>();

  Widget build(BuildContext context){
    imageList = widget.inmueble.fotos.split('\n');
    RegExp regExp =
        new RegExp('/data/user/0/com.propiedades.inmo.inmoob/cache/');
    for (var i = 0; i < imageList.length; i++) {
      if (regExp.hasMatch(imageList[i])) {
        print(imageList[i]);
        _assetsList.add(imageList[i].toString());
        print(_assetsList.length);
      } else {
        print(regExp.hasMatch(imageList[i]).toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la '+widget.inmueble.tipo),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    children: List.generate(_assetsList.length, (index) {
                      File file = new File(_assetsList[index]);
                      return Image.file(
                        file,
                        height: 300,
                        width: 300,
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}