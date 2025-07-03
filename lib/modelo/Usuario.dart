class Usuario {
  final int? id;
  final String nombre;
  final String email;

  // Constructor
  Usuario({
    this.id, // Ahora es opcional
    required this.nombre,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'email': email,
    };
  }
}