/* Aqui se realizan las operaciones basicas con la base de datos */

import 'package:app_catalogo/models/catalogo.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    /* Se tiene que pasar la ruta de la base de datos, se usa un join para
    obtener la ruta donde se guardan las bases de datos y para indicar cual
    fichero se usa en especifico*/
    return openDatabase(
        'C:/Users/Angela/Desktop/FlutterApps/app_catalogo/BD SQLitegreenhouseapp.db',

        // Si la base de datos no existe, se va a crear
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE productos (id INTEGER PRIMARY KEY, nombre TEXT, descripcion TEXT, precio REAL, imgURL TEXT)",
      );
    }, version: 1);
  }

  //Metodo para registrar productos en la base de datos
  static Future<Future<int>> insert(Producto producto) async {
    //se conecta con la base de datos
    Database database = await _openDB();

    //se realiza la insercion en la base
    return database.insert("productos", producto.toMap());
  }

  //Metodo para eliminar productos en la base de datos
  static Future<Future<int>> delete(Producto producto) async {
    //se conecta con la base de datos
    Database database = await _openDB();

    //se realiza la eliminacion en la base con la condicion del id
    return database
        .delete("productos", where: "id = ?", whereArgs: [producto.id]);
  }

  //Metodo para modificar productos en la base de datos
  static Future<Future<int>> update(Producto producto) async {
    //se conecta con la base de datos
    Database database = await _openDB();

    //se realiza la actualizacion, con la condicion del id del producto
    return database.update("productos", producto.toMap(),
        where: "id = ?", whereArgs: [producto.id]);
  }

  //Metodo para consultar el listado de productos existentes en la base de datos
  static Future<List<Producto>> productos() async {
    //se conecta con la base de datos
    Database database = await _openDB();

    //se realiza la consulta a la base de datos
    final List<Map<String, dynamic>> productosMap =
        await database.query("productos");

    return List.generate(
        productosMap.length,
        (i) => Producto(
            id: productosMap[i]['id'],
            nombre: productosMap[i]['nombre'],
            descrip: productosMap[i]['descripcion'],
            precio: productosMap[i]['precio'],
            imgURL: productosMap[i]['imgURL']));
  }
}
