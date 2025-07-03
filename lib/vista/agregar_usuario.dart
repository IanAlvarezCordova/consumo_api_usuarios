import 'package:flutter/material.dart';
import '../modelo/Usuario.dart';
import '../controlador/usuariocontroller.dart';
class AgregarUsuario extends StatefulWidget {
  final VoidCallback refrescarLista;

  AgregarUsuario({super.key, required this.refrescarLista});

  @override
  _AgregarUsuarioState createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
  final UsuarioControlador _controlador = UsuarioControlador();
  final nombreController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Usuario'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nuevoUsuario = Usuario(
                  nombre: nombreController.text,
                  email: emailController.text,
                );
                try {
                  final usuarioCreado = await _controlador.crearUsuario(nuevoUsuario);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Usuario agregado con éxito: ${usuarioCreado.nombre}')),
                  );
                  widget.refrescarLista();
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al agregar el usuario: $e')),
                  );
                }
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}


