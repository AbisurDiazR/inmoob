import 'package:flutter/material.dart';
import 'package:inmoob/formularios/formulario_bodega.dart';
import 'package:inmoob/formularios/formulario_casa.dart';
import 'package:inmoob/formularios/formulario_cuarto.dart';
import 'package:inmoob/formularios/formulario_departamento.dart';
import 'package:inmoob/formularios/formulario_hacienda.dart';
import 'package:inmoob/formularios/formulario_hotel.dart';
import 'package:inmoob/formularios/formulario_local.dart';
import 'package:inmoob/formularios/formulario_oficina.dart';
import 'package:inmoob/formularios/formulario_rancho.dart';
import 'package:inmoob/formularios/formulario_terreno.dart';

class AgregarInmueble extends StatelessWidget {
  Widget build(BuildContext context) {

    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          //Añadir casa
          GestureDetector(
            onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => AgregarCasa())
              ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/house.png'),
                    height: 100.0,
                  ),
                  Text(
                    'Agregar casa',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              color: Colors.teal[100],
            ),
          ),

          //Añadir local
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarLocal())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/shop.png'),
                    height: 100.0,
                  ),
                  Text(
                    'Agregar local',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              color: Colors.teal[200],
            ),
          ),

          //Añadir terreno
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarTerreno())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/shovel.png'),
                    height: 100.0,
                  ),
                  Text(
                    'Agregar terreno',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              color: Colors.teal[300],
            ),
          ),

          //Añadir hotel
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarHotel())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/hotel.png'),
                    height: 100.0,
                  ),
                  Text(
                    'Agregar hotel',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              color: Colors.teal[400],
            ),
          ),

          //Agregar hacienda
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarHacienda())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/state.png'),
                    height: 100.0,
                  ),
                  Text(
                    'Agregar hacienda',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              color: Colors.teal[500],
            ),
          ),

          //Añadir oficina
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarOficina())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/office.png'),
                    height: 100.0,
                  ),
                  Text(
                    'Agregar oficina',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              color: Colors.teal[600],
            ),
          ),

          //Añadir departamento
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarDepartamento())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/department.png'),
                    height: 100.0,
                  ),
                  Text('Agregar departamento', style: TextStyle(fontSize: 15.0))
                ],
              ),
              color: Colors.teal[700],
            ),
          ),

          //Añadir cuarto
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarCuarto())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/room.png'),
                    height: 100.0,
                  ),
                  Text('Agregar cuarto', style: TextStyle(fontSize: 15.0))
                ],
              ),
              color: Colors.teal[800],
            ),
          ),

          //Añadir bodega
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarBodega())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/warehouse.png'),
                    height: 100.0,
                  ),
                  Text('Agregar bodega',
                      style: TextStyle(fontSize: 15.0, color: Colors.white))
                ],
              ),
              color: Colors.teal[900],
            ),
          ),

          //añadir rancho
          GestureDetector(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgregarRancho())
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/ranch.png'),
                    height: 100.0,
                  ),
                  Text('Agregar rancho', style: TextStyle(fontSize: 15.0))
                ],
              ),
              color: Colors.teal[100],
            ),
          ),

        ],//fin del widget

      ),//fin del GridView

    );

  }
}
