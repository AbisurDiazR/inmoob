import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmoob/bloc/inmuebles_bloc.dart';
import 'package:inmoob/detalles_venta/detalles_casa_venta.dart';
//import 'package:inmoob/providers/db_provider.dart';
import 'package:inmoob/modelos/inmueble_model.dart';
import 'package:inmoob/providers/db_provider.dart';
import 'package:share_extend/share_extend.dart';

class ListaInmuebles extends StatelessWidget {
  final inmueblesBloc = InmueblesBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Inmueble>>(
      future: DBprovider.db.getAllInmuebles(),
      builder: (BuildContext context, AsyncSnapshot<List<Inmueble>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final inmuebles = snapshot.data;

        if (inmuebles.length == 0) {
          return Center(
            child: Text('No ha añadido ningun inmueble aun'),
          );
        }

        return ListView.builder(
          itemCount: inmuebles.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.orangeAccent,
            ),
            onDismissed: (direction) =>
                inmueblesBloc.borrarInmueble(inmuebles[i].id),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.file(
                      fileName(firstPath(inmuebles[i].fotos)),
                      width: 100.0,
                      height: 100.0,
                    ),
                    title: Text(
                      '${inmuebles[i].tipo} en ${inmuebles[i].operacion} en ${inmuebles[i].ubicacion}',
                      style: new TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Numero de baños: ${inmuebles[i].numeroSanitarios} Numero de cuartos: ${inmuebles[i].numeroRecamaras}',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Superficie total: ${inmuebles[i].superficieTotal} Superficie cubierta: ${inmuebles[i].superficieCubierta}',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          getSimbolo(inmuebles[i].moneda) +' ${inmuebles[i].precio}'
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.details),
                          label: Text('Detalles'),
                          onPressed: () {
                            //print('Detallando....${inmuebles[i].id}');
                            navegacionDetalles(context, inmuebles[i]);
                          },
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.share),
                          label: Text('Compartir'),
                          onPressed: () {
                            List<String> imageList = inmuebles[i].fotos.split('\n');
                            ShareExtend.shareMultiple(imageList, 'image');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  firstPath(String cadena) {
    List<String> arrayString = cadena.split('\n');
    return arrayString[0];
  }

  fileName(String cadena) {
    var filePath = cadena;
    return new File(filePath);
  }

  navegacionDetalles(BuildContext context, Inmueble inmueble) {
    //print('Id inmueble: ' + inmueble.id.toString() + ' Tipo inmueble: ' + inmueble.tipo + ' Estado inmueble: ' + inmueble.operacion);
    if (inmueble.tipo == 'Casa' && inmueble.operacion == 'Venta') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetallesCasaVenta(
              inmueble: inmueble,
            ),
          ));
    } else if(inmueble.tipo == 'Casa' && inmueble.operacion == 'Renta'){
      print('Redirigiendo a renta....');
    }
  }

  getSimbolo(String moneda) {
    var string = moneda;
    String newString = string.substring(string.length-5);
    return newString;
  }
}
