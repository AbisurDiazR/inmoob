import 'package:firebase_database/firebase_database.dart';

class ModeloInmueble {
  static const KEY = "key";
  static const UBICACION = "ubicacion";
  static const PRECIO = "precio";
  static const MONEDA = "moneda";
  static const SUPERFICIE_TOTAL = "superficie_total";
  static const SUPERFICIE_CUBIERTA = "superficie_cubierta";
  static const NUMERO_RECAMARAS = "numero_recamaras";
  static const NUMERO_SANITARIOS = "numero_sanitarios";
  static const OPERACION = "operacion";
  static const FOTOS = "fotos";
  static const DESCRIPCION = "descripcion";
  static const TIPO = "tipo";

  String key;
  String ubicacion;
  int precio;
  String moneda;
  int superficieTotal;
  int superficieCubierta;
  int numeroRecamaras;
  int numeroSanitarios;
  String operacion;
  int mesesRenta;
  int diasCobro;
  String estado;
  List fotos;
  String descripcion;
  String tipo;
  String servicios;

  ModeloInmueble(this.ubicacion,this.precio,this.moneda,this.superficieTotal,this.superficieCubierta,
  this.numeroRecamaras,this.numeroSanitarios,this.operacion,this.mesesRenta,this.diasCobro,
  this.estado, this.fotos, this.descripcion, this.tipo, this.servicios);

  ModeloInmueble.fromSnapshot(DataSnapshot snapshot):
    this.key = snapshot.key,
    this.ubicacion = snapshot.value[UBICACION],
    this.precio = snapshot.value[PRECIO],
    this.moneda = snapshot.value[MONEDA],
    this.superficieTotal = snapshot.value[SUPERFICIE_TOTAL],
    this.superficieCubierta = snapshot.value[SUPERFICIE_CUBIERTA],
    this.numeroRecamaras = snapshot.value[NUMERO_RECAMARAS],
    this.numeroSanitarios = snapshot.value[NUMERO_SANITARIOS],
    this.operacion = snapshot.value[OPERACION], 
    this.fotos = snapshot.value[FOTOS], 
    this.descripcion = snapshot.value[DESCRIPCION], 
    this.tipo = snapshot.value[TIPO];

  Map toMap(){
    return {UBICACION:ubicacion,PRECIO:precio,MONEDA:moneda,SUPERFICIE_TOTAL:superficieTotal,
    SUPERFICIE_CUBIERTA:superficieCubierta,NUMERO_RECAMARAS:numeroRecamaras,NUMERO_SANITARIOS:numeroSanitarios,
    OPERACION:operacion,FOTOS:fotos,DESCRIPCION:descripcion,TIPO:tipo};
  }
}
