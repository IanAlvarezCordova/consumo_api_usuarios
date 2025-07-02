import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/Usuario.dart';

class UsuarioControlador {

  // Base URL
  final String apiURL = 'http://localhost:9090/api/usuarios';

  // Obtener todos los usuarios
  Future<List<Usuario>> obtenerUsuarios() async {
    final response = await http.get(Uri.parse(apiURL));
    // Manejar estados del servidor
    if (response.statusCode == 200) {
      final List<dynamic> datos = jsonDecode(response.body);
      return datos.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener los usuarios');
    }
  }

  // Buscar por id
  Future<Usuario?> obtenerUsuarioPorId(int id) async {
    final response = await http.get(Uri.parse('$apiURL/$id'));
    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Error al obtener el usuario');
    }
  }

  // Crear un nuevo usuario
  Future<Usuario> crearUsuario(Usuario usuario) async {
    final response = await http.post(
      Uri.parse(apiURL),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()), // Convertir el usuario a JSON
    );
    if (response.statusCode == 201) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al crear el usuario');
    }
  }

  // Eliminar un usuario
  Future<void> eliminarUsuario(int id) async {
    final response = await http.delete(Uri.parse('$apiURL/$id'));
    if (response.statusCode != 204) {
      throw Exception('Error al eliminar el usuario');
    }
  }
  // Actualizar un usuario
  Future<Usuario> editarUsuario(int id, Usuario usuario) async {
    final response = await http.put(
      Uri.parse('$apiURL/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()),
    );
    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al editar el usuario');
    }
  }


}
