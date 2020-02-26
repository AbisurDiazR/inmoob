import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inmoob/modelos/inmueble_model.dart';
import 'package:intl/intl.dart';

class DetallesCasaRenta extends StatefulWidget {
  final Inmueble inmueble;

  const DetallesCasaRenta({Key key, this.inmueble}) : super(key: key);

  @override
  _DetallesCasaRentaState createState() => _DetallesCasaRentaState();
}

class _DetallesCasaRentaState extends State<DetallesCasaRenta> {
  List<String> imageList;
  List<String> _assetsList = List<String>();
  final _key = GlobalKey<FormState>();

  String _diasRenta;
  String _controllerDate = 'Seleccionar fecha';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setState(() {
        _controllerDate = new DateFormat('dd-MM-yyyy').format(date);
      });
    }
  }

  Widget build(BuildContext context) {
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
        title: Text('Detalles de la ' + widget.inmueble.tipo),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                //Galeria de imagenes
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
                ),

                //Input de la ubicacion
                TextFormField(
                  initialValue: widget.inmueble.ubicacion,
                  decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Ubicacion',
                      labelText: 'Ubicacion'),
                ),

                //Input del precio
                TextFormField(
                    initialValue: widget.inmueble.precio.toString(),
                    decoration: InputDecoration(
                        icon: Icon(Icons.attach_money),
                        hintText: 'Precio del inmueble',
                        labelText: 'Precio del inmueble'),
                    keyboardType: TextInputType.number),

                //Input de superficie total
                TextFormField(
                    initialValue: widget.inmueble.superficieTotal.toString(),
                    decoration: InputDecoration(
                        icon: Icon(Icons.swap_horizontal_circle),
                        hintText: 'Superficie total',
                        labelText: 'Superficie total'),
                    keyboardType: TextInputType.number),

                //Input superficie cubierta
                TextFormField(
                    initialValue: widget.inmueble.superficieCubierta.toString(),
                    decoration: InputDecoration(
                        icon: Icon(Icons.swap_horizontal_circle),
                        hintText: 'Superficie cubierta',
                        labelText: 'Superficie cubierta'),
                    keyboardType: TextInputType.number),

                //Input Numero de recamaras
                TextFormField(
                    initialValue: widget.inmueble.numeroRecamaras.toString(),
                    decoration: InputDecoration(
                        icon: Icon(Icons.whatshot),
                        hintText: 'Numero de recamaras',
                        labelText: 'Numero de recamaras'),
                    keyboardType: TextInputType.number),

                //Input Numero de baños
                TextFormField(
                    initialValue: widget.inmueble.numeroSanitarios.toString(),
                    decoration: InputDecoration(
                        icon: Icon(Icons.whatshot),
                        hintText: 'Numero de baños',
                        labelText: 'Numero de baños'),
                    keyboardType: TextInputType.number),

                //TextArea descripcion del inmueble
                TextFormField(
                  initialValue: widget.inmueble.descripcion,
                  decoration: InputDecoration(
                      hintText: 'Descripcion (opcional)',
                      labelText: 'Descripcion (opcional)'),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),

                //Dias renta
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Dias de renta:'),
                    DropdownButton(
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23',
                        '24',
                        '25',
                        '26',
                        '27',
                        '28',
                        '29',
                        '30',
                        '31'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String newVal) {
                        setState(() {
                          _diasRenta = newVal;
                        });
                      },
                      hint: Text('Seleccionar dia'),
                      value: _diasRenta,
                    )
                  ],
                ),

                //Fin de contrato
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Fin de contrato:'),
                    InkWell(
                      child: Text(
                        _controllerDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                      onTap: (){
                        _selectDate(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Seleccionar fecha',
                      onPressed: (){
                        _selectDate(context);
                      },
                    )
                  ],
                ),

                //Botón para actualizar el inmueble
                FlatButton.icon(
                  icon: Icon(Icons.add_box),
                  label: Text('Actualizar'),
                  onPressed: _actualizarInmueble,
                  focusColor: Colors.lightBlueAccent,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _actualizarInmueble() async {}
}
