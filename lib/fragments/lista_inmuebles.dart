import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inmoob/bloc/inmuebles_bloc.dart';
import 'package:inmoob/detalles_renta/detalles_bodega_renta.dart';
import 'package:inmoob/detalles_renta/detalles_casa_renta.dart';
import 'package:inmoob/detalles_renta/detalles_cuarto_renta.dart';
import 'package:inmoob/detalles_renta/detalles_departamento_renta.dart';
import 'package:inmoob/detalles_renta/detalles_hacienda_renta.dart';
import 'package:inmoob/detalles_renta/detalles_hotel_renta.dart';
import 'package:inmoob/detalles_renta/detalles_local_renta.dart';
import 'package:inmoob/detalles_renta/detalles_oficina_renta.dart';
import 'package:inmoob/detalles_renta/detalles_rancho_renta.dart';
import 'package:inmoob/detalles_renta/detalles_terreno_renta.dart';
import 'package:inmoob/detalles_venta/detalles_bodega_venta.dart';
import 'package:inmoob/detalles_venta/detalles_casa_venta.dart';
import 'package:inmoob/detalles_venta/detalles_cuarto_venta.dart';
import 'package:inmoob/detalles_venta/detalles_departamento_venta.dart';
import 'package:inmoob/detalles_venta/detalles_hacienda_venta.dart';
import 'package:inmoob/detalles_venta/detalles_hotel_venta.dart';
import 'package:inmoob/detalles_venta/detalles_local_venta.dart';
import 'package:inmoob/detalles_venta/detalles_oficina_venta.dart';
import 'package:inmoob/detalles_venta/detalles_rancho.dart';
import 'package:inmoob/detalles_venta/detalles_terreno_venta.dart';
//import 'package:inmoob/providers/db_provider.dart';
import 'package:inmoob/modelos/inmueble_model.dart';
import 'package:inmoob/providers/db_provider.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

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
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onLongPress: () {
                      _showDialog(inmuebles[i].id, context);
                    },
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
                        Text(getSimbolo(inmuebles[i].moneda) +
                            ' ${inmuebles[i].precio}')
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
                          onPressed: () async {
                            final ByteData bytes = await rootBundle
                                .load(firstPath(inmuebles[i].fotos));
                            await WcFlutterShare.share(
                                sharePopupTitle: 'share',
                                subject: 'This is subject',
                                text: '${inmuebles[i].tipo} en ${inmuebles[i].operacion} en ${inmuebles[i].ubicacion}' +
                                    '\nNumero de baños: ${inmuebles[i].numeroSanitarios} Numero de cuartos: ${inmuebles[i].numeroRecamaras}' +
                                    '\nSuperficie total: ${inmuebles[i].superficieTotal} Superficie cubierta: ${inmuebles[i].superficieCubierta}\n' +
                                    getSimbolo(inmuebles[i].moneda) +
                                    ' ${inmuebles[i].precio}',
                                fileName: 'share.png',
                                mimeType: 'image/png',
                                bytesOfFile: bytes.buffer.asUint8List());
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },          
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
    }else if(inmueble.tipo == 'Bodega' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesBodegaVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Cuarto' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesCuartoVenta(inmueble: inmueble),
      ));
    }else if(inmueble.tipo == 'Departamento' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesDepartamentoVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Hacienda' && inmueble.operacion == 'Venta') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesHaciendaVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Hotel' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesHotelVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Local' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesLocalVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Oficina' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesOficinaVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Rancho' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesRanchoVenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Terreno' && inmueble.operacion == 'Venta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesTerrenoVenta(inmueble: inmueble,)
      ));
    }else if (inmueble.tipo == 'Casa' && inmueble.operacion == 'Renta') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesCasaRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Bodega' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesBodegaRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Cuarto' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesCuartoRenta(inmueble: inmueble),
      ));
    }else if(inmueble.tipo == 'Departamento' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesDepartamentoRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Hacienda' && inmueble.operacion == 'Renta') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesHaciendaRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Hotel' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesHotelRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Local' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesLocalRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Oficina' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesOficinaRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Rancho' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesRanchoRenta(inmueble: inmueble,)
      ));
    }else if(inmueble.tipo == 'Terreno' && inmueble.operacion == 'Renta'){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetallesTerrenoRenta(inmueble: inmueble,)
      ));
    }
  }

  getSimbolo(String moneda) {
    var string = moneda;
    String newString = string.substring(string.length - 5);
    return newString;
  }

  void _showDialog(id, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ventana confirmacion'),
          content: Text('¿Desea borrar el inmueble?'),
          actions: <Widget>[
            new FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: Text('Si'),
              onPressed: () {
                inmueblesBloc.borrarInmueble(id);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
