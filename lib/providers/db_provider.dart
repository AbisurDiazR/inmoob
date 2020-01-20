import 'dart:io';

import 'package:inmoob/modelos/inmueble_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBprovider{
  //Instancia y metodo de la base de datos
  static Database _database;
  static final DBprovider db = DBprovider._();

  //Constructor de la base de datos
  DBprovider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'inmuebles.db');

    return await openDatabase(
      path,
      version: 2,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await db.execute(
          'CREATE TABLE INMUEBLES('
          'id INTEGER PRIMARY KEY,'
          'ubicacion TEXT,'
          'precio INTEGER,'
          'moneda TEXT,'
          'superficieTotal INTEGER,'
          'superficieCubierta INTEGER,'
          'numeroRecamaras INTEGER,'
          'numeroSanitarios INTEGER,'
          'operacion TEXT,'
          'mesesRenta INTEGER,'
          'diasCobro INTEGER,'
          'estado TEXT,'
          'fotos TEXT,'
          'descripcion TEXT,'
          'tipo TEXT,'
          'servicios TEXT'
          ')'
        );
      }
    );
  }

  //metodo insert inmueble
  nuevoInmueble(Inmueble inmueble) async{
    final db = await database;

    //Transformamos el objeto en un map y hace un insert
    final res = db.insert("Inmuebles", inmueble.toJson());

    print(res);

    return res;
  }

  //Obtenemos todos los inmuebles
  Future<List<Inmueble>> getAllInmuebles() async{
    final db = await database;
    
    final res = await db.query('Inmuebles');

    List<Inmueble> list = res.isNotEmpty ? res.map( (c) =>  Inmueble.fromJson(c) ).toList() : [];
    return list;
  }

  Future<Inmueble> getInmuebleById(int id) async{
    final db = await database;

    final res = await db.query('Inmuebles',where: 'id = ?', whereArgs:  [id]);

    return res.isNotEmpty ? Inmueble.fromJson(res.first) : null;
  }

  //borrar inmueble
  Future<int> deleteInmuebleById(int id) async{
    final db = await database;
    final res = db.delete('Inmuebles',where: 'id = ?', whereArgs: [id]);
    return res;
  }

  //borrar base de datos
  Future<int> deleteInmuebles() async{
    final db = await database;
    final res = db.rawDelete('DELETE FROM Inmuebles');
    return res;
  }
}