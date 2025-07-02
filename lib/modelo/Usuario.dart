class Usuario {
  final int id;
  final String nombre;
  final String email;

  // Constructor
  Usuario({
    required this.id,
    required this.nombre,
    required this.email,
  });

  // Método para crear un Usuario desde un JSON
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
    );
  }

  // Método para convertir un Usuario a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,         // Se incluye el id
      'nombre': nombre,
      'email': email,
    };
  }
}
