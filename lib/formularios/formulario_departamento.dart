import 'dart:convert';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inmoob/bloc/inmuebles_bloc.dart';
import 'package:inmoob/modelos/inmueble_model.dart';
//import 'package:inmoob/providers/db_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

class AgregarDepartamento extends StatefulWidget{
  @override
  _AgregarDepartamentoState createState() => _AgregarDepartamentoState();
}

class _AgregarDepartamentoState extends State<AgregarDepartamento> {
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
                  children: List.generate(images.length, (index) {
                    Asset asset = images[index];
                    fileName(asset);
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
                  onPressed: _agregarInmueble,
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

  _agregarInmueble() async{
    var id = new Random();
    String ubicacion = _ubicacionController.text;
    int precio = int.tryParse(_precioController.text);
    String moneda = _mySelectionMoney.toString();
    int superficieTotal = int.tryParse(_superficieCubiertaController.text);
    int superficieCubierta = int.tryParse(_superficieCubiertaController.text);
    int numeroCuartos = int.tryParse(_numeroCuartosController.text);
    int numeroSanitarios = int.tryParse(_numeroSanitatriosController.text);
    String operacion = _mySelectionOps.toString();
    String descripcion = _descripcionController.text;
    String fotos = identifiers;

    final inmueble = Inmueble(
      id: id.nextInt(1000),
      ubicacion: ubicacion, 
      precio: precio,
      moneda: moneda,
      superficieTotal: superficieTotal,
      superficieCubierta: superficieCubierta,
      numeroRecamaras: numeroCuartos,
      numeroSanitarios: numeroSanitarios,
      operacion: operacion,
      descripcion: descripcion,
      fotos: fotos,
      tipo: 'Departamento',
    );
    if (fotos.length == 0) {
      Toast.show('Debe añadir fotos para registrar', context);
    } else {
      inmueblesBloc.agregarInmueble(inmueble);
      Navigator.pop(context);
    }
  }

  Future<File> writeToFile(ByteData data, Asset asset) async{
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/' + asset.name;
    identifiers += tempPath + '/' + asset.name + "\n";
    return File(filePath).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<File> fileName(Asset asset) async{
    File filePath = await writeToFile(await asset.getByteData(), asset);
    return filePath;
  }
}