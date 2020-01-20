import 'dart:async';

import 'package:inmoob/modelos/inmueble_model.dart';
import 'package:inmoob/providers/db_provider.dart';

class InmueblesBloc{
  //Creamos y hacemos referencia a un constructor privado
  static final InmueblesBloc _inmueblesBloc = new InmueblesBloc._internal();

  factory InmueblesBloc(){
    return _inmueblesBloc;
  }
  
  InmueblesBloc._internal(){
    //Obtener inmuebles de la base de datos
  }

  //Creamos el stream para el flujo de datos
  final _inmueblesController = StreamController<List<Inmueble>>.broadcast();

  Stream<List<Inmueble>> get inmuebleStream => _inmueblesController.stream;

  dispose(){
    _inmueblesController?.close();
  } 

  obtenerInmuebles() async{
    _inmueblesController.sink.add( await DBprovider.db.getAllInmuebles() );
  }

  agregarInmueble(Inmueble inmueble) async{
    await DBprovider.db.nuevoInmueble(inmueble);
    obtenerInmuebles();
  }

  borrarInmueble(int id) async{
    await DBprovider.db.deleteInmuebleById(id);
    obtenerInmuebles();
  }

  borrarTodo() async{
    await DBprovider.db.getAllInmuebles();
    obtenerInmuebles();
  }
}