import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Practica 1';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ListWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  _ListWidget createState() => _ListWidget();
}

class _ListWidget extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Alumnos'),
      ),
      body: ListView.builder(
          itemCount: personas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(
                    personas[index].nombre + " " + personas[index].apellido),
                subtitle: Text(personas[index].cuenta),
                leading: CircleAvatar(
                  child: Text(personas[index].nombre.substring(0, 1)),
                ),
                trailing: const Icon(Icons.arrow_forward_ios));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Persona.agregarPersona('Juan', 'Lopez', '123456');
          setState(() {});
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}

class Persona {
  String nombre;
  String apellido;
  String cuenta;

  Persona(this.nombre, this.apellido, this.cuenta);

  static void agregarPersona(String nombre, String apellido, String cuenta) {
    personas.add(Persona(nombre, apellido, cuenta));
  }
}

List<Persona> personas = [
  Persona('Radames', 'Ramirez', '20166932'),
  Persona('Gabriel', 'Cruz', '4482'),
  Persona('Missael', 'Peralta', '20166916'),
];
