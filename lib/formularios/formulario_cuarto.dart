import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inmoob/bloc/inmuebles_bloc.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class AgregarCuarto extends StatefulWidget{
  @override
  _AgregarCuartoState createState() => _AgregarCuartoState();
}

class _AgregarCuartoState extends State<AgregarCuarto> {
  List<Asset> images = List<Asset>();

  String _error = 'No error detected';

  @override
  void initState() {
    super.initState();
    this.getMoneyDataMoney();
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'Error no detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 7,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  String _mySelectionMoney;

  List dataMoney = List();

  Future<String> getMoneyDataMoney() async {
    var res = await rootBundle.loadString('jsons/monedas.json');
    var resBody = json.decode(res);

    setState(() {
      dataMoney = resBody;
    });

    //print(resBody);
    return 'Succesfull';
  }

  String _mySelectionOps;

  final _keyForm = GlobalKey<FormState>();

  String identifiers = "";
  String _uploadedFileUrl;
  ProgressDialog pr;

  final _ubicacionController = TextEditingController();

  final _precioController = TextEditingController();

  final _superficieTotalController = TextEditingController();

  final _superficieCubiertaController = TextEditingController();

  final _numeroCuartosController = TextEditingController();

  final _numeroSanitatriosController = TextEditingController();

  final _descripcionController = TextEditingController();

  final inmueblesBloc = InmueblesBloc();

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Inmoob'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _keyForm,
            child: Column(
              children: <Widget>[
                //Input de ubicacion de la propiedad
                TextFormField(
                  controller: _ubicacionController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Ubicación del inmueble',
                      labelText: 'Ubicación del inmueble'),
                ),

                //Input del precio de la propiedad
                TextFormField(
                  controller: _precioController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: 'Precio del inmueble',
                    labelText: 'Precio del inmueble',
                  ),
                  keyboardType: TextInputType.number,
                ),

                //Seleccionar tipo de cambio de moneda
                Center(
                  child: DropdownButton(
                    items: dataMoney.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['code'] +
                            ' ' +
                            item['name'] +
                            ' ' +
                            item['symbol']),
                        value: item['fullname'],
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        _mySelectionMoney = newVal;
                      });
                    },
                    hint: Text('Seleccionar moneda'),
                    value: _mySelectionMoney,
                  ),
                ),

                //Input del total de superficie
                TextFormField(
                  controller: _superficieTotalController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.swap_horizontal_circle),
                    hintText: 'Superficie total',
                    labelText: 'Superficie total',
                  ),
                  keyboardType: TextInputType.number,
                ),

                //Input de la superficie cubierta
                TextFormField(
                  controller: _superficieCubiertaController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.swap_horizontal_circle),
                    hintText: 'Superficie cubierta',
                    labelText: 'Superficie cubierta',
                  ),
                  keyboardType: TextInputType.number,
                ),

                //Input del numero de cuartos
                TextFormField(
                  controller: _numeroCuartosController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.room_service),
                    hintText: 'Numero de cuartos',
                    labelText: 'Numero de cuartos',
                  ),
                  keyboardType: TextInputType.number,
                ),

                //Input numero de baños
                TextFormField(
                  controller: _numeroSanitatriosController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.whatshot),
                    hintText: 'Numero de baños',
                    labelText: 'Numero de baños',
                  ),
                  keyboardType: TextInputType.number,
                ),

                //Seleccion de operaciones
                Center(
                  child: DropdownButton(
                    items: <String>['Venta', 'Renta']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newVal) {
                      setState(() {
                        _mySelectionOps = newVal;
                      });
                    },
                    hint: Text('Seleccionar operación'),
                    value: _mySelectionOps,
                  ),
                ),

                //TextArea descripcion del inmueble
                TextFormField(
                  controller: _descripcionController,
                  decoration: InputDecoration(
                    hintText: 'Descripcion (opcional)',
                    labelText: 'Descripcion (opcional)'
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),

                Center(
                  child: Text('Error: $_error'),
                ),

                //Botón para cargar las imagenes
                FlatButton.icon(
                  label: Text('Seleccionar fotos'),
                  onPressed: loadAssets,
                  icon: Icon(Icons.add_a_photo),
                ),

                //Vista para mostrar las imagenes cargadas
                GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(images.length, (index){
                    Asset asset = images[index];        
                    return AssetThumb(
                      asset: asset,
                      height: 300,
                      width: 300,
                    );
                  }),
                ),

                //Botón para añadir el inmueble
                FlatButton.icon(
                  icon: Icon(Icons.add_box),
                  label: Text('Añadir inmueble'),
                  onPressed: _agregarCuarto,
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

  _agregarCuarto() async {
    String ubicacion = _ubicacionController.text;
    int precio = int.tryParse(_precioController.text);
    String moneda = _mySelectionMoney.toString();
    int superficieTotal = int.tryParse(_superficieCubiertaController.text);
    int superficieCubierta = int.tryParse(_superficieCubiertaController.text);
    int numeroCuartos = int.tryParse(_numeroCuartosController.text);
    int numeroSanitarios = int.tryParse(_numeroSanitatriosController.text);
    String operacion = _mySelectionOps.toString();
    String descripcion = _descripcionController.text;
    List<String> _urls = List<String>();

    if (images.length != 0 || moneda == 'null' || operacion == 'null') {
      pr.show();

      for (var i = 0; i < images.length; i++) {
        ByteData byteData = await images[i].requestOriginal();
        List<int> imageData = byteData.buffer.asUint8List();
        StorageReference ref =
            FirebaseStorage.instance.ref().child(images[i].name);
        StorageUploadTask uploadTask = ref.putData(imageData);
        StorageTaskSnapshot snapshot = await uploadTask.onComplete;
        _uploadedFileUrl = await snapshot.ref.getDownloadURL();
        print(_uploadedFileUrl);
        _urls.add(_uploadedFileUrl);
        pr.update(message: 'Subiendo: ' + images[i].name);
      }

      FirebaseDatabase database = FirebaseDatabase.instance;
      database.reference().child('inmuebles').push().set({
        'ubicacion': ubicacion,
        'precio': precio,
        'moneda': moneda,
        'superficie_total': superficieTotal,
        'superficie_cubierta': superficieCubierta,
        'numero_recamaras': numeroCuartos,
        'numero_sanitarios': numeroSanitarios,
        'operacion': operacion,
        'descripcion': descripcion,
        'fotos': _urls,
        'tipo': 'Cuarto'
      }).whenComplete(_tareaCompletada);
    } else {
      Toast.show("Campos incomplentos", context);
    }
  }

  _tareaCompletada() {
    pr.update(message: 'Registro finalizado');
    pr.hide();
    Navigator.pop(context);
  }
}